`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:11:40 08/19/2015 
// Design Name: 
// Module Name:    lab2_2 
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
module lab2_2(
		bcd, //bcd input
		display, //14-output
		leds //4s led output
    );
input [3:0] bcd;
output reg [7:0]  display;
output [3:0]leds;

assign leds=bcd;

always@(bcd)
case(bcd)
  4'd0: display=8'b0000_0011;//0
  4'd1: display=8'b1001_1111;//1
  4'd2: display=8'b0010_0100;//2
  4'd3: display=8'b0000_1100;//3
  4'd4: display=8'b1001_1000;//4
  4'd5: display=8'b0100_1000;//5
  4'd6: display=8'b0100_0000;//6
  4'd7: display=8'b0001_1111;//7
  4'd8: display=8'b0000_0000;//8
  4'd9: display=8'b0000_1000;//9
  default display=8'b0111_0001;//F

endcase
endmodule
