// SPDX-License-Identifier: MIT
pragma solidity 0.8.33;

import {Test} from "forge-std/Test.sol";
import {Calculator} from "../src/Calculator.sol";

contract CalculatorTest is Test {

    Calculator calculator;
    address admin = vm.addr(1);
    address user = vm.addr(2);

    function setUp() public{
        calculator = new Calculator(admin);
    }

    function testAddition() public{
        uint256 _num1 = 250;
        uint256 _num2 = 250;
        assert(_num1 + _num2 == calculator.addition(_num1, _num2));
    }

    function testSubstraction() public{
        uint256 _num1 = 250;
        uint256 _num2 = 250;
        assert(_num1 - _num2 == calculator.substraction(_num1, _num2));
    }

    function testMultiplicationOverflow() public{
        uint256 _num1 = 2;
        uint256 _num2 = 11579 * 10**73; // near max(uint256)
        vm.expectRevert();
        calculator.multiplication(_num1, _num2);
    }

    function testDivisionNotAdmin() public{
        uint256 _num1 = 250;
        uint256 _num2 = 250;

        vm.prank(user);
        vm.expectRevert();
        calculator.division(_num1, _num2);
        vm.stopPrank();
    }

    function testDivisionAdmin(uint256 _num1, uint256 _num2) public{
        vm.prank(admin);
        assert(_num1 / _num2 == calculator.division(_num1, _num2));
        vm.stopPrank();
    }

}