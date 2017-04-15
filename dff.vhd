----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:26:44 03/31/2017 
-- Design Name: 
-- Module Name:    dff - Behavioral 
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

entity dff is
    Port ( d : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           clear : in  STD_LOGIC;
           q : out  STD_LOGIC);
end dff;

architecture Behavioral of dff is

begin
	process(clk, clear)
	 begin
	  if clk' event and clk ='1' then
			if clear ='0' then
				q <= '0';
			else
				q <= d;
			end if;
		end if;
	end process;
		    
end Behavioral;

