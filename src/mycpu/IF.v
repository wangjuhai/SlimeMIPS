module IF(
	input wire[`InstAddrBus] _pc,
	output wire[`InstAddrBus] pc_,
	//IF_EXC
	output wire[`ExcBus] exc_,
	//IM
	output wire[`InstBus] inst_,
	//SUB4
	output wire[`InstBus] pc_sub4_,
	//ADD8
	output wire[`InstBus] pc_add8_,
	//ADD4
	output wire[`InstBus] pc_add4_,
);

//IF_EXC
always(*)begin
	if(pc[1:0] != 2'b00)begin
		exc = 32'b10000000000000000000000000000000;
	end else begin
		exc = 32'd00000000000000000000000000000000;
	end
end

//IM
initial begin
	$readmemb("/home/wjh/code/github/SlimeMIPS/src/mycpu/im.txt",im);
end
reg[`InstBus] im[0:`InstMemNum - 1];
always(*)begin
	inst_ = im[_pc];
end

//SUB4
always(*)begin
	pc_sub4_ = _pc - 4;
end

//ADD4
always(*)begin
	pc_add4_ = _pc + 4;
end

//ADD8
always(*)begin
	pc_add8_ = _pc + 8;
end

assign pc_ = _pc;

endmodule
