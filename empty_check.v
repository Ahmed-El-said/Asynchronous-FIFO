module empty_check (
    input wire [3:0] w_ptr,
    input wire [3:0] r_ptr,
    output wire      empty_flag
);

assign empty_flag=(w_ptr==r_ptr);

endmodule