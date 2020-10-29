module const_div(CLOCK_50, KEY, GPIO_0);

input           CLOCK_50;
input   [1:0]   KEY;
output  [35:0]  GPIO_0;

parameter       DIV_BY      = 7;
localparam      CNT_CONST   = DIV_BY - 1;
localparam      N           = $clog2(DIV_BY);

reg     [N-1:0] cnt;

wire    sys_clk     = CLOCK_50;
wire    sys_rst_n   = KEY[1];
wire    preload_cnt = ~|cnt;

assign GPIO_0[0] = preload_cnt;

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        cnt <= CNT_CONST;
    end else begin
        if (preload_cnt)
            cnt <= CNT_CONST;
        else
            cnt <= cnt - 1'b1;
    end
end


endmodule

