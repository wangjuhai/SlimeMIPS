module if_id(
	input wire _clk,
	//ID_MUX1
		//_sel_id_data
		input wire _rst,
		input wire _flush,
		input wire _stall,
		//input
		input wire[`InstBus] _linst,
		input wire[`InstAddrBus] _lpc,
		input wire[`InstAddrBus] _lpc_sub4,
		input wire[`InstAddrBus] _lpc_add8,
		input wire[`InstAddrBus] _lpc_add4,
		input wire[`InstAddrBus] _lexc,
		input wire[`InstAddrbus] _ljb_delaysolt,
		input wire[`InstBus] _inst,
		input wire[`InstAddrBus] _pc,
		input wire[`InstAddrBus] _pc_sub4,
		input wire[`InstAddrBus] _pc_add8,
		input wire[`InstAddrBus] _pc_add4,
		input wire[`InstAddrBus] _exc,
		input wire[`InstAddrbus] _jb_delaysolt,
		//output
		//wire1:output wire[`InstBus] inst,
		//wire2:output wire[`InstAddrBus] pc,
		//wire3:output wire[`InstAddrBus] pc_sub4,
		//wire4:output wire[`InstAddrBus] pc_add8,
		//wire5:output wire[`InstAddrBus] pc_add4,
		//wire6:output wire[`InstAddrBus] exc,
		//wire7:output wire[`InstAddrbus] jb_delaysolt,
	//ID_REG
		//input
		//wire1
        //wire2
        //wire3
        //wire4
        //wire5
        //wire6
        //wire7
		//output
		output reg[`InstBus] inst_,
        output reg[`InstAddrBus] pc_,
        output reg[`InstAddrBus] pc_sub4_,
        output reg[`InstAddrBus] pc_add8_,
        output reg[`InstAddrBus] pc_add4_,
        output reg[`InstAddrBus] exc_,
        output reg[`InstAddrbus] jb_delaysolt_

);

wire[`InstBus] inst,
wire[`InstAddrBus] pc,
wire[`InstAddrBus] pc_sub4,
wire[`InstAddrBus] pc_add8,
wire[`InstAddrBus] pc_add4,
wire[`InstAddrBus] exc,
wire[`InstAddrbus] jb_delaysolt,

//ID_MUX1
wire[0:2] _sel_id_data = {_rst,_flush,_stall};
always(*)begin
	if(`RSTID || `FLUSHID)begin
		inst = 32'h00000000;
		pc = 32'h00000000;
		pc_sub4 = 32'h00000000;
		pc_add8 = 32'h00000000;
		pc_add4 = 32'h00000000;
		exc = 32'h00000000;
		jb_delaysolt = 32'h00000000;
	end else if(`STALLID)begin
		inst = _linst;
		pc = _lpc;
		pc_sub4 = _lpc_sub4;
		pc_add8 = _lpc_add8;
		pc_add4 = _lpc_add4;
		exc = _lexc;
		jb_delaysolt = _ljb_delaysolt;
	end else if(`NORMALID)begin
		inst = _inst;
		pc = _pc;
		pc_sub4 = _pc_sub4;
		pc_add8 = _pc_add8;
		pc_add4 = _pc_add4;
		exc = _exc;
		jb_delaysolt = _jb_delaysolt;
	end
end

//ID_REG
always(posedge _clk)begin
	pc_ <= pc;
	inst_ <= inst;
	pc_sub4_ <= pc_sub4;
	pc_add8_ <= pc_add8;
	pc_add4_ <= pc_add4;
	exc_ <= exc;
	jb_delaysolt_ <= jb_delaysolt;
end

endmodule
