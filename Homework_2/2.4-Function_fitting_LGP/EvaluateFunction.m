function functionValue= EvaluateFunction(chromosome,x,registers)
    
    registers(1) = x;

    for j = 1:4:length(chromosome)
        instruction = chromosome(j:j+3);
        destinationIndex = instruction(2);

 
        registers(destinationIndex) = EvaluateInstruction(instruction, registers);
    end
    

    functionValue = registers(1);
end
    
    
