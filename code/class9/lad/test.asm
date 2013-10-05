
function main(0):
	.upvalue _ENV, 1, 0
	1	[1]	LOADK    	R0, 5
	2	[2]	LT       	0, R0, 1
	3	[2]	JMP      	R0, 6
	4	[3]	SUB      	R0, R0, 1
	5	[3]	JMP      	R0, 7
	6	[5]	ADD      	R0, R0, 1
	7	[6]	RETURN   	R0, 1
