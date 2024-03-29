module SE_19(SE_out,in);
	input logic [18:0] in;
	output logic [63:0] SE_out;
	
	genvar i;
	generate
	for (i = 18; i < 63; i++) begin: ease
		assign SE_out[i] = in[18];
	end
	endgenerate
	assign SE_out[17:0] = in[17:0];
endmodule