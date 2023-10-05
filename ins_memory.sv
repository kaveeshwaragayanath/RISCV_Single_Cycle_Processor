module ins_memory 
    (input wire clk,          // Clock input
     input wire [7:0] address_in,  
     output wire [31:0] instruction_out  // Data output for read
    );
	 
	  reg [31:0] ins_mem [0:255];
	  
	  assign ins_mem[0]   = 32'b00000000001101001010001100000011; //      and  r0,r0,r0           ALUResult = h0 = r0          
	  assign ins_mem[4]   = 32'h00000000010001001010001100000011; //      addi r1,r0, 1           ALUResult = h1 = r1
     assign ins_mem[8]   = 32'h00000000010101001010001100000011; //      addi r2,r0, 2           ALUResult = h2 = r2
     assign ins_mem[12]  = 32'h0001f1b3; //      addi r3,r1, 3           ALUResult = h4 = r3
     assign ins_mem[16]  = 32'h00408213; //      addi r4,r1, 4           ALUResult = h5 = r4
     assign ins_mem[20]  = 32'h00510293; //      addi r5,r2, 5           ALUResult = h7 = r5
     assign ins_mem[24]  = 32'h00610313; //      addi r6,r2, 6           ALUResult = h8 = r6
     assign ins_mem[28]  = 32'h00718393; //      addi r7,r3, 7           ALUResult = hB = r7
     assign ins_mem[32]  = 32'h00208433;//      add  r8,r1,r2           ALUResult = h3 = r8
//     assign ins_mem[9]   = 32'h404404b3;//      sub  r9,r8,r4           ALUResult = hfffffffe = -2 = r9
//     assign ins_mem[10]  = 32'h00317533;//      and r10 = r2 & r3       ALUResult = h0 = r10
//     assign ins_mem[11]  = 32'h0041e5b3;//      or  r11 = r3 | r4       ALUResult = h5 = r11
//     assign ins_mem[12]  = 32'h02b20263;//      beq r4,r11,36   
	  
        // Read data from memory at the specified address
     assign    instruction_out = ins_mem[address_in];
    
endmodule 