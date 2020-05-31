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

entity registro_o is
 Port ( 
  valor_in : in integer range 0 to 5;
  valor_out : out integer range 0 to 5;
  tick : in std_logic
  );
end registro_o;

architecture Behavioral of registro_o is

begin

identifier : process (tick)
begin 
	if (rising_edge(tick)) then 
			valor_out <= valor_in;
		end if;
	end process;

end Behavioral;