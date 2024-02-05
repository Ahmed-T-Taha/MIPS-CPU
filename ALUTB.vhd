LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ALUTB IS
END ALUTB;
 
ARCHITECTURE behavior OF ALUTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ALU
    PORT(
         data1 : IN  std_logic_vector(31 downto 0);
         data2 : IN  std_logic_vector(31 downto 0);
         aluop : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         dataout : OUT  std_logic_vector(31 downto 0);
         cflag : OUT  std_logic;
         zflag : OUT  std_logic;
         oflag : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal data1 : std_logic_vector(31 downto 0) := (others => '0');
   signal data2 : std_logic_vector(31 downto 0) := (others => '0');
   signal aluop : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

 	--Outputs
   signal dataout : std_logic_vector(31 downto 0);
   signal cflag : std_logic;
   signal zflag : std_logic;
   signal oflag : std_logic;
	
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ALU PORT MAP (
          data1 => data1,
          data2 => data2,
          aluop => aluop,
          cin => cin,
          dataout => dataout,
          cflag => cflag,
          zflag => zflag,
          oflag => oflag
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	


			data2 <= "01111111111111111111111111111111";
			data1 <= "00000000000000000000000000001010";
			aluop <= "0111";
			wait for 100 ns;


			-- And Testing
			
--			data1 <= "00000000000000000000000000010001";
--			data2 <= "00000000000000000000000000000010";
--			aluop <= "0000";			
--			wait for 100 ns;
--
--			
--			-- Or Testing
--			
--			data1 <= "00000000000000000000000000011111";
--			data2 <= "00000000000000000000000000000010";
--			aluop <= "0001";
--			wait for 100 ns;
--			
--
--			-- Add Testing
--						
--			data1 <= "00000000000000000000000000000011";
--			data2 <= "00000000000000000000000000001010";
--			cin <= '0';
--			aluop <= "0010";			
--			wait for 100 ns;
--			
--			data1 <= "00000000000000000000000110000011";
--			data2 <= "00000000000000000000000000001010";
--			cin <= '1';
--			aluop <= "0010";
--			wait for 100 ns;
--						
--			data1 <= "11111111111111111111111111111111";
--			data2 <= "00000000000000000000000000001010";
--			cin <= '1';
--			aluop <= "0010";
--			wait for 100 ns;
--			
--			data1 <= "11111111111111111111111111111111";
--			data2 <= "00000000000000000000000000001010";
--			cin <= '0';
--			aluop <= "0010";
--			wait for 100 ns;
--			
--			
--			-- Subtract Testing
--			
--			data1 <= "11111111111111111111111111111111";
--			data2 <= "00000000000000000000000000001010";
--			aluop <= "0110";
--			wait for 100 ns;
--			
--			data1 <= "00000000000000000000000000001010";
--			data2 <= "11111111111111111111111111111111";
--			aluop <= "0110";
--			wait for 100 ns;

      wait;
   end process;

END;
