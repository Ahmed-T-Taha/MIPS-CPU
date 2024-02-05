library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SignExtender is
    Port ( signExtender_input : in  STD_LOGIC_VECTOR (15 downto 0);
           signExtender_output : out  STD_LOGIC_VECTOR (31 downto 0));
end SignExtender;

architecture Behavioral of SignExtender is

begin

signExtender_output <= x"0000" & signExtender_input when signExtender_input(15) = '0' else x"FFFF" & signExtender_input;

end Behavioral;

