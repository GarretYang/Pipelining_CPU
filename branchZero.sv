module branchZero(Reg_ReadData2, CBZ_zeroFlag);
	input logic [63:0] Reg_ReadData2;
	output logic CBZ_zeroFlag;
	logic [15:0] zero_comp1;
	logic [4:0] zero_comp2;
	
	genvar i,j;
	generate 
	for (i = 0; i < 16; i++) begin: eachnor
		nor comp1 (zero_comp1[i], Reg_ReadData2[4*i],Reg_ReadData2[4*i+1],Reg_ReadData2[4*i+2],Reg_ReadData2[4*i+3]);
	end
	for (j = 0; j < 4; j++) begin: eachand
		and comp2 (zero_comp2[j], zero_comp1[4*j], zero_comp1[4*j+1], zero_comp1[4*j+2], zero_comp1[4*j+3]);
	end
	endgenerate
	and zero_flage (CBZ_zeroFlag,zero_comp2[0],zero_comp2[1],zero_comp2[2],zero_comp2[3]);	
	
	
endmodule