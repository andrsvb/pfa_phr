----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 01:37:43
-- Design Name: 
-- Module Name: mux_8_1 - Behavioral
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

entity mux_8_1 is
    port(
        leds_personaje : in std_logic_vector (7 downto 0);
        leds_obs2 : in std_logic_vector (7 downto 0);
        leds_obs1 : in std_logic_vector (7 downto 0);
        leds_obs0 : in std_logic_vector (7 downto 0);
        leds_vidas : in std_logic_vector (7 downto 0);
        leds_p2 : in std_logic_vector (7 downto 0);
        leds_p1 : in std_logic_vector (7 downto 0);
        leds_p0 : in std_logic_vector (7 downto 0);
        selector : in integer range 0 to 7;
        displays_cathodes : out std_logic_vector (7 downto 0)
	);
end mux_8_1;
-- Multiplexor de 8 entradas y una salida, saca por display_cathodes el array de leds correspondinte segun selector

architecture Behavioral of mux_8_1 is

begin

with selector select displays_cathodes <=
    leds_personaje when 0,
    leds_obs2 when 1,
    leds_obs1 when 2,
    leds_obs0 when 3,
    leds_vidas when 4,
    leds_p2 when 5,
    leds_p1 when 6,
    leds_p0 when 7;

end Behavioral;
