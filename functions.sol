 pragma solidity ^ 0.5.8;

    /** @author Hanan
    *   Smart contract explaining functions
    */
    contract Function{
        int public var1;
        int public var2;
    
    // setter function
    function setvalue(int _var1 , int _var2) public {
        var1 = _var1;
        var2 = _var2;
    }
    function getvalue() public view returns(int _total) {
        _total = var1 + var2;
        return _total;
    }
}