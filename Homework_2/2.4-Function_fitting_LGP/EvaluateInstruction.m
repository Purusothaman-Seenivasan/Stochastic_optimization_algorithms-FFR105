function functionValue= EvaluateInstruction(instruction, registers)
    limit =10^10;
    operator = instruction(1);
    operand1= registers(instruction(3));
    operand2 = registers(instruction(4));

    if operator ==1
        functionValue= operand1+operand2;
    elseif operator ==2
        functionValue= operand1 - operand2;
    elseif operator == 3
        functionValue= operand1*operand2;
    elseif operator ==4
        if operand2 ==0
            functionValue=limit;
        else
            functionValue= operand1/operand2;
        end
    end
end