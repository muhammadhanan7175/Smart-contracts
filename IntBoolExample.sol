 pragma solidity ^ 0.5.8;

    /** @author Hanan
    *   Smart contract defining use of optimum variable for gas efficiency
    */
    contract IntBoolExample{

    int8 public var1;           // int8 means we can store decimal in range -127 - 128
    uint8 public var2;          // uint8 means we can store decimal in range 0 - 256
    bool public flag;

    /** @dev function is used to set  values of the state variable declared above
    * param _int8 , _uint8 , _flagvar
    */
    function SetIntBoolDetails (int8 _int8 , uint8 _uint8 , bool _flagvar) public{

        var1 = _int8;
        var2 = _uint8;
        flag = _flagvar;
    }

}