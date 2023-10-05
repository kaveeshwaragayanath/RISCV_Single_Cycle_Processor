`timescale 1ns / 1ps




module pc_with_adder_regfiles
     
    (input logic [7:0] pc_input,
     input logic clk,reset,
	  input logic rg_wrt_en,
	  input logic [31:0] write_data,
	  output logic [31:0] rg_rd_data1, 
     output logic [31:0] rg_rd_data2 
	  );
	  
	  logic [7:0] out;
	  logic [7:0] pc_output;
	  logic [31:0] instruction;
	  
	  
	  pc pc_module (
	  .a(pc_input),
	  .clk(clk),
	  .reset(reset),
	  .y(pc_output)
	  );
	  
	  adder_8  pcadd (
	  .a(pc_output),
	  .b(8'b00000100),
	  .y(out)
	  );
	  
     ins_memory ins_mem(
	  .clk(clk),
	  .address_in(out),
	  .instruction_out(instruction)
	  );
	  
	  reg_filesv reg_file(
	  .clk(clk),
	  .rst(reset),
	  .rg_wrt_en(rg_wrt_en),
	  .rg_wrt_dest(instruction[11:7]),
	  .rg_rd_addr1(instruction[19:15]),
	  .rg_rd_addr2(instruction[24:20]),
	  .rg_wrt_data(write_data),
	  .rg_rd_data1(rg_rd_data1),
	  .rg_rd_data2(rg_rd_data2)
	  );
endmodule 