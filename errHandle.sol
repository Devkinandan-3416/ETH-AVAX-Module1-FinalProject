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
