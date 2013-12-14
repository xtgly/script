@echo off
wmic ENVIRONMENT create name="a",username="<system>",VariableValue="1"
pause