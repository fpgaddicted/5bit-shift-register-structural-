----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    03:28:39 04/11/2017 
-- Design Name: 
-- Module Name:    variable_clock - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity clk_controller is
    Port ( clk : in  STD_LOGIC;
           toggle : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clk_o : out  STD_LOGIC);
end clk_controller;

architecture PORTMAP of clk_controller is

			COMPONENT prescaler_FSM IS
			PORT(
			  clk : in STD_LOGIC;
			  toggle : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clk_state : out  STD_LOGIC_VECTOR (1 downto 0));
			 END COMPONENT;
			 
			 COMPONENT quad_prescaler IS
			 PORT(
			  clk_in : in  STD_LOGIC;
           clk_out : out  STD_LOGIC;
			  control : in STD_LOGIC_VECTOR(1 downto 0);
           reset : in  STD_LOGIC);
			  END COMPONENT;
			  
			  
			  COMPONENT debounce IS
			  PORT ( 
			  clk : in STD_LOGIC;
			  button : in STD_LOGIC;
			  result : out STD_LOGIC);
			  END COMPONENT;
			  
signal operation : std_logic_vector(1 downto 0);
signal i_c : std_logic;
signal tp: std_logic;

			  

begin   

			debounceP : debounce PORT MAP(
				clk => clk,
				button => toggle,
				result => tp
			);
			
         
			FSM : prescaler_FSM PORT MAP( 
				toggle => tp,
				reset => reset,
				clk => clk,
				clk_state => operation
				);
				
				
			 clk_div : quad_prescaler PORT MAP(
				 clk_in => clk,
				 clk_out => i_c,
				 reset => reset,
				 control => operation
				);
				
	clk_o <= i_c;
				
			

end PORTMAP;

