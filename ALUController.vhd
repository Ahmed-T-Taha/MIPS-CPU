library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALUController is
    Port (funct : in  STD_LOGIC_VECTOR (5 downto 0);
           main_controller_alu_op : in  STD_LOGIC_VECTOR (1 downto 0);
           output_operation : out  STD_LOGIC_VECTOR (3 downto 0));
end ALUController;

architecture Behavioral of ALUController is

begin

-- main_controller = 00 -> 0010 //  add
-- main_controller = 01 -> 0110 // subtract
-- main_controller = 11 -> 1111 // subtract and invert zero
-- main_controller = 10 -> {
--									funct = 100000 -> 0010 add
--									funct = 100010 -> 0110 sub

--									funct = 100100 -> 0000 and
--									funct = 100101 -> 0001 or
--									funct = 100111 -> 1100 nor

--									funct = 101010 -> 0111 slt

output_operation <= "0010" WHEN main_controller_alu_op = "00" ELSE 
						  "0110" WHEN main_controller_alu_op = "01" ELSE
						  "1111" WHEN main_controller_alu_op = "11" ELSE
						  
						  "0010" WHEN main_controller_alu_op = "10" and funct = "100000" ELSE
						  "0110" WHEN main_controller_alu_op = "10" and funct = "100010" ELSE
						  
						  "0000" WHEN main_controller_alu_op = "10" and funct = "100100" ELSE
						  "0001" WHEN main_controller_alu_op = "10" and funct = "100101" ELSE
						  "1100" WHEN main_controller_alu_op = "10" and funct = "100111" ELSE
						  
						  "0111" WHEN main_controller_alu_op = "10" and funct = "101010"
						  
						  ELSE "ZZZZ";

end Behavioral;

