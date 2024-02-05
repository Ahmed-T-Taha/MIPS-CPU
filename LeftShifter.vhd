
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity LeftShifter is

	generic (input_count: natural:= 32; output_count: natural:= 32; shift_amount: natural:= 2);
	port (
		shifter_input: in std_logic_vector(input_count-1 downto 0);
		shifter_output: out std_logic_vector(output_count-1 downto 0)
	);
	
end LeftShifter;

architecture Behavioral of LeftShifter is

	signal temp_output: std_logic_vector(output_count-1 downto 0);

	begin
	
	temp_output <= std_logic_vector(resize(unsigned(shifter_input), output_count)); -- Match input to the same size of output
	shifter_output <= std_logic_vector(shift_left(signed(temp_output), shift_amount));

end Behavioral;

