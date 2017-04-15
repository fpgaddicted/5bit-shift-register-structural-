----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:29:53 03/31/2017 
-- Design Name: 
-- Module Name:    mux8to1 - Behavioral 
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

entity mux8to1 is
    Port ( Y : out  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (2 downto 0);
           I : in  STD_LOGIC_VECTOR (7 downto 0));
end mux8to1;

architecture Behavioral of mux8to1 is
	
begin
process(sel, I)
	begin
		case sel is
			when "000" => Y <= I(0);
			when "001" => Y <= I(1);
			when "010" => Y <= I(2);
			when "011" => Y <= I(3);
			when "100" => Y <= I(4);
			when "101" => Y <= I(5);
			when "110" => Y <= I(6);
			when others => Y <=I(7);
		end case;
end process;

end Behavioral;

