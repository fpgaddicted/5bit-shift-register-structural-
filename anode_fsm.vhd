----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:40:27 04/09/2017 
-- Design Name: 
-- Module Name:    anode_fsm - Behavioral 
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

entity anode_fsm is
    Port ( clk : in  STD_LOGIC;
           anode_o : out  STD_LOGIC_VECTOR (3 downto 0);
           reset : in  STD_LOGIC);
end anode_fsm;

architecture Behavioral of anode_fsm is
type control is (an3,an2,an1,an0);
signal next_state :control;

begin 
	process(clk, next_state)
		
		begin
		if (clk' event and clk='1') then
		
		case next_state is
		when an3 =>
		    if reset ='1' then
				next_state <=an3;
			  else

				anode_o <= "0111";
				next_state <= an2;
				
			end if;
		when an2 =>
				if reset ='1' then
					next_state <=an3;
				else 
				  anode_o <= "1011";
				  next_state <= an1;
				  
				end if;
		when an1 =>
				if reset ='1' then
					next_state <=an3;
				else 
				  anode_o <= "1101";
				  next_state <= an0;
				  
				 end if;
		when an0 =>
				if reset ='1' then 
					next_state <= an3;
				else
					anode_o <= "1110";
					next_state <= an3;
					
				end if;
		end case;
	  end if;
	end process;
					
end Behavioral;

