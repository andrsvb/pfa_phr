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

entity test_controlador_puntuacion is
--  Port ( );
end test_controlador_puntuacion;

architecture Behavioral of test_controlador_puntuacion is

component controlador_puntuacion is
 port ( 
  tick : in std_logic;
  s_reset : in std_logic;
  leds_p0 : out std_logic_vector (7 downto 0);
  leds_p1 : out std_logic_vector (7 downto 0);
  leds_p2 : out std_logic_vector (7 downto 0);
  puntuacion : out std_logic_vector (9 downto 0)
  );
end component;

signal tick_in : std_logic;
signal s_reset_in : std_logic;
signal leds_p0_out : std_logic_vector (7 downto 0);
signal leds_p1_out : std_logic_vector (7 downto 0);
signal leds_p2_out : std_logic_vector (7 downto 0);
signal puntuacion_out : std_logic_vector (9 downto 0);

begin

t_controlador : controlador_puntuacion port map(
  tick => tick_in,
  s_reset => s_reset_in,
  leds_p0 => leds_p0_out,
  leds_p1 => leds_p1_out,
  leds_p2 => leds_p2_out,
  puntuacion => puntuacion_out
);
 
 t_process : process
 begin
 
    --reset
    s_reset_in <= '1';
    tick_in <= '0';
    wait for 100 ns;
    s_reset_in <= '1';
    tick_in <= '1';
    wait for 100 ns;
    s_reset_in <= '0';
    
    --puntuacion: 0 a 100
    l_parity : for k in 0 to 200 loop
        tick_in <= NOT tick_in;
        wait for 100 ns;
    end loop l_parity;
    
    --reset
    s_reset_in <= '1';
    tick_in <= '0';
    wait for 100 ns;
    s_reset_in <= '1';
    tick_in <= '1';
    wait for 100 ns;
    s_reset_in <= '0';
    
    --puntuacion: 0 a 1
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 1 a 2
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    
 end process;

end Behavioral;
