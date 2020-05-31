----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:26:02
-- Design Name: 
-- Module Name: juego - Behavioral
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

entity juego is
  port(
    clk : in std_logic;
    reset : in std_logic;
    boton_speed : in std_logic;
    boton_pausa : in std_logic;
    up : in std_logic;
    down : in std_logic;
    displays_anodes : out std_logic_vector (7 downto 0);
    displays_cathodes : out std_logic_vector (7 downto 0);
    puntuacion : out std_logic_vector (9 downto 0)
  );
end juego;

architecture Behavioral of juego is

COMPONENT controlador_velocidad
    port(
      clk : in std_logic;
      speed : in std_logic;
      tick : out std_logic
	);
END COMPONENT;

COMPONENT controlador_posicion
    port(
      tick : in std_logic;
      s_reset : in std_logic;
      up : in std_logic;
      down : in std_logic;
      posicion : out integer range 0 to 2;
      leds : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

COMPONENT controlador_obstaculos 
    port(
      tick : in std_logic;
      s_reset : in std_logic;
      leds_obs0 : out std_logic_vector (7 downto 0);
      leds_obs1 : out std_logic_vector (7 downto 0);
      leds_obs2 : out std_logic_vector (7 downto 0);
      obstaculo3 : out integer range 0 to 5
	);
END COMPONENT;

COMPONENT controlador_colision 
    port(
      tick : in std_logic;
      posicion : in integer range 0 to 2;
      obstaculo3 : in integer range 0 to 5;
      colision : out std_logic
	);
END COMPONENT;

COMPONENT controlador_vidas 
    port(
      tick : in std_logic;
      colision : in std_logic;
      s_reset : in std_logic;
      game_over : out std_logic;
      leds_vidas : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

COMPONENT controlador_puntuacion 
    port(
      tick : in std_logic;
      s_reset : in std_logic;
      leds_p0 : out std_logic_vector (7 downto 0);
      leds_p1 : out std_logic_vector (7 downto 0);
      leds_p2 : out std_logic_vector (7 downto 0);
      puntuacion : out std_logic_vector (9 downto 0)
	);
END COMPONENT;

COMPONENT controlador_displays
    port(
        clk : in std_logic;
        leds_personaje : in std_logic_vector (7 downto 0);
        leds_obs2 : in std_logic_vector (7 downto 0);
        leds_obs1 : in std_logic_vector (7 downto 0);
        leds_obs0 : in std_logic_vector (7 downto 0);
        leds_vidas : in std_logic_vector (7 downto 0);
        leds_p2 : in std_logic_vector (7 downto 0);
        leds_p1 : in std_logic_vector (7 downto 0);
        leds_p0 : in std_logic_vector (7 downto 0);
        displays_anodes : out std_logic_vector (7 downto 0);
        displays_cathodes : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

COMPONENT controlador_pausa 
  port(
    boton_pausa : in std_logic;
    clk_in : in std_logic;
    clk_out : out std_logic
  );
END COMPONENT;

COMPONENT estado_velocidad 
  port(
    boton_speed : in std_logic;
    speed : out std_logic
  );
END COMPONENT;

signal tick : std_logic;
signal posicion : integer range 0 to 2;
signal obstaculo3 : integer range 0 to 5;
signal colision : std_logic;
signal game_over : std_logic;
signal signal_reset : std_logic;
signal speed : std_logic;
signal s_clk : std_logic;
signal leds_personaje : std_logic_vector (7 downto 0);
signal leds_obs2 : std_logic_vector (7 downto 0);
signal leds_obs1 : std_logic_vector (7 downto 0);
signal leds_obs0 : std_logic_vector (7 downto 0);
signal leds_vidas :  std_logic_vector (7 downto 0);
signal leds_p2 : std_logic_vector (7 downto 0);
signal leds_p1 : std_logic_vector (7 downto 0);
signal leds_p0 : std_logic_vector (7 downto 0);

begin

c_ve : controlador_velocidad
    port map(
      clk => s_clk,
      speed => speed,
      tick => tick
	);

c_po : controlador_posicion
    port map(
      tick => tick,
      s_reset => signal_reset,
      up => up,
      down => down,
      posicion => posicion,
      leds => leds_personaje
	);

c_o : controlador_obstaculos 
    port map(
      tick => tick,
      s_reset  => signal_reset,
      leds_obs0  => leds_obs0,
      leds_obs1  => leds_obs1,
      leds_obs2  => leds_obs2,
      obstaculo3  => obstaculo3
	);

c_c : controlador_colision 
    port map(
      tick => tick,
      posicion => posicion,
      obstaculo3 => obstaculo3,
      colision => colision
	);

c_vi : controlador_vidas 
    port map(
      tick => tick,
      colision => colision,
      s_reset => signal_reset,
      game_over => game_over,
      leds_vidas => leds_vidas
	);

c_pu : controlador_puntuacion 
    port map(
      tick => tick,
      s_reset => signal_reset,
      leds_p0 => leds_p0,
      leds_p1 => leds_p1,
      leds_p2 => leds_p2,
      puntuacion => puntuacion
	);
	
c_d : controlador_displays
    port map(
        clk => clk,
        leds_personaje => leds_personaje,
        leds_obs2 => leds_obs2,
        leds_obs1 => leds_obs1,
        leds_obs0 => leds_obs0,
        leds_vidas => leds_vidas,
        leds_p2 => leds_p2,
        leds_p1 => leds_p1,
        leds_p0 => leds_p0,
        displays_anodes => displays_anodes,
        displays_cathodes => displays_cathodes
	);

c_pau : controlador_pausa 
  port map(
    boton_pausa => boton_pausa,
    clk_in => clk,
    clk_out => s_clk
  );

e_ve : estado_velocidad 
  port map(
    boton_speed => boton_speed,
    speed => speed
  );
  
signal_reset <= reset OR game_over;

end Behavioral;
