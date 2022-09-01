pragma solidity ^ 0.5.3;
contract votting{
    address public owner;
    address [] public candidatelist;
    mapping  (address => uint) private votes;
    address public winner;
    uint winnervotes;
    enum votingstatus{notstarted , running , completed}
    votingstatus public status;
    constructor () public {
        owner = msg.sender ;
    }
    modifier ownerOnly{
        if(msg.sender == owner){
            _;
        }
    }
    function setStatus() public {
        if(status != votingstatus.completed)
        status = votingstatus.running;
        else
        {
            status = votingstatus.completed;
        }
    }
    function registerCandidate(address _candidates) ownerOnly public{
        candidatelist.push(_candidates);
    }
    function voting(address _candidate) public{
        require(validCandidate(_candidate),"Invalid candidate");
        require(status == votingstatus.running,"voting closed");
        votes [_candidate]+= 1 ;
    }
    function validCandidate(address _candidate) private view returns(bool) {
        for(uint i = 0; i < candidatelist.length; i++)
        {
            if(candidatelist[i] == _candidate)
            return true;
        }
        return false;
    }
    function votecount(address _candidate) public view returns (uint){
         require(validCandidate(_candidate),"Invalid candidate");
         require(status == votingstatus.running,"voting closed");
        return votes[_candidate];
    }
    function elected() public {
        require(status == votingstatus.completed,"voting still in progress");
        for (uint i = 0; i < candidatelist.length; i++)
        {
            if(votes[candidatelist[i]] > winnervotes)
           {
                winnervotes = votes[candidatelist[i]];
                winner = candidatelist[i];
           }
        }
    }
}