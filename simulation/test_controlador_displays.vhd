----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_controlador_displays - Behavioral
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

entity test_controlador_displays is
--  Port ( );
end test_controlador_displays;

architecture Behavioral of test_controlador_displays is

COMPONENT controlador_displays
    port(
        clk : in std_logic;
        leds_personaje : out std_logic_vector (7 downto 0);
        leds_obs2 : out std_logic_vector (7 downto 0);
        leds_obs1 : out std_logic_vector (7 downto 0);
        leds_obs0 : out std_logic_vector (7 downto 0);
        leds_vidas : out std_logic_vector (7 downto 0);
        leds_p2 : out std_logic_vector (7 downto 0);
        leds_p1 : out std_logic_vector (7 downto 0);
        leds_p0 : out std_logic_vector (7 downto 0);
        displays_anodes : out std_logic_vector (7 downto 0);
        displays_cathodes : out std_logic_vector (7 downto 0)
	);
END COMPONENT;

signal clk_in : std_logic;
signal leds_personaje_in : std_logic_vector (7 downto 0);
signal leds_obs2_in : std_logic_vector (7 downto 0);
signal leds_obs1_in : std_logic_vector (7 downto 0);
signal leds_obs0_in : std_logic_vector (7 downto 0);
signal leds_vidas_in : std_logic_vector (7 downto 0);
signal leds_p2_in : std_logic_vector (7 downto 0);
signal leds_p1_in : std_logic_vector (7 downto 0);
signal leds_p0_in : std_logic_vector (7 downto 0);
signal displays_anodes_out : std_logic_vector (7 downto 0);
signal displays_cathodes_out : std_logic_vector (7 downto 0);

begin
 --Los leds se encienden con logica negada y de uno en uno
 --si quiero encender el led i, el bit i de displays_anodes estara a 0 y los demas bits a uno
	
c_d : controlador_displays
    port map(
        clk => clk_in,
        leds_personaje => leds_personaje_in,
        leds_obs2 => leds_obs2_in,
        leds_obs1 => leds_obs1_in,
        leds_obs0 => leds_obs0_in,
        leds_vidas => leds_vidas_in,
        leds_p2 => leds_p2_in,
        leds_p1 => leds_p1_in,
        leds_p0 => leds_p0_in,
        displays_anodes => displays_anodes_out,
        displays_cathodes => displays_cathodes_out
	);
 
 t_process : process    
 begin
	
  --inicializo todos los leds a valores distintos
    leds_personaje_in <= "10000000";
    leds_obs2_in <= "01000000";
    leds_obs1_in <= "00100000";
    leds_obs0_in <= "00010000";
    leds_vidas_in <= "00001000";
    leds_p2_in <= "00000100";
    leds_p1_in <= "00000010";
    leds_p0_in <= "00000001";
 
    --led encendido: 0
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 1
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 2
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 3
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 4
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 5
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 6
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 7
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 0
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 1
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 2
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
    --led encendido: 3
    clk_in <= '0';
    wait for 100 ns;
    clk_in <= '1';
    wait for 100 ns;
 
 end process;


end Behavioral;
