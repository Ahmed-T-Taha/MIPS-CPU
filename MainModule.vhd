LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
USE IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

USE work.MUX;
USE work.SignExtender;
USE work.RegisterFile;

ENTITY MainModule IS
	PORT (
		START : IN STD_LOGIC;
		CLK : IN STD_LOGIC;
		RegFileOut1 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		RegFileOut2 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		ALUOut : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		PCOut : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
		DataMemOut : OUT STD_LOGIC_VECTOR (31 DOWNTO 0));
END MainModule;

ARCHITECTURE Behavioral OF MainModule IS

	-- Instruction Parts

	SIGNAL opcode, funct : STD_LOGIC_VECTOR(5 DOWNTO 0);
	SIGNAL rs, rt, rd : STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL jump_address : STD_LOGIC_VECTOR(25 DOWNTO 0);
	SIGNAL lw_sw_immediate_addr : STD_LOGIC_VECTOR(15 DOWNTO 0);

	SIGNAL current_address : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL aluOp : STD_LOGIC_VECTOR(1 DOWNTO 0) := "00";
	SIGNAL regDst, jump, branch, memRead, memToReg, memWrite, aluSrc, regWrite : STD_LOGIC := '0';

	SIGNAL read_sel1, read_sel2, write_sel : STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";

	SIGNAL write_data, data1, data2 : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL instruction : STD_LOGIC_VECTOR(31 DOWNTO 0);

	SIGNAL alu_controller_operation_output : STD_LOGIC_VECTOR(3 DOWNTO 0);
	SIGNAL cin, cflag, zflag, oflag : STD_LOGIC := '0';
	SIGNAL alu_result : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL read_data_memory, write_data_memory : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL extender_out : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL branch_shift_out : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
	SIGNAL jump_address_shifted : STD_LOGIC_VECTOR(27 DOWNTO 0) := "0000000000000000000000000000";

	SIGNAL adderNextInstrWithImmediate_output, adderNextInstr_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
	SIGNAL muxBranchOrNot_output, muxJumpOrNot_output : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";

	SIGNAL jumpAnd : STD_LOGIC := '0';
	
	SIGNAL muxALUSourceCtrl : STD_LOGIC := '0';
	SIGNAL muxALUSource_out, muxJumpAddr : STD_LOGIC_VECTOR(31 DOWNTO 0) := x"00000000";
	
BEGIN
	
			PCOut <= current_address;
			ALUOut <= alu_result;
			DataMemOut <= read_data_memory;
			
			RegFileOut1 <= data1;
			RegFileOut2 <= data2;
			
		
		jumpAnd <= (branch AND zflag);
		muxJumpAddr <= (adderNextInstr_output(31 DOWNTO 28) & jump_address_shifted);
	
	opcode <= instruction(31 DOWNTO 26);
	rs <= instruction(25 DOWNTO 21);
	rt <= instruction(20 DOWNTO 16);
	rd <= instruction(15 DOWNTO 11);
	funct <= instruction(5 DOWNTO 0);
	lw_sw_immediate_addr <= instruction(15 DOWNTO 0);
	jump_address <= instruction(25 DOWNTO 0);
	

	pc : ENTITY work.PC PORT MAP(
		clk,
		muxJumpOrNot_output,
		current_address
		);
			

	adderNextInstr : ENTITY work.Adder PORT MAP (
		current_address,
		"00000000000000000000000000000100",
		adderNextInstr_output);
		
	instructionMemory : ENTITY work.InstructionMemory PORT MAP(
		current_address,
		instruction
		);
		
	shifter2Jump : ENTITY work.LeftShifter
		GENERIC MAP(26, 28, 2)
		PORT MAP(
			jump_address,
			jump_address_shifted);

	mainController : ENTITY work.MainController PORT MAP (
		opcode,
		aluOp,
		regDst,
		jump,
		branch,
		memRead,
		memToReg,
		memWrite,
		aluSrc,
		regWrite);

	muxWriteReg : ENTITY work.MUX 
	GENERIC MAP (5)
	PORT MAP (
		rt, -- instruction
		rd, -- instruction
		regDst,
		write_sel);

	registerFile : ENTITY work.RegisterFile PORT MAP (
		rs,
		rt,
		write_sel,
		regWrite,
		clk,
		write_data,
		data1,
		data2);
		
	signExtender : ENTITY work.SignExtender PORT MAP (
		lw_sw_immediate_addr,
		extender_out);

	muxALUSource : ENTITY work.MUX 
	GENERIC MAP (32)
	PORT MAP (
		data2,
		extender_out,
		aluSrc,
		muxALUSource_out);
		
	aluController : ENTITY work.ALUController PORT MAP (
		funct,
		aluOp,
		alu_controller_operation_output);

	alu : ENTITY work.ALU PORT MAP (
		data1,
		muxALUSource_out,
		alu_controller_operation_output,
		cin,
		alu_result,
		cflag,
		zflag,
		oflag);
		
	dataMemory : ENTITY work.DATAMEMORY PORT MAP (
		'1', -- TODO
		data2,
		read_data_memory,
		memRead,
		memWrite,
		alu_result,
		clk);
		
	muxALUResultOrMemory : ENTITY work.MUX 
	GENERIC MAP (32)
	PORT MAP (
		alu_result,
		read_data_memory,
		memToReg,
		write_data);
		
	shifter2BranchJump : ENTITY work.LeftShifter

		GENERIC MAP(32, 32, 2)
		PORT MAP(
			extender_out,
			branch_shift_out);
			
	adderNextInstrWithImmediate : ENTITY work.Adder PORT MAP (
		adderNextInstr_output,
		branch_shift_out,
		adderNextInstrWithImmediate_output);
		
	muxBranchOrNot : ENTITY work.MUX
		GENERIC MAP(32)
		PORT MAP(
			adderNextInstr_output,
			adderNextInstrWithImmediate_output,
			jumpAnd,
			muxBranchOrNot_output);

	muxJumpOrNot : ENTITY work.MUX
		GENERIC MAP(32)
		PORT MAP(
			muxBranchOrNot_output,
			muxJumpAddr,
			jump,
			muxJumpOrNot_output);

END Behavioral;