----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 19:00:46
-- Design Name: 
-- Module Name: test_controlador_obstaculos - Behavioral
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

entity test_controlador_obstaculos is
--  Port ( );
end test_controlador_obstaculos;

architecture Behavioral of test_controlador_obstaculos is

component controlador_obstaculos is  port ( 
      tick : in std_logic;
      s_reset : in std_logic;
      leds_obs0 : out std_logic_vector (7 downto 0);
      leds_obs1 : out std_logic_vector (7 downto 0);
      leds_obs2 : out std_logic_vector (7 downto 0);
      obstaculo3 : out integer range 0 to 5
  );
end component;

signal tick_obs_in: std_logic;
signal reset_in : std_logic;
signal led_0_out : std_logic_vector (7 downto 0);
signal led_1_out : std_logic_vector (7 downto 0);
signal led_2_out : std_logic_vector (7 downto 0);
signal obs_sigui_out : integer range 0 to 5;


begin


c_o : controlador_obstaculos 
    port map(
      tick => tick_obs_in,
      s_reset  => reset_in,
      leds_obs0  => led_0_out,
      leds_obs1  => led_1_out,
      leds_obs2  => led_2_out,
      obstaculo3  => obs_sigui_out
	);

t_controlador : process
begin

  --genera el primer obstaculo
  tick_obs_in <= '0';
  reset_in <= '0';
  wait for 100 ns;
  tick_obs_in <= '1';
  reset_in <= '0';
  wait for 100 ns;
  --genera el segundo obstaculo
  tick_obs_in <= '0';
  reset_in <= '0';
  wait for 100 ns;
  tick_obs_in <= '1';
  reset_in <= '0';
  wait for 100 ns;
  --genera el tercer obstaculo
  tick_obs_in <= '0';
  reset_in <= '1';
  wait for 100 ns;
  tick_obs_in <= '1';
  reset_in <= '0';
  wait for 100 ns;
  --genera el cuarto obstaculo
  tick_obs_in <= '0';
  reset_in <= '0';
  wait for 100 ns;
  tick_obs_in <= '1';
  reset_in <= '0';
  wait for 100 ns;
  
end process;
end Behavioral;
