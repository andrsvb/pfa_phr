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

entity test_contador_puntuacion is
--  Port ( );
end test_contador_puntuacion;

architecture Behavioral of test_contador_puntuacion is

component contador_puntuacion is
  port(
    tick : in std_logic;
    s_reset : in std_logic;
    puntuacion : out integer range 0 to 10
  );
end component;

signal tick_in : std_logic;
signal s_reset_in : std_logic;
signal puntuacion_out : integer range 0 to 10;

begin

t_contador : contador_puntuacion port map(
    tick => tick_in,
    s_reset => s_reset_in,
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
    --puntuacion: 2 a 3
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 3 a 4
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 4 a 5
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 5 a 6
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 6 a 7
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 7 a 8
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 8 a 9
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 9 a 10
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 10 a 1
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    --puntuacion: 1 a 2
    tick_in <= '0';
    wait for 100 ns;
    tick_in <= '1';
    wait for 100 ns;
    
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
