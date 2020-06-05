----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.05.2020 12:46:29
-- Design Name: 
-- Module Name: controlador_vidas - Behavioral
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

--Esta entidad controla tanto el número de vidas como que estas vidas se muestren
--de manera adecuada gráficamente a través de los leds de 7 segmentos. 
--Es decir, reúne el funcionamiento de contador_vidas y decoder_vidas. 
--Por tanto, devuelve la variable game_over a '1' si el número de vidas llega a 0 y también
--devuelve el estado que deben tener los leds de las vidas. 

entity controlador_vidas is
 port ( 
  colision : in std_logic;
  tick : in std_logic;
  s_reset: in std_logic;
  game_over : out std_logic;
  leds_vidas : out std_logic_vector (7 downto 0)
  );
end controlador_vidas;

architecture Behavioral of controlador_vidas is

COMPONENT contador_vidas
    port(
	  colision : in std_logic;
      tick : in std_logic;
	  reset: in std_logic;
      vidas : out integer range 0 to 3;
      game_over : out std_logic
	);
END COMPONENT;

COMPONENT decoder_vidas
    port(
      vidas : in integer range 0 to 3;
      leds : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

signal vidas : integer range 0 to 3;

begin

contador0 : contador_vidas port map(
	  colision => colision,
      tick => tick,
      game_over => game_over,
      vidas => vidas,
	  reset => s_reset
	);

decoder0 : decoder_vidas port map(
      vidas => vidas,
      leds => leds_vidas
	);


end Behavioral;
