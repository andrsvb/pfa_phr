----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_contador_puntuacion - Behavioral
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

entity test_controlador_posicion is
--  Port ( );
end test_controlador_posicion;

architecture Behavioral of test_controlador_posicion is

component controlador_posicion is
  port(
  tick : in std_logic;
  up : in std_logic;
  down : in std_logic;
  s_reset : in std_logic;
  leds : out std_logic_vector (7 downto 0);
  posicion : out integer range 0 to 2
  );
end component;

signal tick_in : std_logic;
signal up_in : std_logic;
signal down_in : std_logic;
signal reset_in : std_logic;
signal pos_out : integer range 0 to 2;
signal led_out : std_logic_vector (7 downto 0);

begin

t_controlador : controlador_posicion port map(
    tick => tick_in,
    up => up_in,
    down => down_in,
    s_reset => reset_in,
    leds => led_out,
    posicion => pos_out
 );
 
 t_process : process
 begin
    --reset
    reset_in <= '1';
    up_in <= '0';
    down_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
    reset_in <= '1';
    up_in <= '0';
    down_in <= '0';
    tick_in <= '1';
    --mantener pos
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '0';
    down_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '0';
    down_in <= '0';
    tick_in <= '1';
    --arriba
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '1';
    down_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '1';
    down_in <= '0';
    tick_in <= '1';
    --abajo
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '0';
    down_in <= '1';
    tick_in <= '0';
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '0';
    down_in <= '1';
    tick_in <= '1';
    --este es imposible/igual que reset
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '1';
    down_in <= '1';
    tick_in <= '0';
    wait for 100 ns;
    reset_in <= '0';
    up_in <= '1';
    down_in <= '1';
    tick_in <= '1';
 end process;

end Behavioral;
