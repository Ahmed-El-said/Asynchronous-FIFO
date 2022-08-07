module FIFO (
    input wire [7:0] data_in,
    input wire       w_clk,
    input wire       r_clk,
    input wire       rst,
    input wire [3:0] w_adrss,
    input wire [3:0] r_adrss,
    output reg [7:0] data_out
);

//////////////internal wires//////////////
wire  [3:0] write_pointer;
wire  [3:0] read_pointer;
wire  [3:0] g_write_pointer;
wire  [3:0] g_read_pointer;
wire  [3:0] sync_write_pointer;
wire  [3:0] sync_read_pointer;
wire        empty_flag;
wire        full_flag;


/////////////inistantiation////////////
Bin_to_gray u0(
    .Bin_ptr(write_pointer),
    .gray_ptr(g_write_pointer)
);

Bin_to_gray u00(
    .Bin_ptr(read_pointer),
    .gray_ptr(g_read_pointer)
);

empty_check u1(
    .w_ptr(sync_write_pointer),
    .r_ptr(g_read_pointer),
    .empty_flag(empty_flag)
);

full_check u2(
    .w_ptr(g_write_pointer),
    .r_ptr(sync_read_pointer),
    .full_flag(full_flag)
);

queue u3(
    .w_clk(w_clk),
    .rst(rst),
    .w_ptr(write_pointer),
    .r_ptr(read_pointer),
    .data_in(data_in),
    .full_flag(full_flag),
    .empty_flag(empty_flag),
    .data_out(data_out)
);
    
read_pointer u4(
    .r_clk(r_clk),
    .rst(rst),
    .empty_flag(empty_flag),
    .r_ptr(read_pointer)
);

synchronizer u5(
    .Dst_clk(w_clk),
    .rst(rst),
    .ptr_bit(g_read_pointer),
    .sync_ptr_bit(sync_read_pointer)
);

synchronizer u55(
    .Dst_clk(r_clk),
    .rst(rst),
    .ptr_bit(g_write_pointer),
    .sync_ptr_bit(sync_write_pointer)
);

write_pointer u6(
    .w_clk(w_clk),
    .rst(rst),
    .full_flag(full_flag),
    .w_ptr(write_pointer)
);

endmodule