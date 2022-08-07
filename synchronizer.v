module synchronizer (
    input wire  Dst_clk,
    input wire  rst,
    input wire [4:0] ptr,
    output reg [4:0] sync_ptr
);

reg [4:0] ff;


always @(posedge Dst_clk or negedge rst) 
    begin
        if (!rst) 
            begin
                {sync_ptr,ff}<=0;
            end
        else
            begin
                {sync_ptr,ff}<={ff,ptr};
            end           
    end
    
endmodule