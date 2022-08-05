module synchronizer (
    input wire  Dst_clk,
    input wire  rst,
    input wire  ptr_bit,
    output wire sync_ptr_bit
);

reg  ff1;
reg  ff2;

always @(posedge Dst_clk or negedge rst) 
    begin
        if (!rst) 
            begin
                ff1<=1'b0;
                ff2<=1'b0;
            end
        else
            begin
                ff1<=ptr_bit;
                ff2<=ff1;
            end           
    end

assign sync_ptr_bit=ff2;
    
endmodule