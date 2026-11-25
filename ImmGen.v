module immgen(opcode, instruction, immext);
	input [6:0] opcode;
	input [31:0] instruction;
	output [31:0] immext;

	always@(*)
	begin
		case(opcode)
			7'b0000011 : immext = {{20{instruction[31]}}, instruction[31:20]};
			7'b0100011 : immext = {{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
			7'b1100011 : immext = {{19{instruction[31]}}, instruction[31], instruction{30:25}, instruction[11:8], 1'b0};
		endcase
	end

endmodule
