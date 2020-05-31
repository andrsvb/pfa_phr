----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 12:42:41
-- Design Name: 
-- Module Name: contador_v1 - Behavioral
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

entity contador_v1 is
  port(
    clk : in std_logic;
    tick : out std_logic
  );
end contador_v1;

architecture Behavioral of contador_v1 is

signal conta : std_logic := '0';

begin

process ( clk )
	begin
	if  clk = '1' and clk'event then
         if conta = '1' then
            conta <= '0';
         else
            conta <= '1';
         end if;
	end if;
end process;

tick <= '1' when conta = '1' else '0';

end Behavioral;
