library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reg is
    port (
        i: in std_logic_vector (31 downto 0);
        o: out std_logic_vector (31 downto 0);
        L: in std_logic;
        clk : in std_logic);
end reg;

architecture Behavioral of reg is


SIGNAL temp : STD_LOGIC_VECTOR (31 downto 0) := x"00000000";

begin
    process (clk)
    begin
	 o <= temp;
	 if (clk'event and clk='1' and L='1') then
	 temp <= i;
--		if (i = "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX" or i = "UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU") then
--			o <= x"00000000";
--		else
--			o <= i;
--		end if;

	 end if;
    end process;

end architecture;