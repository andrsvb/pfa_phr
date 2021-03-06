----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:11:12
-- Design Name: 
-- Module Name: controlador_led - Behavioral
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

entity controlador_led is
 Port ( 
  obs_prev : in integer range 0 to 5;           -- obstaculo en su posicion, recibido de la posicion anterior
  obs_sig : out integer range 0 to 5;           -- obstaculo en la siguiente posicion
  led : out std_logic_vector (7 downto 0);      -- vector usado para encender un display
  tick_c : in std_logic                         -- se�al de reloj

  );
end controlador_led;
-- Este bloque controla una posicion de las 3 de obstaculos.

architecture Behavioral of controlador_led is

-- para obtener el vector que representa el obstaculo
COMPONENT decoder_obstaculos
 Port ( 
  obs : in integer;
  leds : out std_logic_vector (7 downto 0)
  );
END COMPONENT;

-- para manejar el desplazamiento de obstaculos
COMPONENT registro_o
    Port ( 
      valor_in : in integer range 0 to 5;
      valor_out : out integer range 0 to 5;
      tick : in std_logic
      );
END COMPONENT;
  


begin

-- traduce su obstaculo
decoder_0: decoder_obstaculos port map(
    obs => obs_prev,
    leds => led
    
);

-- desplaza el obstaculo actual a la siguiente posicion
registro_0: registro_o port map(
    tick => tick_c,
    valor_in => obs_prev,
    valor_out => obs_sig
 
 );


end Behavioral;
