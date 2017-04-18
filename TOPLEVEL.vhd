----------------------------------------------------------------------------------
-- Company: 
-- Engineer: Stefan Naco
-- 
-- Create Date:    04:18:26 04/11/2017 
-- Design Name: 
-- Module Name:    TOPLEVEL - Behavioral 
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

entity TOPLEVEL is
    Port ( clk_i : in  STD_LOGIC;
           toggle : in  STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (3 downto 0);
           disp : out  STD_LOGIC_VECTOR (0 to 7);
           leds_data : out  STD_LOGIC_VECTOR (4 downto 0);
			  led_p: out STD_LOGIC;
			  ledC : out STD_LOGIC;
			  carry_optional : out  STD_LOGIC;
           reset : in  STD_LOGIC;
			  opcode : in STD_LOGIC_VECTOR (2 downto 0);
			  data : in STD_LOGIC_VECTOR (4 downto 0);
           clear : in  STD_LOGIC);
end TOPLEVEL;

architecture PORTMAP of TOPLEVEL is
	 COMPONENT clk_controller IS
	 PORT ( clk : in  STD_LOGIC;
           toggle : in  STD_LOGIC;
			  reset : in STD_LOGIC;
           clk_o : out  STD_LOGIC);
	 END COMPONENT;
	 
	 COMPONENT display_controller IS
	 PORT ( seg7 : out  STD_LOGIC_VECTOR (0 to 7);
           clk : in  STD_LOGIC;
			  opcode : in STD_LOGIC_VECTOR (2 downto 0);
			  reset : in STD_LOGIC;
           anodes : out  STD_LOGIC_VECTOR (3 downto 0));
	 END COMPONENT;
	 
	 COMPONENT shiftregister_5bit IS
	 PORT ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           A : out  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
			  C : out STD_LOGIC;
           reset : in  STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (4 downto 0));
	 END COMPONENT;
	 
	 COMPONENT debounce IS
	 PORT ( clk : in STD_LOGIC;
			  button : in STD_LOGIC;
			  result : out STD_LOGIC);
	 END COMPONENT;
	 
			  	 
signal reg_bus : std_logic_vector (4 downto 0);
signal clk1,t_p : std_logic;
signal command : std_logic_vector (2 downto 0);


begin   

			segment7 : display_controller PORT MAP(
				anodes => anodes,
				seg7 => disp,
				opcode => command,
				clk => clk_i,
				reset => reset
				);
				
			cp : clk_controller PORT MAP(
				clk => clk_i,
				toggle => t_p,
				reset => reset,
				clk_o => clk1	
				);
				
			reg : shiftregister_5bit PORT MAP(
				sel => command,
				A => reg_bus,
				clk => clk1,
				reset => clear,
				I => data,
				C => carry_optional
			   );
				
			debA :debounce PORT MAP (
				clk => clk_i,
				button => toggle,
				result => t_p
			);
			


 leds_data <= reg_bus;
 command <= opcode;
 ledC <= clk1;
 led_p <= t_p;
end PORTMAP ;

