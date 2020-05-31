----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:26:19
-- Design Name: 
-- Module Name: test_decoder_obstaculos - Behavioral
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

entity test_decoder_obstaculos is
--  Port ( );
end test_decoder_obstaculos;

architecture Behavioral of test_decoder_obstaculos is

component decoder_obstaculos is
 Port ( 
  obs : in integer;
  leds : out std_logic_vector (7 downto 0)
  );
end component;

signal obs_in : integer range 0 to 5;
signal leds_out : std_logic_vector (7 downto 0);


begin

t_decoder: decoder_obstaculos port map(
 obs => obs_in,
 leds => leds_out
);

t_process : process
begin

  --decodifica el obstaculo vacio
    obs_in <= 0;
    wait for 100 ns;
  --decodifica el obstaculo tipo 1
    obs_in <= 1;
    wait for 100 ns;
  --decodifica el obstaculo tipo 2
    obs_in <= 2;
    wait for 100 ns;
  --decodifica el obstaculo tipo 3
    obs_in <= 3;
    wait for 100 ns;
  --decodifica el obstaculo tipo 4
    obs_in <= 4;
    wait for 100 ns;
  --decodifica el obstaculo tipo 5
    obs_in <= 5;
    wait for 100 ns;
    
end process;

end Behavioral;
