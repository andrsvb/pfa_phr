----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 13:04:30
-- Design Name: 
-- Module Name: contador_puntuacion - Behavioral
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

entity contador_puntuacion is
  port(
    tick : in std_logic;
    s_reset : in std_logic;
    puntuacion : out integer range 0 to 10
  );
end contador_puntuacion;

architecture Behavioral of contador_puntuacion is

signal conta : integer  range 0 to 10 := 0;

begin

process (tick, s_reset)
     begin
       if s_reset = '1' then
            conta <= 0; 
       elsif tick = '1' and tick'event then
         if conta = 0 OR conta = 10 then
            conta <= 1;
         else
            conta <= conta + 1;
         end if;
       end if;
end process;

end Behavioral;
