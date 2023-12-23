function y =FindFunction(chromosome, noOfvariables, constant,x)
    noOfConstant= length(constant);
    numberOfRegisters= noOfConstant+ noOfvariables;
    limit=10^10;
    registers = zeros(1, numberOfRegisters + 1); 

    registers(1) = x; 

    
    numInstructions = length(chromosome) / 4;

    for j = 1:numInstructions
        startIndex = 4 * (j - 1) + 1;
        instruction = chromosome(startIndex:startIndex + 3);
        operator = instruction(1);
        x = instruction(2);
        operand1 = registers(instruction(3) + 1); 
        operand2 = registers(instruction(4) + 1);

        
        if operator ==1
            x= operand1+operand2;
        elseif operator ==2
            x= operand1 - operand2;
        elseif operator == 3
            x= operand1*operand2;
        elseif operator ==4
            if operand2 ==0
                x=limit;
            else
                x= operand1/operand2;
            end
        end
    end

    
    y = registers(1);
end