module queue (
    input wire       w_clk,
    input wire       rst,
    input wire [3:0] w_ptr,
    input wire [3:0] r_ptr,
    input wire [7:0] data_in,
    input wire       full_flag,
    input wire       empty_flag,
    output reg [7:0] data_out
);

reg [7:0] que [0:15];
integer i;

always @(posedge w_clk or negedge rst) 
    begin
        if (!rst) 
            begin
                for (i = 0;i<16 ;i=i+1 ) 
                    begin
                        que[i]<=8'b0;
                    end    
            end
        else
            begin
                if (!full_flag) 
                    begin
                        que[w_ptr]<=data_in;
                    end
            end
    end

always @(*) 
    begin
        if (!empty_flag) 
            begin
                data_out=que[r_ptr];    
            end
        else
            begin
                data_out=8'b0;
            end
    end


endmodule