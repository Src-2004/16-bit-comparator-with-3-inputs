`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12.06.2025 22:15:34
// Design Name: 
// Module Name: TB_3COM_16BIT
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


module tb_comparator_3input_16bit;
    // Inputs
    reg [15:0] A, B, C;

    // Outputs
    wire [1:0] largest;
    wire [1:0] smallest;
    wire A_eq_B;
    wire B_eq_C;
    wire A_eq_C;
    wire all_equal;

    // Instantiate the Unit Under Test (UUT)
    comparator_3input_16bit uut (
        .A(A),
        .B(B),
        .C(C),
        .largest(largest),
        .smallest(smallest),
        .A_eq_B(A_eq_B),
        .B_eq_C(B_eq_C),
        .A_eq_C(A_eq_C),
        .all_equal(all_equal)
    );

    // Test stimulus
    initial begin
        $monitor("Time: %0t | A: %0d B: %0d C: %0d | largest: %b smallest: %b | A_eq_B: %b B_eq_C: %b A_eq_C: %b all_equal: %b",
                 $time, A, B, C, largest, smallest, A_eq_B, B_eq_C, A_eq_C, all_equal);

        // Apply test cases
        A = 16'd10; B = 16'd20; C = 16'd30; #10; // Case: C largest, A smallest
        A = 16'd40; B = 16'd10; C = 16'd10; #10; // Case: A largest, B & C equal and smallest
        A = 16'd25; B = 16'd25; C = 16'd25; #10; // Case: All equal
        A = 16'd15; B = 16'd35; C = 16'd25; #10; // Case: B largest, A smallest
        A = 16'd50; B = 16'd50; C = 16'd40; #10; // Case: A & B largest, C smallest
        A = 16'd5; B = 16'd10; C = 16'd5; #10; // Case: B largest, A & C smallest

        $finish;
    end
endmodule

