// Listing 3.1
module eq1_always
  (
   input wire i0, i1,
   output reg eq  // eq declared as reg
  );

  // p0 and p1 declared as reg
  reg p0, p1;

  always @(i0, i1) // i0 an i1 must be in sensitivity list
  begin
     // the order of statements is important
     p0 = ~i0 & ~i1;
     p1 = i0 & i1;
     eq = p0 | p1;
  end

endmodule

module mode10(
input clk,
input reset,
output leda,
output ledb,
output ledc,
output ledd,
output lede,
output ledf,
output ledg
);
reg [26:0] count;
reg [3:0] counter;
reg [6:0] seg_data;
always @(negedge clk or negedge reset)
     begin
      if (reset ==0)
	  begin
       count<=27'd0;
	   counter <= 4'b0;
	  end	
	   else if (count==27'd50000000)
	    begin
		count <=27'd0;
		if (counter < 9) counter <= counter +1;
		else  counter <= 0;
		end
      else 
         count<=count+1;
     end
always @(counter)
case (counter)
4'b0000:seg_data=7'b1111110;
4'b0001:seg_data=7'b0110000;
4'b0010:seg_data=7'b1101101;
4'b0011:seg_data=7'b1111001;
4'b0100:seg_data=7'b0110011;
4'b0101:seg_data=7'b1011011;
4'b0110:seg_data=7'b1011111;
4'b0111:seg_data=7'b1110000;
4'b1000:seg_data=7'b1111111;
4'b1001:seg_data=7'b1111011;
endcase

assign leda=seg_data[6];
assign ledb=seg_data[5];
assign ledc=seg_data[4];
assign ledd=seg_data[3];
assign lede=seg_data[2];
assign ledf=seg_data[1];
assign ledg=seg_data[0];

endmodule