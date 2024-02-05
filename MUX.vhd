library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX is
GENERIC (
	n : integer := 6
);
    Port ( mux_input0 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           mux_input1 : in  STD_LOGIC_VECTOR (n-1 downto 0);
           mux_control : in  STD_LOGIC;
           mux_out : out  STD_LOGIC_VECTOR (n-1 downto 0));
end MUX;

architecture Behavioral of MUX is

begin

mux_out <= mux_input0 when mux_control = '0' else mux_input1;

end Behavioral;

