module full_check (
    input wire [4:0]  w_ptr,
    input wire [4:0]  r_ptr,
    output wire       full_flag
);

assign full_flag=(w_ptr[4:3]!=r_ptr[4:3] && w_ptr[2:0]==r_ptr[2:0]);

endmodule