module _if(
	input wire _clk,
	//IF_MUX1
		//_sel_npc
		input wire _rst,
		input wire _flush,
		input wire _stall,
		input wire _jb,
		input wire _bb,
		//input
		input wire[`InstAddrBus] _pc,
		input wire[`InstAddrBus] _pc_add4,
		input wire[`InstAddrBus] _jb_target,
		input wire[`InstAddrBus] _bb_target,
		input wire[`InstAddrBus] _excpc,
		input wire[`InstAddrBus] _rstpc,
		//output
		//wire1:output wire[`InstBus] pc_,
	//R_PC
		//input
		//wire1:input wire[`InstBus] _pc,
		//output
		output reg[`InstAddrBus] pc_
);

wire[0:4] _sel_npc = {_rst,_flush,_stall,_jb,_bb};
//wire1
wire[`InstAddrBus] pc;

//IF_MUX1
always(*)begin
	if(`RSTPC)begin
		pc = _rstpc;
	end else if(`FLUSHPC)begin
		pc = _excpc;
	end else if(`STALLPC)begin
		pc = _pc;
	end else if(`JBPC)begin
		pc = _jb_target;
	end else if(`BBPC)begin
		pc = _bb_target;
	end else if(`NORMALPC)begin
		pc = _pc_add4;
	end
end

//R_PC
always(posedge _clk)begin
	pc_ <= pc;
end

endmodule
