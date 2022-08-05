module full_check (
    input wire [3:0]  w_ptr,
    input wire [3:0]  r_ptr,
    output wire       full_flag
);

assign full_flag=(w_ptr[3:2]!=r_ptr[3:2] && w_ptr[1:0]==r_ptr[1:0]);

endmodule