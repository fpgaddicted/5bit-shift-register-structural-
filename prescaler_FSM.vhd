----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:48:55 04/10/2017 
-- Design Name: 
-- Module Name:    dynamic_clk - Behavioral 
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

entity prescaler_FSM is
    Port ( clk : in STD_LOGIC;
			  toggle : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clk_state : out  STD_LOGIC_VECTOR (1 downto 0));
end prescaler_FSM;

architecture behavioral of prescaler_FSM is
type control is (clk1,clk2,clk3,clk4);
signal next_state :control;



   begin
	
	 
	 
FSM:process (clk, reset ,next_state, toggle)
		 begin
			if reset ='1' then
				next_state <= clk1;
			
			elsif (clk' event and clk ='1') then
			
				
			case next_state is
			
			  
						
				when clk1 =>
				if toggle = '1' then
					next_state <= clk2;
				else 
					next_state <= clk1;
					clk_state <= "00";
				end if;
				
--------------------------------------		
					
			   when clk2 =>
				if toggle = '1' then
					 next_state <= clk3;
				else 
					next_state <= clk2;
					clk_state <= "01";
				end if;
--------------------------------------			
				
			   when clk3 =>
				if toggle = '1' then
					 next_state <= clk4;
				else 
					next_state <= clk3;
					clk_state <= "10";
				end if;
------------------------------------			
				
			   when clk4 =>
				if toggle = '1' then
					 next_state <= clk1;
				else
					next_state <= clk4;
					clk_state <= "11";
				end if;				
			end case;
		 end if;
	end process FSM;

end behavioral;

