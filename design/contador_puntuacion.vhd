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
    tick : in std_logic;                        -- señal de reloj
    s_reset : in std_logic;                     -- señal de reset
    puntuacion : out integer range 0 to 10      -- salida de puntuacion
  );
end contador_puntuacion;
-- Con el 0 como estado inicial, cuenta el numero de flancos de subida de la señal de reloj ( tick ) hasta 10 y los saca ( puntuacion )
--      Cuando llega a 10 es como si hubiese un 0 pero no vuelve a 0 para diferenciar entre el estado inicial y un 0 alcanzado contando
--      Cuando recibe un 1 en s_reset vuelve al estado inicial
-- Sirve para contar cada cifra independientemente

architecture Behavioral of contador_puntuacion is

signal conta : integer  range 0 to 10 := 0;     -- inicializado a 0

begin

process (tick, s_reset)
     begin
       if s_reset = '1' then                    -- volver al estado inicial
            conta <= 0; 
       elsif tick = '1' and tick'event then
         if conta = 10 then                     -- pasar del estado 10 al estado 1
            conta <= 1;
         else
            conta <= conta + 1;                 -- seguir contando de forma normal
         end if;
       end if;
end process;

puntuacion <= conta;

end Behavioral;
