// SPDX-License-Identifier: MIT

pragma solidity 0.8.33;

event Sum(uint256, uint256);
event Substraction(uint256, uint256);
event Multiplication(uint256, uint256);
event Division(uint256, uint256);

contract Calculator{

    address public admin;
    constructor(address _admin){
        admin = _admin;
    }

    modifier onlyAdmin(){
        require(msg.sender == admin, "Not admin");
        _;
    }

    function addition(uint256 _num1, uint256 _num2) external returns(uint256 _result){
        _result = _num1 + _num2;
        emit Sum(_num1, _num2);
    }
    function substraction(uint256 _num1, uint256 _num2) external returns(uint256 _result){
        _result = _num1 - _num2;
        emit Substraction(_num1, _num2);
    }
    function multiplication(uint256 _num1, uint256 _num2) external returns(uint256 _result){
        _result = _num1 * _num2;
        emit Multiplication(_num1, _num2);
    }
    function division(uint256 _num1, uint256 _num2) onlyAdmin external returns(uint256 _result){
        _result = _num1 / _num2;
        emit Division(_num1, _num2);
    }
}