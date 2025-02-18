
pragma solidity ^0.8.0;

contract TicketIssuance {
    
    struct Ticket {
        uint ticketNo;
        string customerName;
    }

   
    Ticket[] public tickets;


    uint public maxQueueSize;

    event TicketIssued(uint ticketNo, string customerName);

   
    constructor(uint _maxQueueSize) {
        maxQueueSize = _maxQueueSize;
    }

    
    function issueTicket(string memory customerName) public {
        require(tickets.length < maxQueueSize, "Queue is full, no more tickets can be issued.");
        
        uint ticketNo = tickets.length + 1; 
        tickets.push(Ticket(ticketNo, customerName)); 
        
        emit TicketIssued(ticketNo, customerName);
    }

    
    function getTicket(uint ticketNo) public view returns (string memory customerName) {
        require(ticketNo > 0 && ticketNo <= tickets.length, "Ticket number is invalid.");
        return tickets[ticketNo - 1].customerName;
    }

  
    function getIssuedTicketsCount() public view returns (uint) {
        return tickets.length;
    }
}
