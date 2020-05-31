----------------------------------------------------------------------------------
-- Company: 
-- Engineer: El nanos
-- 
-- Create Date: 15.05.2020 21:18:22
-- Design Name: 
-- Module Name: controlador_obstaculos - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: los demas
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments: que bien me ha quedado en verdad
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

entity controlador_obstaculos is
 port ( 
      tick : in std_logic;
      s_reset : in std_logic;
      leds_obs0 : out std_logic_vector (7 downto 0);
      leds_obs1 : out std_logic_vector (7 downto 0);
      leds_obs2 : out std_logic_vector (7 downto 0);
      obstaculo3 : out integer range 0 to 5
  );
  end controlador_obstaculos;
  
  


architecture Behavioral of controlador_obstaculos is

 
COMPONENT generador_obstaculos 
  Port ( 
    tick : in std_logic;
    s_reset : in std_logic;
    obs: out  integer range 0 to 5
  );
END COMPONENT;
  
   
COMPONENT controlador_led 
  Port ( 
  obs_prev : in integer range 0 to 5;
  obs_sig : out integer range 0 to 5;
  led : out std_logic_vector (7 downto 0);
  tick_c : in std_logic
  );
END COMPONENT;
  

signal obs_0 : integer range 0 to 5;
signal obs_1 : integer range 0 to 5;
signal obs_2 : integer range 0 to 5;
  
begin


generador_0: generador_obstaculos port map(
   tick => tick,
   s_reset => s_reset,
   obs => obs_0
);
 
controlado_led_0: controlador_led port map(
    
    obs_prev=>obs_0,
    obs_sig=>obs_1,
    led=>leds_obs0,
    tick_c => tick
);
controlado_led_1: controlador_led port map(
    
    obs_prev=>obs_1,
    obs_sig=>obs_2,
    led=>leds_obs1,
    tick_c => tick
);
controlado_led_2: controlador_led port map(
    
    obs_prev=>obs_2,
    obs_sig=>obstaculo3,
    led=>leds_obs2,
    tick_c => tick
);


end Behavioral;
