`timescale 1ns / 1ps

module test_data_mem;

  // Inputs
  reg we;
  reg clk;
  reg re;
  reg [31:0] write_data;
  reg [31:0] address;

  // Outputs
  wire [31:0] read_data;

  // Instantiate the data_mem module
  data_mem uut (
    .we(we),
    .clk(clk),
    .re(re),
    .write_data(write_data),
    .address(address),
    .read_data(read_data)
  );

  // Clock generation
  always begin
    clk = 0;
    #5;
    clk = 1;
    #5;
  end

  // Stimulus generation
  initial begin
    // Initialize test inputs
    we = 0;
    re = 0;
    write_data = 32'h12345678;
    address = 32'h12345678;

    // Write data to memory
    we = 1;
    #10;
    we = 0;

    // Read data from memory
    re = 1;
    #10;
    re = 0;

    // Add some delay before observing outputs
    #10;

    // Check the output
    $display("write_data = %h, address = %h, read_data = %h", write_data, address[5:0], read_data);

    // Finish the simulation
    $finish;
  end

endmodule
