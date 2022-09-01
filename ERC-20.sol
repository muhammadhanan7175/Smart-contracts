pragma solidity ^ 0.5.3;
    // token interface
interface IERC20{
    //totalsupply :tells us the total number of tokens rolled out
    function totalSuplly() external view returns(uint);
    //balanceof: tells the remaining tokens holded by owner
    function balanceOf(address _owner) external view returns(uint);
    //transfer: is used to send token at any desired address
    function transfer(address _to, uint _value) external  returns(bool);
    //approve: it approves spender to use his own token
    function approve(address _spender, uint _value) external  returns (bool);
    //transferFrom: Once approved it is used to tranfer the approved tokens to spender
    function transferFrom(address _from , address _to , uint _value) external  returns (bool);
    //allowance : it tells us about the remaining approved tokens
    function allowance(address _owner, address _spender) external returns (uint);
    //it logs the activity of transfer function
    event transfered(address indexed _from , address indexed _to , uint value);
    // it is used to log the activity of approved function
    event approved(address indexed _owner , address indexed _spender , uint value);

}
 contract ERC20 is IERC20{
     mapping(address => uint256) private _balnaces;
     mapping(address =>mapping(address => uint256)) private _allowed;
     // token details
     string public tokenName = 'spark' ;
     string public symbol = '$pK' ;
     uint public decimal = 0 ;
     uint private _totalSupply;
     address public _creator;
     constructor() public{
         _creator = msg.sender;
         _totalSupply = 50000;
        _balnaces[_creator] = _totalSupply;
     }
     function totalSuplly() external view returns(uint){
         return _totalSupply;
     }
     function balanceOf(address _owner) external view returns(uint256 balance){
         return _balnaces[_owner];
     }
     function transfer(address _to, uint _value) external  returns(bool){
        require(_value > 0 && _balnaces[msg.sender] >= _value);
         _balnaces[_to]+= _value;
         _balnaces[msg.sender]-= _value;
         emit transfered(msg.sender , _to , _value);
     }
     function approve(address _spender, uint _value) external  returns (bool){
         require(_value > 0 && _balnaces[msg.sender] >= _value);
         _allowed[msg.sender][_spender] = _value ;
         emit approved (msg.sender , _spender , _value);
        return true;
     }
     function transferFrom(address _from , address _to , uint _value) external  returns (bool){
          require(_value > 0 && _balnaces[_from] >= _value && _allowed[_from][_to] >= _value);
         _balnaces[_to]+= _value;
         _balnaces[_from]-= _value;
         _allowed[_from][_to] -= _value;
         return true;
     }
     function allowance(address _owner, address _spender) external returns (uint){
         return _allowed[_owner][_spender] ;
     }
 }