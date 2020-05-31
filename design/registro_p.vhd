----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 12:39:59
-- Design Name: 
-- Module Name: multi_posicion - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity registro_p is
 Port ( 
      new_pos : in integer range 0 to 2;
      pos_r : out integer range 0 to 2;
      tick_r : in std_logic
  );
end registro_p;

architecture Behavioral of registro_p is

begin

identifier : process (tick_r)
begin 
	if (rising_edge(tick_r)) then 
			pos_r <= new_pos;
		end if;
	end process;

end Behavioral;