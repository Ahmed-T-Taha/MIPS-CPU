library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Adder is
	port (
		adder_input1: in std_logic_vector(31 downto 0);
		adder_input2: in std_logic_vector(31 downto 0);
		adder_output: out std_logic_vector(31 downto 0)
	);
end Adder;

architecture Behavioral of Adder is

begin

adder_output <= adder_input1 + adder_input2;

end Behavioral;

