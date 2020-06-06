----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2020 20:39:19
-- Design Name: 
-- Module Name: decoder_obstaculos - Behavioral
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

entity decoder_obstaculos is
 Port ( 
  obs : in integer range 0 to 5;
  leds : out std_logic_vector (7 downto 0)
  );
end decoder_obstaculos;
-- Este bloque devuelve el vector necesario para reflejar en un display el obstaculo recibido

architecture Behavioral of decoder_obstaculos is

begin

leds <= "11111111" when obs=0 else          -- obstaculo vacio
        "11101111" when obs=1 else          -- obstaculo abajo
        "11111101" when obs=2 else          -- obstaculo en medio
        "01111111" when obs=3 else          -- obstaculo arriba
        "11000101" when obs=4 else          -- obstaculo abajo grande
        "00111001" when obs=5;              -- obstaculo arriba grande

end Behavioral;