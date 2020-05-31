`timescale 1ns / 1ns
module tanh_activation_function(input_tanh_function, clk, reset, output_tanh_function);

parameter EXPONENT_WIDTH = 5;
parameter MANTISSA_WIDTH = 10;
parameter DATA_WIDTH = EXPONENT_WIDTH+MANTISSA_WIDTH+1;
parameter numberOfInputs=784; 

input [(DATA_WIDTH*numberOfInputs)-1:0] input_tanh_function;
input clk;
input reset;
output wire [(DATA_WIDTH*numberOfInputs)-1:0]output_tanh_function;

genvar i;

generate  //generate the parallel processing elements
	for (i=0; i < numberOfInputs; i=i+1) 
	begin  
	tanh #(.DATA_WIDTH(DATA_WIDTH),.EXPONENT_WIDTH(EXPONENT_WIDTH), .MANTISSA_WIDTH(MANTISSA_WIDTH)) 
	tanh_calc (
	 .input_x(input_tanh_function[DATA_WIDTH*i+:DATA_WIDTH]),
	 .clk(clk),
	 .reset(reset),
	 .output_tanh(output_tanh_function[DATA_WIDTH*i+:DATA_WIDTH])
	);
	
	end
endgenerate 



endmodule