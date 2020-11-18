//************** 通用宏 *******************************
`define ExcBus 31:0
`define ExcWidth 32
`define ZeroWord 32'h00000000
//************** 与指令有关的宏 ***********************
`define InstAddrBus 31:0
`define InstAddrWidth 32
`define InstBus 31:0
`define InstWidth 32
`define InstMemNum 1024

//************** _sel_npc *****************************
`define RSTPC 			!_sel_npc[0]
`define FLUSHPC 		_sel_npc[0]&&_sel_npc[1]
`define STALLPC 		_sel_npc[0]&&!_sel_npc[1]&&_sel_npc[2]
`define JBPC 			_sel_npc[0]&&!_sel_npc[1]&&!_sel_npc[2]&&_sel_npc[3]
`define BBPC 			_sel_npc[0]&&!_sel_npc[1]&&!_sel_npc[2]&&!_sel_npc[3]&&_sel_npc[4]
`define NORMALPC 		_sel_npc[0]&&!_sel_npc[1]&&!_sel_npc[2]&&!_sel_npc[3]&&!_sel_npc[4]
