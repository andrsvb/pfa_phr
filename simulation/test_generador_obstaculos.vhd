----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 17:53:31
-- Design Name: 
-- Module Name: test_generador_obstaculos - Behavioral
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

entity test_generador_obstaculos is
--  Port ( );
end test_generador_obstaculos;

architecture Behavioral of test_generador_obstaculos is

COMPONENT generador_obstaculos is Port(
    tick : in std_logic;
    s_reset : in std_logic;
    obs: out  integer range 0 to 5
);
END COMPONENT;

signal tick_in : std_logic;
signal s_reset_in :  std_logic;
signal obs_out : integer range 0 to 5;


begin

t_generador_obstaculos: generador_obstaculos  Port map(

tick => tick_in,
s_reset=> S_reset_in,
obs=>obs_out
);

t_process: process
begin

  --genera el primer obstaculo
    tick_in <= '0';
    s_reset_in<='0';
    wait for 100 ns;
    tick_in <= '1';
    s_reset_in<='0';
    wait for 100 ns;
  --genera el segundo obstaculo
    tick_in <= '0';
    s_reset_in<='0';
    wait for 100 ns;
    tick_in <= '1';
    s_reset_in<='0';
    wait for 100 ns;
  --genera el tercer obstaculo
    tick_in <= '0';
    s_reset_in<='0';
    wait for 100 ns;
    tick_in <= '1';
    s_reset_in<='0';
    wait for 100 ns;
  --genera el cuarto obstaculo
    tick_in <= '0';
    s_reset_in<='0';
    wait for 100 ns;
    tick_in <= '1';
    s_reset_in<='0';
    wait for 100 ns;
  --genera el quinto obstaculo
    tick_in <= '0';
    s_reset_in<='0';
    wait for 100 ns;
    tick_in <= '1';
    s_reset_in<='0';
    wait for 100 ns;
    
end process;
end Behavioral;
