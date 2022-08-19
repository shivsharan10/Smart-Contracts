pragma solidity ^0.4.18;
contract propertyTransfer {
    address public DA;
    uint256 public totalNoProperty;
    function PropertyTransfer(){
        DA=msg.sender;
    }
    modifier onlyOwner(){
        require(msg.sender == DA);
        _;}
        struct Property{
            string name;
            bool isSold;
            }
    mapping(address => mapping(uint256 => Property)) public propertiesOwner;
    mapping(address => uint256) individualCountOfPropertyPerOwner;

    event PropertyAllocated(address indexed _verifiedOwner, uint256 indexed _totalNoOfPropertyCurrently, string _nameOfProperty, string msg);
    event PropertyTransferred(address indexed _from, address indexed _to, string _propertyName, string _msg);
    function getPropertyCountOfAnyAddress(address _ownerAddress) constant returns (uint256){
        uint count=0;
        for(uint i=0;i<individualCountOfPropertyPerOwner[_ownerAddress];i++){
            if(propertiesOwner[_ownerAddress][i].isSold!=true)
            count++;
        }
        return count;
            }
    function allotProperty(address _verifiedOwner, string _propertyName)onlyOwner
    {
        propertiesOwner[_verifiedOwner][individualCountOfPropertyPerOwner[_verifiedOwner]++].name = _propertyName;
        totalNoProperty++;
        PropertyAllocated(_verifiedOwner, individualCountOfPropertyPerOwner[_verifiedOwner], _propertyName, "property allotted successfully");

    }
    function isOwner(address _checkOwnerAddress, string _propertyName) constant returns (uint){
        uint i;
        bool flag;
        for(i=0;i<individualCountOfPropertyPerOwner[_checkOwnerAddress];i++)
        {
            if(propertiesOwner[_checkOwnerAddress][i].isSold==true){
                break;
            }
            flag = stringEqual(propertiesOwner[_checkOwnerAddress][i].name, _propertyName);
            if(flag==true){
                break;
            }
        }
        if(flag==true){
            return i;
        }
        else{
            return 9999999;
        }
    }

    function stringEqual (string a1, string a2) constant returns (bool)
    {
        return sha3(a1)== sha3(a2)?true:false;
    }

    function transferProperty(address _to, string _propertyName)
    returns (bool, uint)
    {
        uint256 checkOwner = isOwner(msg.sender, _propertyName);
        bool flag;
        if(checkOwner!=999999 && propertiesOwner[msg.sender][checkOwner].isSold==false){
    propertiesOwner[msg.sender][checkOwner].isSold=true;
    propertiesOwner[msg.sender][checkOwner].name="Sold";
    propertiesOwner[_to][individualCountOfPropertyPerOwner[_to]++].name = _propertyName;
    flag = true;
    PropertyTransferred(msg.sender, _to, _propertyName, "Owner has been changed.");
    }
    else{
        flag = false;
        PropertyTransferred(msg.sender, _to, _propertyName, "Owner doen't own the property.");
        return(flag, checkOwner);
        }
    }
}
