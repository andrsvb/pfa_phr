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

--Esta entidad se encarga de hacer visuales
--las vidas que quedan a través de
--los leds de 7 segmentos 

entity decoder_vidas is
 Port ( 
  vidas : in integer range 0 to 3;
  leds : out std_logic_vector (7 downto 0)
  );
end decoder_vidas;

architecture Behavioral of decoder_vidas is

begin

--Los números binarios indican qué leds se iluminarán '1' y cuales no '0' para 
--mostrar gráficamente cuántas vidas quedan de tal manera que 
--se iluminarán 3 rayitas horizontales (3 vidas)
--dos rayitas horizontales (2 vidas), 1 rayita horizontal (1 vida)
--o el número 0, (0 vidas)
 
leds <= "00000011" when vidas=0  else 
        "11101111" when vidas=1 else
        "11101101" when vidas=2 else
        "01101101" when vidas=3 ;

end Behavioral;
