module one_hot_div(CLOCK_50, KEY, GPIO_0);

input           CLOCK_50;
input   [1:0]   KEY;
output  [35:0]  GPIO_0;

parameter   N = 7;

reg     [N-1:0] one_hot_cnt;

wire    sys_clk     = CLOCK_50;
wire    sys_rst_n   = KEY[1];

assign GPIO_0[0] = one_hot_cnt[0];

always @(posedge sys_clk, negedge sys_rst_n) begin
    if(~sys_rst_n) begin
        one_hot_cnt <= 1;
    end else begin
        one_hot_cnt <= {one_hot_cnt[N-2:0], one_hot_cnt[N-1]};
    end
end


endmodule

