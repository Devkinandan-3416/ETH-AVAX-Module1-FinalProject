# Ethereum+AVAX Intermediate Course Project: FUNCTIONS AND ERRORS

This is the basic demonstration of Error Handling using the Solidity programming language. It explains the need and a real-life use case of error handling using revert, require and assert statements.

## Description

This program is a simple contract written in Solidity that explains how to handle unwanted errors or to ensure uninterrupted execution of the program using the revert, require and assert statements.

Require() - takes in two parameters, first one is condition check and another is the message that is to be executed if the condition fails to be true.

Revert() - takes only one parameter that is the message that gets executed whenever the revert statement is called or the condition check is true for the same if block in which revert stmt. is lying. Also, saves unconsumed gas by reverting the state of contract to its initial state.

Assert() - takes only one parameter that is condition check which needs to be true for further execution of the program.

## Implementation

"assignGrade" func. Check for the input to lie between 0 and 100 using require() stmt. If true, save the entered marks, and an event is fired for retrieving the address and score of the student else return the message i.e. Grade must be between 0 and 100.

"getGrade" func. Check for the retrieved score to be at least greater than 0 using assert() stmt. Furthermore, using the if-else block to assign to Grades to the student according to his/her marks and at last in the else condition using the revert() function to print message i.e."Failed" for a student whose marks lie in (0,32).


## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., errHandle.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GradeSystem {
    address public teacher;
    mapping(address => uint256) public scores;
    uint256 public totalStudents;

    event GradeAssigned(address student, uint256 grade);
    event EtherReceived(address sender, uint256 amount);

    constructor() {
        teacher = msg.sender;
    }

    modifier onlyTeacher() {
        require(msg.sender == teacher, "Only the teacher can perform this action");
        _;
    }

    function assignGrade(address student, uint256 grade) external onlyTeacher {
        require(grade >= 0 && grade <= 100, "Grade must be between 0 and 100");

        scores[student] = grade;
        emit GradeAssigned(student, grade);
        totalStudents++;
    }

    function getGrade(address student) external view returns (string memory) {
        uint256 score = scores[student];
        assert(score > 0);

        if (score >= 95) {
            return "A+";
        } else if (score >= 85) {
            return "A";
        } else if (score >= 75) {
            return "B+";
        } else if (score >= 65) {
            return "B";
        } else if (score >= 55) {
            return "C+";
        } else if (score >= 45) {
            return "C";
        } else if (score >= 32) {
            return "D";
        } else {
            revert("Failed");
        }
    }

    receive() external payable {
        emit EtherReceived(msg.sender, msg.value);
        // Handle Ether received, if needed
    }
}
```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.7" (or another compatible version), and then click on the "Compile errHandle.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "GradeSystem" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the assignGrade and getGrade functions. Click on the "GradeSystem" contract in the left-hand sidebar, and then click on the "assignGrade/getGrade" function. Finally, click on the "transact" button to execute the function and with the help of require(), revert(), and assert() functions, retrieve the uninterrupted outputs by all the functions.
## Authors
Devkinandan Garg
