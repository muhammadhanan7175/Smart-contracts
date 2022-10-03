pragma solidity ^0.5.3;
    /**
    * @author Muhammad Hanan
    * Smart contract for explaining var types (Local / State)
    */
contract varType{
    int public var1;            // State var with public qualifier 
    string public var2;         // public (visibility qualifiers) automatically provides gettter

    /**
    * Function sets value of state variable var1
    */
function f1 () public {
    int _var1 =2 ;          // _var1 is a local variable and doesnt cost gas fee
    var1 = _var1;
}

    /**
    * Same as F1
    */
function f2 () public {
    string memory _var2 =" honey";    // var 2 is also a local variable
    var2 = _var2;
}

}