----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_mux_8_1 - Behavioral
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

entity test_mux_8_1 is
--  Port ( );
end test_mux_8_1;

architecture Behavioral of test_mux_8_1 is

component mux_8_1 is
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
end component;

signal selector_in : integer range 0 to 7;
signal leds_personaje_in : std_logic_vector (7 downto 0);
signal leds_obs2_in : std_logic_vector (7 downto 0);
signal leds_obs1_in : std_logic_vector (7 downto 0);
signal leds_obs0_in : std_logic_vector (7 downto 0);
signal leds_vidas_in : std_logic_vector (7 downto 0);
signal leds_p2_in : std_logic_vector (7 downto 0);
signal leds_p1_in : std_logic_vector (7 downto 0);
signal leds_p0_in : std_logic_vector (7 downto 0);
signal displays_cathodes_out : std_logic_vector (7 downto 0);

begin

t_mux8 : mux_8_1 port map(
    selector => selector_in,
    leds_personaje => leds_personaje_in,
    leds_obs2 => leds_obs2_in,
    leds_obs1 => leds_obs1_in,
    leds_obs0 => leds_obs0_in,
    leds_vidas => leds_vidas_in,
    leds_p2 => leds_p2_in,
    leds_p1 => leds_p1_in,
    leds_p0 => leds_p0_in,
    displays_cathodes => displays_cathodes_out
 );
 
 t_process : process    
 begin
 --es un multiplexor 8 a 1
 
  --inicializo todos las entradas a valores distintos
    leds_personaje_in <= "10000000";
    leds_obs2_in <= "01000000";
    leds_obs1_in <= "00100000";
    leds_obs0_in <= "00010000";
    leds_vidas_in <= "00001000";
    leds_p2_in <= "00000100";
    leds_p1_in <= "00000010";
    leds_p0_in <= "00000001";
    
    --opcion 0
    selector_in <= 0;
    wait for 100 ns;
    --opcion 1
    selector_in <= 1;
    wait for 100 ns;
    --opcion 2
    selector_in <= 2;
    wait for 100 ns;
    --opcion 3
    selector_in <= 3;
    wait for 100 ns;
    --opcion 4
    selector_in <= 4;
    wait for 100 ns;
    --opcion 5
    selector_in <= 5;
    wait for 100 ns;
    --opcion 6
    selector_in <= 6;
    wait for 100 ns;
    --opcion 7
    selector_in <= 7;
    wait for 100 ns;
 
 end process;

end Behavioral;
