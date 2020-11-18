`include "defines.v"
module ID(
	input wire[`ExcBus] _exc,
	input wire[`InstBus] _inst,
	input wire[`InstAddrBus] _pc,
	input wire[`InstAddrBus] _pc_sub4,
	input wire[`InstAddrBus] _pc_add8,
	input wire[`InstAddrBus] _pc_add4,

);
