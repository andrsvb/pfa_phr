----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.05.2020 13:04:30
-- Design Name: 
-- Module Name: decoder_puntuacion - Behavioral
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

entity decoder_puntuacion is
 Port ( 
  puntuacion : in integer;
  leds : out std_logic_vector (7 downto 0)
  );
end decoder_puntuacion;
-- Recibe una de las cifras de puntuacion y devuelve el array para encender el led con la forma de la cifra

architecture Behavioral of decoder_puntuacion is

begin

leds <= "00000011" when puntuacion=0 OR puntuacion=10 else  -- 0
        "10011101" when puntuacion=1 else                   -- 1
        "00100101" when puntuacion=2 else                   -- 2
        "00001101" when puntuacion=3 else                   -- 3
        "10011001" when puntuacion=4 else                   -- 4
        "01001001" when puntuacion=5 else                   -- 5
        "01000001" when puntuacion=6 else                   -- 6
        "00011111" when puntuacion=7 else                   -- 7
        "00000001" when puntuacion=8 else                   -- 8
        "00011001" when puntuacion=9;                       -- 9

end Behavioral;
