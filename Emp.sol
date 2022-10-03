pragma solidity ^0.5.3;
/**
    @author Muhammad Hanan
    Smart contract for capturing employ details
 */
contract EmpName{
    string Empname;
    uint Age;

         /** @dev for storing emply details
            @param  "empname" takes employ name
            @param  "age" takes age of employ 
          */ 
            

    constructor (string memory _empName , uint _age) public {
        Empname = _empName;
        Age = _age;
    }
            /** 
            @dev for resetting employ details
            @param  "empname" takes employ name
            @param  "age" takes age of employ 
            */ 
    function setEmpDetail(string memory _empName, uint _age ) public {
        Empname = _empName;
        Age = _age;
    }

     /** 
            @dev for viewing employ details
            */
    function getEmpDetail() public view returns (string memory , uint ) {
      return (Empname,Age);
    }
}