`include"vectorControlRange.v"
module vectorControlRange_tb ();

  reg clock = '1;
  initial begin
        #(1000.0/(2*CLK_FREQ));
        forever #(1000.0/(2*CLK_FREQ)) clk =~ clk;
  end

  reg [7:0] vectorIn [0:11];
  reg [7:0] vectorOut [0:11];
  reg [7:0] vectorOut;
  reg [7:0] lowerBnd;
  reg errorPos [12:0];

  vectorControlRange engine(clock, vectorIn, vectorOut, lowerBnd, vectorOut, errorPos)

  initial begin: _initial_block
    
    upperBnd = 8'b11010101;
    lowerBnd = 8'b01010110;

    vectorIn[0] = 8'b01010101;
    vectorIn[1] = 8'b01010101;
    vectorIn[2] = 8'b01010101;
    vectorIn[3] = 8'b01010101;
    vectorIn[4] = 8'b01010101;
    vectorIn[5] = 8'b01010101;
    vectorIn[6] = 8'b01010101;
    vectorIn[7] = 8'b01010101;
    vectorIn[8] = 8'b11010100;
    vectorIn[9] = 8'b01010101;
    vectorIn[10] = 8'b01010101;
    vectorIn[11] = 8'b01010111;

    $display;
    $display("upperBound = %b", upperBnd);
    $display("lowerBound = %b", lowerBnd);

    $display;
    for(i = 0; i < 12; i = i+1) begin : _for_block1
      $display("vectorIn[%0d] = %b", i, vectorIn[i]);
    end

    @(posedge clk);

    $display;
    for(i = 0; i < 12; i = i+1) begin : _for_block3
      $display("vectorOut[%0d] = %b", i, vectorOut[i]);
    end

    $display;
    for(i = 0; i < 12; i = i+1) begin : _for_block4
      $write(errorPos[i]);
    end
    
  end
endmodule