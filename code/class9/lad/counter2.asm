
function main(0):
	.upvalue _ENV, 1, 0
	1	[7]	CLOSURE  	R0, F_0_1
	2	[1]	CALL     	R0, 1, 2
	3	[9]	GETTABUP 	R1, 0, "print"
	4	[11]	MOVE     	R2, R1
	5	[11]	MOVE     	R3, R0
	6	[11]	CALL     	R3, 1, 0
	7	[11]	CALL     	R2, 0, 1
	8	[12]	MOVE     	R2, R1
	9	[12]	MOVE     	R3, R0
	10	[12]	CALL     	R3, 1, 0
	11	[12]	CALL     	R2, 0, 1
	12	[13]	MOVE     	R2, R1
	13	[13]	MOVE     	R3, R0
	14	[13]	CALL     	R3, 1, 0
	15	[13]	CALL     	R2, 0, 1
	16	[14]	MOVE     	R2, R1
	17	[14]	MOVE     	R3, R0
	18	[14]	CALL     	R3, 1, 0
	19	[14]	CALL     	R2, 0, 1
	20	[15]	MOVE     	R2, R1
	21	[15]	MOVE     	R3, R0
	22	[15]	CALL     	R3, 1, 0
	23	[15]	CALL     	R2, 0, 1
	24	[16]	MOVE     	R2, R1
	25	[16]	MOVE     	R3, R0
	26	[16]	CALL     	R3, 1, 0
	27	[16]	CALL     	R2, 0, 1
	28	[16]	RETURN   	R0, 1

function F_0_1(0):
	1	[2]	LOADK    	R0, 0
	2	[6]	CLOSURE  	R1, F_1_1
	3	[6]	RETURN   	R1, 2
	4	[7]	RETURN   	R0, 1

function F_1_1(0):
	.upvalue n, 1, 0
	1	[4]	GETUPVAL 	R0, 0
	2	[4]	ADD      	R0, R0, 1
	3	[4]	SETUPVAL 	R0, 0
	4	[5]	GETUPVAL 	R0, 0
	5	[5]	RETURN   	R0, 2
	6	[6]	RETURN   	R0, 1
