// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

import {Test} from "forge-std/Test.sol";
import {Calculator} from "../src/Calculator.sol";

contract CalculatorTest is Test {

    Calculator calculator;
    address admin = vm.addr(1);

    function setUp() public{
        calculator = new Calculator(admin);
        
    }

    function testAddition(uint256 _num1, uint256 _num2) public{
        //uint256 _num1 = 250;
        //uint256 _num2 = 250;
        assert(_num1 + _num2 == calculator.addition(_num1, _num2));
    }

}