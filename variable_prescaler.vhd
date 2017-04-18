----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    21:55:03 04/17/2017 
-- Design Name: 
-- Module Name:    variable_prescaler - Behavioral 
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

entity variable_prescaler is
    Port ( clk_in : in  STD_LOGIC;
           control : in  STD_LOGIC_VECTOR( 1 downto 0);
           reset : in  STD_LOGIC;
           clk_out : out  STD_LOGIC);
end variable_prescaler;

architecture Behavioral of variable_prescaler is

	 signal limit :integer :=0 ;
    signal temporal: STD_LOGIC;
    signal counter : integer range 0 to 50000000 := 0;
begin
	 process(control)
	 begin
		case control is 
			when "00" => limit <= 25000000;
			when "01" => limit <= 12500000;
			when "10" => limit <=  6250000;
			when "11" => limit <=  3125000;
			when others => limit <= 0;
	    end case;
		 end process;
		
	 
    frequency_divider: process (reset, clk_in, limit)
   	 begin
        if (reset = '1') then
            temporal <= '0';
            counter <= 0;
        elsif rising_edge(clk_in) then
            if (counter = limit) then
                temporal <= NOT(temporal);
                counter <= 0;
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;
    
    clk_out <= temporal;
end Behavioral;


