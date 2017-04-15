----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:50:37 04/01/2017 
-- Design Name: 
-- Module Name:    shifregister_5bit - Behavioral 
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


entity shiftregister_5bit is
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           A : out  STD_LOGIC_VECTOR (4 downto 0);
           clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
			  C : out STD_LOGIC;
           I : in  STD_LOGIC_VECTOR (4 downto 0));
end shiftregister_5bit;



architecture Behavioral of shiftregister_5bit is
		
		COMPONENT dff 
		PORT(
			  d : IN std_logic;
			  clk : IN std_logic;
			  clear : IN std_logic;
			  q : OUT std_logic
			  );
		END COMPONENT;
		
		COMPONENT mux8to1
		PORT(
			  Y : OUT  STD_LOGIC;
           sel : IN  STD_LOGIC_VECTOR (2 downto 0);
           I : IN  STD_LOGIC_VECTOR (7 downto 0)
			 );
		END COMPONENT;
		
		COMPONENT HA
		PORT( 
			  AI : in  STD_LOGIC;
           BI : in  STD_LOGIC;
           CO : out  STD_LOGIC;
           SUM : out  STD_LOGIC);
      END COMPONENT;
----bus
signal data_Q, mux_o : std_logic_vector(4 downto 0); 
signal sI0,sI1,sI2,SI3,sI4 : std_logic_vector (7 downto 0);
signal comp1, comp2, carry : std_logic_vector (4 downto 0);

----single signal
signal nclear: std_logic;			

begin

---------------------------------  1st bit
        mux0 : mux8to1 PORT MAP ( 
			 Y => mux_o(0),
			 sel => sel,
			 I => sI0
			);

        dff0: dff PORT MAP (
          d => mux_o(0),
          clk => clk,
          clear => nclear,
          q => data_Q(0)
        );
		  
		  ha_0 : HA PORT MAP (
			  AI => '1' ,
			  BI => comp1(0) ,
		     CO => carry(0) ,
			  SUM => comp2(0)
		   );
----------------------------------	2nd bit  
		  mux1 : mux8to1 PORT MAP (
			 Y => mux_o(1),
			 sel => sel,
			 I => sI1
		   ); 
		  
		    
		 dff1: dff PORT MAP (
          d => mux_o(1),
          clk => clk,
          clear => nclear,
          q => data_Q(1)
        );
		  
		  ha_1 : HA PORT MAP (
		     AI => carry(0),
			  BI => comp1(1),
		     CO => carry(1) ,
			  SUM => comp2(1) 
		   );
-----------------------------------	  3rd bit
		   mux2 : mux8to1 PORT MAP (
			 Y => mux_o(2),
			 sel => sel,
			 I => sI2
			);
		  
		  dff2: dff PORT MAP (
          d => mux_o(2),
          clk => clk,
          clear => nclear,
          q => data_Q(2)
        );
		  
		  ha_2 : HA PORT MAP (
			  AI => carry(1),
			  BI => comp1(2),
		     CO => carry(2),
			  SUM => comp2(2)
		   );
-----------------------------------		4th bit  
		  mux3 : mux8to1 PORT MAP (
			 Y => mux_o(3),
			 sel => sel,
			 I => sI3
		  );
		  
		 dff3: dff PORT MAP (
          d => mux_o(3),
          clk => clk,
          clear => nclear,
          q => data_Q(3)
        );
		  
		  ha_3 : HA PORT MAP (
			  AI => carry(2),
			  BI => comp1(3),
		     CO => carry(3),
			  SUM => comp2(3)  
		   );
-----------------------------------		5th bit  
		   mux4 : mux8to1 PORT MAP (
			 Y => mux_o(4),
			 sel => sel,
			 I => sI4
		   );
		  
		 dff4: dff PORT MAP (
          d => mux_o(4),
          clk => clk,
          clear => nclear,
          q => data_Q(4)
        );
		  
		  ha_4 : HA PORT MAP (
		     AI => carry(3),
			  BI => comp1(4),
		     CO => carry(4),
			  SUM => comp2(4) 
		   );
-----------------------------------	
---------- SIGNAL MAPPING ---------
sI0 <= (data_Q(0),comp2(0),comp1(0),data_Q(4),data_Q(1),'0',data_Q(1),I(0));
sI1 <= (data_Q(1),comp2(1),comp1(1),data_Q(0),data_Q(2),data_Q(0),data_Q(2),I(1));
sI2 <= (data_Q(2),comp2(2),comp1(2),data_Q(1),data_Q(3),data_Q(1),data_Q(3),I(2));
sI3 <= (data_Q(3),comp2(3),comp1(3),data_Q(2),data_Q(4),data_Q(2),data_Q(4),I(3));
sI4 <= (data_Q(4),comp2(4),comp1(4),data_Q(3),data_Q(0),data_Q(3),'0',I(4));
--- 1's complementary signal mapping----
comp1(0) <= not data_Q(0);
comp1(1) <= not data_Q(1);
comp1(2) <= not data_Q(2);
comp1(3) <= not data_Q(3);
comp1(4) <= not data_Q(4);
----------------------------------------
A <= data_Q;
nclear <= not reset;
C <= carry(4);
end Behavioral;

