# These test cases can be run with mvn install

*** Settings ***
Documentation   Testing if program is correct
Resource        ../Common_Resource.robot

*** Variables ***
${mainClass}    Application

*** Test Cases ***
Path to main class should be correct
    ${result} =  Check Path  ${mainClass}
    Should contain  ${result}   target\\classes\\${mainClass}

Should return warning when no argumens are provided
    ${result} =  Run Java Class  ${mainClass}
    Should be equal as strings     ${result}   You must input 3 or 4 parameters

Should return a triangle when all sides are equal
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 2
    Should be equal as strings     ${result}   You can build a triangle

Should return a triangle one side is slightly shorter
    ${result} =  Run Java Class With Args  ${mainClass}   1 2 2
    Should be equal as strings     ${result}   You can build a triangle

Should not return a triangle one side is significantly longer
    ${result} =  Run Java Class With Args  ${mainClass}   10 2 2
    Should be equal as strings     ${result}   You can't build a figure

Should return a square when all sides are equal
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 2 2
    Should be equal as strings     ${result}   You can build a square

Should return a rectangle when two pairs of sides are equal
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 4 4
    Should be equal as strings     ${result}   You can build a rectangle

Should not return a figure when one side is significantly longer
    ${result} =  Run Java Class With Args  ${mainClass}   3 3 2 100
    Should be equal as strings     ${result}   You can't build a figure

Should return a trapezoid when only one side is longer
    ${result} =  Run Java Class With Args  ${mainClass}   2 2 2 4
    Should be equal as strings     ${result}   You can build a trapezoid

Should return a trapezoid when only one side is shorter
    ${result} =  Run Java Class With Args  ${mainClass}   4 4 2 4
    Should be equal as strings     ${result}   You can build a trapezoid

Should return a trapezoid when all sides are different
    ${result} =  Run Java Class With Args  ${mainClass}   1 2 3 4
    Should be equal as strings     ${result}   You can build a trapezoid