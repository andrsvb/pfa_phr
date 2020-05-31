----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_controlador_puntuacion - Behavioral
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

entity test_controlador_vidas is
--  Port ( );
end test_controlador_vidas;

architecture Behavioral of test_controlador_vidas is

component controlador_vidas is
 port ( 
  colision : in std_logic;
  tick : in std_logic;
  s_reset : out std_logic;
  leds_vidas : out std_logic_vector (7 downto 0);
  reset_button: in std_logic
  );
end component;

signal colision_in : std_logic;
signal tick_in : std_logic;
signal s_reset_out : std_logic;
signal reset_button_in : std_logic;
signal leds_vidas_out : std_logic_vector (7 downto 0);


begin

t_controlador : controlador_vidas port map(
  colision => colision_in,
  tick => tick_in,
  s_reset => s_reset_out,
  leds_vidas => leds_vidas_out,
  reset_button => reset_button_in
);
 
 t_process : process
 
 begin
 
    --Bajada de vidas (de 3 a 0)
	reset_button_in <= '0';
	colision_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
	reset_button_in <= '0';
    colision_in <= '1'; -- Primera colision (2 vidas)
    tick_in <= '1';
    wait for 100 ns;
	reset_button_in <= '0';
    colision_in <= '1'; -- Segunda colision (1 vida)
	tick_in <= '0';
	wait for 100 ns;
	reset_button_in <= '0';
	colision_in <= '1'; -- Tercera colision (0 vidas)
	tick_in <= '1';  
	wait for 100 ns;
	
    -- Se pulsa el botón reset 
    reset_button_in <= '0';
	colision_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
	reset_button_in <= '0';
	colision_in <= '1'; -- Primera colision (2 vidas)
    tick_in <= '1';
    wait for 100 ns;
	reset_button_in <= '1'; --Botón reset = 1;
	colision_in <= '0'; 
    tick_in <= '0';
    wait for 100 ns;
	
 end process;

end Behavioral;
