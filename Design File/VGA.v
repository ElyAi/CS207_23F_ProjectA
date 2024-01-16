`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/12/22 23:49:02
// Design Name: 
// Module Name: VGA
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module VGA(//640*480
input clk,
input rst_n,
input [2:0] mode,
input [2:0] select,//song select
output hsync,
output vsync,
output [11:0] vga_rgb
    );

reg clk_25M;//need 25.125MHZ clk, we create approximate one 25MHZ clk
reg [1:0] cnt;

always@ (posedge clk, negedge rst_n) begin//create clk
if(!rst_n) begin
cnt <= 0;
clk_25M <= 0;
end else if(cnt < 1) begin
cnt <= cnt + 1;
clk_25M <= clk_25M;
end else begin
cnt <= 0;
clk_25M <= ~clk_25M;
end
end

wire [9:0] pix_x;//x of the valid region
wire [9:0] pix_y;//y of the valid region
wire [11:0] pix_data;//VGA display information

vga_ctrl vga_c
(
.clk(clk_25M),
.rst_n(rst_n),
.pix_data(pix_data),
.pix_x(pix_x),
.pix_y(pix_y),
.hsync(hsync),
.vsync(vsync),
.rgb(vga_rgb)
);

vga_pic  vga_p
(
.clk(clk_25M),
.rst_n(rst_n),
.mode(mode),
.select(select),
.pix_x(pix_x),
.pix_y(pix_y),
.pix_data(pix_data)
);
endmodule
