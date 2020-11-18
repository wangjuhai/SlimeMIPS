`include "defines.v"
module mycpu(
	input wire _clk,
	input wire _rst,
	input wire[5:0] _int,

	output wire timer_int_
);

//_if
wire[`InstAddrBus] _if_pc;

_if if0(
	._clk(),
	._rst(),
	._flush(),
	._stall(),
	._jb(),
	._bb(),
	._pc(),
	._pc_add4(),
	._jb_target(),
	._bb_target(),
	._excpc(),
	._rstpc(),
	.pc_(_if_pc)
);

//IF
wire[`ExcBus] IF_exc;
wire[`InstBus] IF_inst;
wire[`InstAddrBus] IF_pc;
wire[`InstAddrBus] IF_pc_sub4;
wire[`InstAddrBus] IF_pc_add8;
wire[`InstAddrBus] IF_pc_add4;

IF IF0(
	._pc(_if_pc),
	.pc_(IF_pc),
	.exc_(IF_exc),
	.inst_(IF_inst),
	.pc_sub4_(IF_pc_sub4),
	.pc_add8_(IF_pc_add8),
	.pc_add4_(IF_pc_add4)
);

//if_id
wire[`ExcBus] if_id_exc;
wire[`InstBus] if_id_inst;
wire[`InstAddrBus] if_id_pc;
wire[`InstAddrBus] if_id_pc_sub4;
wire[`InstAddrBus] if_id_pc_add8;
wire[`InstAddrBus] if_id_pc_add4;
wire if_id_jb_delaysolt;

if_id if_id0(
	._clk(_clk),
	._rst(_rst),
	._flush(),
	._stall(),
	._linst(if_id_inst),
	._lpc(if_id_pc),
	._lpc_sub4(if_id_pc_sub4),
	._lpc_add8(if_id_pc_add8),
	._lpc_add4(if_id_pc_add4),
	._lexc(if_id_exc),
	._ljb_delaysolt(if_id_jb_delaysolt),
	._inst(IF_inst),
	._pc(IF_pc),
	._pc_sub4(IF_pc_sub4),
	._pc_add8(IF_pc_add8),
	._pc_add4(IF_pc_add4),
	._exc(IF_exc),
	._jb_delaysolt(),
	.inst_(if_id_inst),
	.pc_(if_id_pc),
	.pc_sub4_(if_id_pc_sub4),
	.pc_add8_(if_id_pc_add8),
	.pc_add4_(if_id_pc_add4),
	.exc_(if_id_exc),
	.jb_delaysolt_(if_id_jb_delaysolt)
);


endmodule
