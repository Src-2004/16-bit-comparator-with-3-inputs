module comparator_3input_16bit(
    input [15:0] A, B, C,
    output reg [1:0] largest,  // 00: A, 01: B, 10: C, 11: multiple equal
    output reg [1:0] smallest, // 00: A, 01: B, 10: C, 11: multiple equal
    output reg A_eq_B,
    output reg B_eq_C,
    output reg A_eq_C,
    output reg all_equal
);

    always @(*) begin
        // Initialize all outputs
        largest = 2'b11;
        smallest = 2'b11;
        A_eq_B = 0;
        B_eq_C = 0;
        A_eq_C = 0;
        all_equal = 0;
        
        // Check equality conditions
        A_eq_B = (A == B);
        B_eq_C = (B == C);
        A_eq_C = (A == C);
        all_equal = A_eq_B && B_eq_C; // If A=B and B=C, then all are equal
        
// Determine largest
        if (A >= B && A >= C) begin
            if (A > B && A > C)
                largest = 2'b00; // A is largest
            else
                largest = 2'b11; // Multiple inputs are equal and largest
        end
        else if (B >= A && B >= C) begin
            if (B > A && B > C)
                largest = 2'b01; // B is largest
            else
                largest = 2'b11; // Multiple inputs are equal and largest
        end
        else if (C >= A && C >= B) begin
            if (C > A && C > B)
                largest = 2'b10; // C is largest
            else
                largest = 2'b11; // Multiple inputs are equal and largest
        end
        
        // Determine smallest
        if (A <= B && A <= C) begin
            if (A < B && A < C)
                smallest = 2'b00; // A is smallest
            else
smallest = 2'b11; // Multiple inputs are equal and smallest
        end
        else if (B <= A && B <= C) begin
            if (B < A && B < C)
                smallest = 2'b01; // B is smallest
            else
                smallest = 2'b11; // Multiple inputs are equal and smallest
        end
        else if (C <= A && C <= B) begin
            if (C < A && C < B)
                smallest = 2'b10; // C is smallest
            else
                smallest = 2'b11; // Multiple inputs are equal and smallest
       end
    end
endmodule
