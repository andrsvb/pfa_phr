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

entity controlador_puntuacion is
 port ( 
  tick : in std_logic;
  s_reset : in std_logic;
  leds_p0 : out std_logic_vector (7 downto 0);
  leds_p1 : out std_logic_vector (7 downto 0);
  leds_p2 : out std_logic_vector (7 downto 0);
  puntuacion : out std_logic_vector (9 downto 0)
  );
end controlador_puntuacion;

architecture Behavioral of controlador_puntuacion is

component contador_puntuacion 
    port(
      tick : in std_logic;
      s_reset : in std_logic;
      puntuacion : out integer range 0 to 10
	);
end component;

component decoder_puntuacion 
    port(
      puntuacion : in integer range 0 to 10;
      leds : out std_logic_vector (7 downto 0)
	);
end component;

component salida_puntuacion is
    port(
        p0 : in integer range 0 to 10;
        p1 : in integer range 0 to 10;
        p2 : in integer range 0 to 10;
        puntuacion : out std_logic_vector (9 downto 0)
	);
end component;

signal p0 : integer range 0 to 10;
signal tick1 : std_logic;
signal p1 : integer range 0 to 10;
signal tick2 : std_logic;
signal p2 : integer range 0 to 10;

begin

contador0 : contador_puntuacion port map(
      tick => tick,
      s_reset => s_reset,
      puntuacion => p0
	);

decoder0 : decoder_puntuacion port map(
      puntuacion => p0,
      leds => leds_p0
	);

tick1 <= '1' when (p0 = 10) else '0';

contador1 : contador_puntuacion port map(
      tick => tick1,
      s_reset => s_reset,
      puntuacion => p1
	);

decoder1 : decoder_puntuacion port map(
      puntuacion => p1,
      leds => leds_p1
	);

tick2 <= '1' when (p1 = 10) else '0';

contador2 : contador_puntuacion port map(
      tick => tick2,
      s_reset => s_reset,
      puntuacion => p2
	);

decoder2 : decoder_puntuacion port map(
      puntuacion => p2,
      leds => leds_p2
	);

salida_p : salida_puntuacion port map(
      puntuacion => puntuacion,
      p0 => p0,
      p1 => p1,
      p2 => p2
	);

end Behavioral;
