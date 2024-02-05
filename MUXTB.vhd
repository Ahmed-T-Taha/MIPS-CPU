--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:16:39 05/16/2022
-- Design Name:   
-- Module Name:   G:/Mixes/Phase2/MUXTB.vhd
-- Project Name:  Phase2
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: MUX
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY MUXTB IS
END MUXTB;
 
ARCHITECTURE behavior OF MUXTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT MUX
    PORT(
         mux_input0 : IN  std_logic_vector(5 downto 0);
         mux_input1 : IN  std_logic_vector(5 downto 0);
         mux_control : IN  std_logic;
         mux_out : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal mux_input0 : std_logic_vector(5 downto 0) := (others => '0');
   signal mux_input1 : std_logic_vector(5 downto 0) := (others => '0');
   signal mux_control : std_logic := '0';

 	--Outputs
   signal mux_out : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MUX PORT MAP (
          mux_input0 => mux_input0,
          mux_input1 => mux_input1,
          mux_control => mux_control,
          mux_out => mux_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 

      wait;
   end process;

END;
