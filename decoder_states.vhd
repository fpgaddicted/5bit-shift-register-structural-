----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:59:22 04/09/2017 
-- Design Name: 
-- Module Name:    decoder_states - Behavioral 
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

entity decoder_states is
    Port ( op : in  STD_LOGIC_VECTOR (3 downto 0);
           data_o : buffer  STD_LOGIC_VECTOR (0 to 7);
			  anode_s : in STD_LOGIC_VECTOR (3 downto 0));
end decoder_states;

architecture Behavioral of decoder_states is

begin
	process (op,anode_s,data_o)
		begin
		 case anode_s is
		  when "0111" =>
				case op is 
					when "0000" => data_o <= "11100011"; -- L
					when "0001" => data_o <= "01001001"; -- S
					when "0010" => data_o <= "01001001"; -- S
					when "0011" => data_o <= "11000001"; -- b
					when "0100" => data_o <= "11000001"; -- b
					when "0101" => data_o <= "11100101"; -- c
					when "0110" => data_o <= "11100101"; -- c
					when "0111" => data_o <= "11010001"; -- h
					when "1000" => data_o <= "11100101"; -- c
					when others => data_o <= "11111110"; -- blank
				end case;
				
			when "1011" => 
				case op is 
					when "0000" => data_o <= "11000101"; -- o
					when "0001" => data_o <= "11110101"; -- r
					when "0010" => data_o <= "11100011"; -- L
					when "0011" => data_o <= "11110101"; --
					when "0100" => data_o <= "11110101";
					when "0101" => data_o <= "11000101";
					when "0110" => data_o <= "11000101";
					when "0111" => data_o <= "11000101";
					when "1000" => data_o <= "10011111";
					when others => data_o <= "11111110"; -- blank
				end case;
				
				when "1101" => 
				case op is 
					when "0000" => data_o <= "00000101"; -- a
					when "0001" => data_o <= "11110011"; -- l
					when "0010" => data_o <= "11100011"; -- L
					when "0011" => data_o <= "11110010"; -- l.
					when "0100" => data_o <= "11110010"; -- l.
					when "0101" => data_o <= "11111111";
					when "0110" => data_o <= "11111111";
					when "0111" => data_o <= "11110011";
					when "1000" => data_o <= "11110101";
					when others => data_o <= "11111110"; -- blank
				end case;
				
				when others =>
				case op is 
					when "0000" => data_o <= "10000101"; --d
					when "0001" => data_o <= "11111111"; -- blank
					when "0010" => data_o <= "11111111"; -- blank 
					when "0011" => data_o <= "11110101"; -- r
					when "0100" => data_o <= "11100011"; --L
					when "0101" => data_o <= "10011111"; --1
					when "0110" => data_o <= "00100101"; --2
					when "0111" => data_o <= "10000101"; --d
					when "1000" => data_o <= "11111111"; --blank
					when others => data_o <= "11111110"; -- blank
				
				end case;
		end case;
	end process;
					


end Behavioral;

