pragma solidity ^0.5.3;
contract EmpName{
    string Empname;
    uint Age;
    constructor (string memory _empName , uint _age) public {
        Empname = _empName;
        Age = _age;
    }
    function setEmpDetail(string memory _empName, uint _age ) public {
        Empname = _empName;
        Age = _age;
    }
    function getEmpDetail() public view returns (string memory , uint ) {
      return (Empname,Age);
    }
}