module imm_gen(
     input logic [1:0] imm_src,
     input logic [31:0] inst_code,
     output logic [31:0] Imm_out
	  );
	  
	  always_comb begin 
	       case(imm_src)
			    2'b00: Imm_out={{21{inst_code[31]}},inst_code[30:20]}; //I - type
				 2'b01: Imm_out={{21{inst_code[31]}},inst_code[30:25],inst_code[11:7]}; //S - type
				 default: Imm_out=32'bx;
				 
			 endcase 
     end 
endmodule	  