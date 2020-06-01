----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 18:25:33
-- Design Name: 
-- Module Name: test_controlador_led - Behavioral
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

entity test_controlador_led is
--  Port ( );
end test_controlador_led;

architecture Behavioral of test_controlador_led is

component controlador_led is Port ( 
  obs_prev : in integer range 0 to 5;
  obs_sig : out integer range 0 to 5;
  led : out std_logic_vector (7 downto 0);
  tick_c : in std_logic

  );
end component;

signal obs_prev_in : integer range 0 to 5;
signal obs_sig_out : integer range 0 to 5;
signal led_out : std_logic_vector (7 downto 0);
signal tick_c_in: std_logic;

begin

t_controlador_led : controlador_led port map(
    obs_prev => obs_prev_in,
    obs_sig => obs_sig_out,
    led => led_out,
    tick_c=> tick_c_in
);
t_controlador: process
begin

  tick_c_in <= '0';
  obs_prev_in <= 0;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 0
  tick_c_in <= '0';
  obs_prev_in <= 1;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 1
  tick_c_in <= '0';
  obs_prev_in <= 2;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 2
  tick_c_in <= '0';
  obs_prev_in <= 3;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 3
  tick_c_in <= '0';
  obs_prev_in <= 4;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 4
  tick_c_in <= '0';
  obs_prev_in <= 5;
  wait for 100 ns;
  tick_c_in <= '1';
  wait for 100 ns;
-- Obs 5

end process;
end Behavioral;
