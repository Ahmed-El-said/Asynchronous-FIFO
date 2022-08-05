module write_pointer (
    input wire       w_clk,
    input wire       rst,
    input wire       full_flag,
    output reg [3:0] w_ptr
);

always @(posedge w_clk or negedge rst) 
    begin
        if (!rst) 
            begin
                w_ptr<=4'b0;    
            end    
        else
            begin
                if (!full_flag) 
                    begin
                        w_ptr<=w_ptr+4'b1;    
                    end
            end
    end

    
endmodule