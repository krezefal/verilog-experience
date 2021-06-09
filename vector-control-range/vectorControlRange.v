module vectorControlRange(

  input clock;

  input [7:0] vectorIn [0:11];
  input [7:0] upperBnd;
  input [7:0] lowerBnd;

  output [7:0] vectorOut [0:11];
  output errorPos [12:0];
  );

  always_ff @(posedge clock) begin : _posedge_block
    integer i;

    for(i = 0; i < 12; i = i+1) begin : _for_block2
      if(vectorIn[i] > lowerBnd && vectorIn[i] < upperBnd) begin : _if_block
        vectorOut[i] = vectorIn[i];
        errorPos[i] = 1'b0;
      end
      else begin: _else_block
        vectorOut[i] = 0;
        errorPos[i] = 1'b1;
      end
    end
  end

endmodule 
