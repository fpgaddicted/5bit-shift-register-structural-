--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:15:15 04/08/2017
-- Design Name:   
-- Module Name:   C:/Users/Stefan/Desktop/shiftreg_5bit/shiftregister_tb.vhd
-- Project Name:  shiftreg_5bit
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: shifregister_5bit
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
 
ENTITY shiftregister_tb IS
END shiftregister_tb;
 
ARCHITECTURE behavior OF shiftregister_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT shifregister_5bit
    PORT(
         sel : IN  std_logic_vector(2 downto 0);
         A : OUT  std_logic_vector(4 downto 0);
         clk : IN  std_logic;
         reset : IN  std_logic;
         I : IN  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(2 downto 0) := (others => '0');
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal I : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal A : std_logic_vector(4 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: shifregister_5bit PORT MAP (
          sel => sel,
          A => A,
          clk => clk,
          reset => reset,
          I => I
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 10 ns;
		sel <= "000";
		I <= "10101";
      wait for clk_period*5;
		
		sel <= "000";
		I <= "10101";
		wait for clk_period*1;
		sel <= "011";
		

      wait for clk_period*10;
		
		 
		--sel <= "010";
		--I <= "01010":
	wait for clk_period*5;
		

      -- insert stimulus here 

      wait;
   end process;

END;
