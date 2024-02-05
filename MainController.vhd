library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MainController is

    Port ( operationCode : in  STD_LOGIC_VECTOR (5 downto 0);
           aluOp : out  STD_LOGIC_VECTOR (1 downto 0);
           regDst : out  STD_LOGIC;
           jump : out STD_LOGIC;
           branch : out  STD_LOGIC;
           memRead : out  STD_LOGIC;
           memToReg : out  STD_LOGIC;
           memWrite : out  STD_LOGIC;
           aluSrc : out  STD_LOGIC;
           regWrite : out  STD_LOGIC
			  );  
end MainController;

architecture Behavioral of MainController is

begin

process (operationCode) 
begin

regWrite <= '0';

case operationCode is 
	
	when "000000" => -- R-type
		regDst <= '1';
		jump <= '0';
		branch <= '0';
		memRead <= '0';
		memToReg <= '0';
		aluOp <= "10"; -- USE Funct
		memWrite <= '0';
		aluSrc <= '0';
		regWrite <= '1' after 15 ns;


	when "000010" => -- J-type
		regDst <= 'X';
		jump <= '1';
		branch <= '0';
		memRead <= '0';
		memToReg <= 'X';
		aluOp <= "00";
		memWrite <= '0';
		aluSrc <= '0';
		regWrite <= '0';

	when "101011" => -- I-type store word
		regDst <= 'X';
		jump <= '0';
		branch <= '0';
		memRead <= '0';
		memToReg <= 'X';
		aluOp <= "00";  -- ADD
		memWrite <= '1';
		aluSrc <= '1';
		regWrite <= '0';
		
	when "100011" => -- I-type load word
		regDst <= '0';
		jump <= '0';
		branch <= '0';
		memRead <= '1';
		memToReg <= '1';
		aluOp <= "00";  -- ADD
		memWrite <= '0';
		aluSrc <= '1';
		regWrite <= '1' after 15 ns;
		
		
	when "000100" => -- I-type branch equal
		regDst <= 'X';
		jump <= '0';
		branch <= '1';
		memRead <= '0';
		memToReg <= 'X';
		aluOp <= "01";  -- SUB
		memWrite <= '0';
		aluSrc <= '0';
		regWrite <= '0';
		
		
	when "000101" => -- I-type branch not equal
		regDst <= 'X';
		jump <= '0';
		branch <= '1';
		memRead <= '0';
		memToReg <= 'X';
		aluOp <= "11"; -- SUB and Invert zero
		memWrite <= '0';
		aluSrc <= '0';
		regWrite <= '0';
		
		
	when others => null;
		regDst <= '0';
		jump <= '0';
		branch <= '0';
		memRead <= '0';
		memToReg <= '0';
		aluOp <= "00";
		memWrite <= '0';
		aluSrc <= '0';
		regWrite <= '0';

		end case;
end process;

end Behavioral;

