library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity R is
    port (
        i: in std_logic_vector (31 downto 0);
        o: out std_logic_vector (31 downto 0);
        L: in std_logic;
        clk : in std_logic);
end reg;

architecture rtl of reg is

begin
    process (clk)
    begin
	 
	 if (clk'event and clk='1' and L='1') then
        o<=i;
        end if;
    end process;

end architecture;