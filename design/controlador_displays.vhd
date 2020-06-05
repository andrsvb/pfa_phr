----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 01:37:43
-- Design Name: 
-- Module Name: controlador_displays - Behavioral
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

entity controlador_displays is
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
end controlador_displays;
-- Enciende en cada ciclo de la señal de reloj ( clk ) un solo display con display_anodes,
--      de la forma recibida en cada array de leds con display_cathdes, según cuantos ciclos de reloj hay contados.
--      Con 0 enciende el led del personaje, con de 1 a 3 los leds de obstaculos, con 4 el de vidas y con de 5 a 7 los de puntuacion

architecture Behavioral of controlador_displays is

-- contador de 0 a 7
COMPONENT contador8
    port(
      clk : in std_logic;
      selector : out integer range 0 to 7
	);
END COMPONENT;

-- decodificar para encender un solo display
COMPONENT decoder_anodes
    port(
      selector : in integer range 0 to 7;
      displays_anodes : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

-- multiplexor para coger un array de leds
COMPONENT mux_8_1
    port(
        leds_personaje : in std_logic_vector (7 downto 0);
        leds_obs2 : in std_logic_vector (7 downto 0);
        leds_obs1 : in std_logic_vector (7 downto 0);
        leds_obs0 : in std_logic_vector (7 downto 0);
        leds_vidas : in std_logic_vector (7 downto 0);
        leds_p2 : in std_logic_vector (7 downto 0);
        leds_p1 : in std_logic_vector (7 downto 0);
        leds_p0 : in std_logic_vector (7 downto 0);
        selector : in integer range 0 to 7;
        displays_cathodes : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

signal selector : integer range 0 to 7;         -- señal interna para indicar que display enciende y cómo

begin

-- de donde saca el valor de selector
conta : contador8
    port map(
      clk => clk,
      selector => selector
	);

-- para encender un solo display
decoder : decoder_anodes
    port map(
      selector => selector,
      displays_anodes => displays_anodes
	);

-- para encender el display de la forma indicada
mux : mux_8_1
    port map(
        leds_personaje => leds_personaje,
        leds_obs2 => leds_obs2,
        leds_obs1 => leds_obs1,
        leds_obs0 => leds_obs0,
        leds_vidas => leds_vidas,
        leds_p2 => leds_p2,
        leds_p1 => leds_p1,
        leds_p0 => leds_p0,
        selector => selector,
        displays_cathodes => displays_cathodes
	);

end Behavioral;
