`include SQRT
module SQRT_tb;

    reg clk = 1
    initial begin
        #(1000.0/(2*CLK_FREQ));
        forever #(1000.0/(2*CLK_FREQ)) clk =~ clk;
    end

    SQRT sqrt(clk, 32'd4000000);
    SQRT sqrt1(clk, 32'd96100); 
    SQRT sqrt2(clk, 32'd3300); 

    initial begin
        @(posedge clk);
    end
      
endmodule