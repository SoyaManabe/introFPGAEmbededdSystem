module nios2pio (
	input		CLK, RST,
	
	input [8:0]		SW,
	input [3:0]		KEY,
	output [6:0]	HEX0, HEX1, HEX2, HEX3, HEX4, HEX5,
	
	output [9:0]	LEDR,
	inout				PS2_CLK, PS2_DAT,
	
	/*VGA*/
	output [3:0]	VGA_R, VGA_G, VGA_B,
	output			VGA_HS, VGA_VS,
	
	/*SDRAM*/
	output			DRAM_CLK, DRAM_CKE,
	output [12:0]	DRAM_ADDR,
	output [1:0]	DRAM_BA,
	output			DRAM_CAS_N, DRAM_RAS_N,
	output			DRAM_CS_N,  DRAM_WE_N,
	output			DRAM_UDQM,  DRAM_LDQM,
	inout [15:0]	DRAM_DQ,
	
	/*GPIO connector #0*/
	inout [35:0]	GPIO_0
);

	assign HEX1=7'h7f, HEX2=7'h7f, HEX3=7'h7f, HEX4=7'h7f, HEX5=7'h7f;

	nios2pio_qsys u0 (
		.clk_clk                          (CLK),                          //                       clk.clk
		.reset_reset_n                    (~RST),                    //                     reset.reset_n
		.pio_0_external_connection_export (HEX0), // pio_0_external_connection.export
		.pio_1_external_connection_export (SW[3:0])  // pio_1_external_connection.export
	);
endmodule

