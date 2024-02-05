library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
port(
		clk: in std_logic;
		address_to_load: in std_logic_vector(31 downto 0);
		current_address: out std_logic_vector(31 downto 0)
	);
end PC;

architecture Behavioral of PC is

	signal address: std_logic_vector(31 downto 0):= "00000000000000000000000000000000";

	begin

	process(clk)
		begin
		current_address <= address;
		if clk='1' and clk'event then
			address <= address_to_load;
		end if;
	end process;
	
end Behavioral;

