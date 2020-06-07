----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 12:46:29
-- Design Name: 
-- Module Name: controlador_puntuacion - Behavioral
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

--Este componente controla todo lo que tiene que ver con la actualización de la posición del personaje del jugador, recibe la posición
--actual, las señales del joystick y la señal de reloj y actualiza (dependiendo de las entradas up y down) y traduce la posición 
--recibida como entero a una secuencia de bits representable por el display de 7 segmentos.

entity controlador_posicion is
 port ( 
  tick : in std_logic;
  up : in std_logic;
  down : in std_logic;
  s_reset : in std_logic;
  leds : out std_logic_vector (7 downto 0);
  posicion : out integer  range 0 to 2
  );
end controlador_posicion;

architecture Behavioral of controlador_posicion is

COMPONENT mux_41 
    port(
      A,B,C,D : in integer range 0 to 2;
      S0,S1: in std_logic;
      Z: out integer range 0 to 2

	);
END COMPONENT;

COMPONENT up_pos 
    port(
      posicion_u : in integer range 0 to 2;
      u_posicion : out integer range 0 to 2
	);
END COMPONENT;

COMPONENT down_pos 
    port(
     posicion_d : in integer range 0 to 2;
     d_posicion : out integer range 0 to 2 
	);
END COMPONENT;

COMPONENT registro_p
    port(
      new_pos : in integer range 0 to 2;
      pos_r : out integer range 0 to 2;
      tick_r : in std_logic
	);
END COMPONENT;

COMPONENT decoder_posicion 
    port(
       posicion_d : in integer range 0 to 2;
       leds : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

signal s_posi : integer range 0 to 2;
signal new_posi : integer range 0 to 2;
signal posicion_upeada : integer range 0 to 2;
signal posicion_downeada : integer range 0 to 2;
signal posicion_zero : integer range 0 to 2;
signal down_r : std_logic;
signal up_r : std_logic;

begin

posicion_zero <= 0;

registro_posicion : registro_p port map(
      tick_r => tick,
      new_pos => new_posi,
      pos_r => s_posi
);

upeador_pos : up_pos port map(
    posicion_u => s_posi,
    u_posicion => posicion_upeada
);

downeador_pos : down_pos port map(
    posicion_d => s_posi,
    d_posicion => posicion_downeada
);

down_r <= down OR s_reset;
up_r <= up OR s_reset;

mux : mux_41 port map(
    S0 => down_r,
    S1 => up_r,
    A => s_posi,
    B => posicion_downeada,
    C => posicion_upeada,
    D => posicion_zero,
    Z => new_posi
);
	
decoder_0 : decoder_posicion port map(
    posicion_d => s_posi,
    leds => leds
);

posicion <= s_posi;

end Behavioral;
