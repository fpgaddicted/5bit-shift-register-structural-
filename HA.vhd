----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stefan Naco
-- 
-- Create Date:    11:24:14 04/05/2017 
-- Design Name: 
-- Module Name:    HA - Behavioral 
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

entity HA is
    Port ( AI : in  STD_LOGIC;
           BI : in  STD_LOGIC;
           CO : out  STD_LOGIC;
           SUM : out  STD_LOGIC);
end HA;

architecture Behavioral of HA is
	

begin

   sum <= AI xor BI;	
	co <= AI and BI;



end Behavioral;

