`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:14 08/19/2015 
// Design Name: 
// Module Name:    lab2_3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab2_3(
	input clk,
	input rst_n,
	output [3:0] ftsd_ctl,
	output [14:0] display,
	input [3:0] bcd_input1,bcd_input2

    );
wire [3:0] bcd;
wire [1:0] clk_ctl;
wire [3:0] in0, in1, in2, in3;
wire [1:0] clk_out;


bcd2ftsegdec b1( 
	.display(display), // 14-segment display output
	.bcd(bcd) // BCD input
	);

scan_ctl s1(
	.ftsd_ctl(ftsd_ctl), // ftsd display control signal 
	.ftsd_in(bcd), // output to ftsd display
	.in0(in0), // 1st input
	.in1(in1), // 2nd input
	.in2(in2), // 3rd input
	.in3(in3), // 4th input
	.ftsd_ctl_en(clk_ctl) // divided clock for scan control
	);
freq_div f1(
	.clk_ctl(clk_ctl), // divided clock output
	.clk(clk), // global clock input
	.rst_n(rst_n),	// active low reset
	.clk_out(clk_out)
	);
catchandcalculate c1(
	.bcd1(bcd_input1),  //input
	.bcd2(bcd_input2),
	.in0(in0),   //output
	.in1(in1),	//output
	.in2(in2),//output
	.in3(in3)//output

    );

endmodule
