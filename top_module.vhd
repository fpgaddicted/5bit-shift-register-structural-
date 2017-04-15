----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    23:49:40 04/09/2017 
-- Design Name: 
-- Module Name:    top_module - Behavioral 
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

entity display_controller is
    Port ( seg7 : out  STD_LOGIC_VECTOR (0 to 7);
           clk : in  STD_LOGIC;
			  opcode : in STD_LOGIC_VECTOR (2 downto 0);
			  reset : in STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
end display_controller;

architecture Driver of display_controller is
		
			COMPONENT decoder_states IS
			PORT (
				op : in  STD_LOGIC_VECTOR (3 downto 0);
				data_o : out  STD_LOGIC_VECTOR (0 to 7);
				anode_s : in STD_LOGIC_VECTOR (3 downto 0));
			END COMPONENT;
			
			COMPONENT anode_fsm IS
			PORT ( 
			  clk : in  STD_LOGIC;
           anode_o : out  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC);
			END COMPONENT;
			
			COMPONENT prescaler IS
			PORT (
				clk_in : in  STD_LOGIC;
				reset  : in  STD_LOGIC;
				clk_out: out STD_LOGIC);
			END COMPONENT;
				
signal an : std_logic_vector (3 downto 0);
signal click : std_logic;
signal dec : std_logic_vector (3 downto 0);


begin
				fsm1 : anode_fsm 
				PORT MAP (
					clk => click,
					anode_o => an,
					reset => reset
				);
				
				display : decoder_states 
				PORT MAP (
					op => dec,
					data_o => seg7,
					anode_s => an
				);
				
				clock : prescaler
				PORT MAP (
					clk_in => clk,
					clk_out => click,
					reset => reset
				);
					
				
				
				anodes <= an;
				dec <=(reset,opcode(2),opcode(1),opcode(0));
				
					
				

end Driver;
