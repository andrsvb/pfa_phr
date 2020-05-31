----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 12:46:29
-- Design Name: 
-- Module Name: generador_obstaculos - Behavioral
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

entity generador_obstaculos is
  port(
    tick : in std_logic;
    s_reset : in std_logic;
    obs: out  integer range 0 to 5

  );


end generador_obstaculos;

 --sacar por una variable numero de 0 a 4 recibe tick 
architecture Behavioral of generador_obstaculos is

signal conta : integer  range 0 to 5 := 0;
begin

process (tick, s_reset)
     begin
       if s_reset = '1' then
            conta <= 0; 
       elsif tick = '1' and tick'event then
         if conta = 5 then
            conta <= 1;
         else
            conta <= conta + 1;
         end if;
       end if;
end process;
obs <= conta;
end Behavioral;
