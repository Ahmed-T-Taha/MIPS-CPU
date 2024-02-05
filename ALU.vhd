library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
Port ( 	  data1   : in  STD_LOGIC_VECTOR (31 downto 0);
           data2   : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop   : in  STD_LOGIC_VECTOR (3 downto 0);
           cin     : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag   : out  STD_LOGIC; 
           zflag   : out  STD_LOGIC;
           oflag   : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

  SIGNAL tempOp : STD_LOGIC_VECTOR (32 DOWNTO 0);
  SIGNAL temp : STD_LOGIC_VECTOR (31 DOWNTO 0);

begin

-- 0000 -> AND
-- 0001 -> OR
-- 1100 -> NOR
-- 0111 -> SLT
-- 0010 -> ADD
-- 0110 -> SUB
-- 1111 -> SUB And Invert Zero

  tempOp <= 
  (('0' & data1) + ('0' & data2)) + ("00000000000000000000000000000000" & cin) WHEN aluop = "0010" ELSE
  (('0' & data1) - ('0' & data2)) WHEN (aluop = "0110" or aluop="1111") ELSE
  (OTHERS=>'Z');

	temp <= 
	(data1 and data2) WHEN aluop = "0000" ELSE 
	(data1 OR data2) WHEN aluop = "0001" ELSE 
	(data1 nor data2) WHEN aluop = "1100" ELSE
	"00000000000000000000000000000001" WHEN signed(data1) < signed(data2) and aluop = "0111" ELSE
	"00000000000000000000000000000000" WHEN (NOT (signed(data1) < signed(data2))) and aluop = "0111" ELSE
	tempOp(31 DOWNTO 0) WHEN (aluop = "0010" OR aluop = "0110" or aluop="1111") ELSE
	(OTHERS=>'Z');
	
	
	cflag <= tempOp(32) WHEN aluop = "0010" OR aluop = "0110" 
	ELSE 'Z';
	
	oflag <= (tempOp(32) XOR tempOp(31)) WHEN aluop = "0010" OR aluop = "0110" 
	ELSE 'Z';
	
	zflag <= '0' WHEN temp(31 DOWNTO 0) <= X"00000000" and aluop="1111" ELSE
				'1' WHEN (NOT (temp(31 DOWNTO 0) <= X"00000000")) and aluop="1111" ELSE 
				'1' WHEN temp(31 DOWNTO 0) <= X"00000000"
				ELSE '0';
	  
	  
	dataout <= temp;

end Behavioral;

