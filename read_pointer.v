module read_pointer (
    input wire       r_clk,
    input wire       rst,
    input wire       empty_flag,
    output reg [3:0] r_ptr
);

always @(posedge r_clk or negedge rst) 
    begin
        if (!rst) 
            begin
                r_ptr<=4'b0;    
            end    
        else
            begin
                if (!empty_flag) 
                    begin
                        r_ptr<=r_ptr+4'b1;    
                    end
            end
    end

    
endmodule