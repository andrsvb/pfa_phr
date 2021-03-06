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

--Esta entidad se encarga de cambiar el número de vidas
--teniendo en cuenta las posibles colisiones del jugador 
--con los obstaculos, la muerte del jugador (game over)
--y la activación del botón reset. Si ocurre una de estas
--últimas dos situaciones se resetea el número de vidas. 

entity contador_vidas is
  port(
    colision : in std_logic;
    tick : in std_logic;
	reset: in std_logic;
    game_over : out std_logic;
    vidas : out integer range 0 to 3
  );
end contador_vidas;

architecture Behavioral of contador_vidas is

signal s_vidas : integer range 0 to 3 := 3;

begin

game_over <= '1' when s_vidas = 0 else '0';
vidas <= s_vidas;

process (tick, reset)
     begin
       if reset = '1' then
                s_vidas <= 3;
       elsif tick = '1' and tick'event then
         if colision = '1' then
            if s_vidas > 0 then
                s_vidas <= s_vidas - 1;
			end if;
         end if;
       end if;
end process;

end Behavioral;
