----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_contador_8 - Behavioral
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

entity test_contador_8 is
--  Port ( );
end test_contador_8;

architecture Behavioral of test_contador_8 is

component contador8 is
  port(
      clk : in std_logic;
      selector : out integer range 0 to 7
  );
end component;

signal clk_in : std_logic;
signal selector_in : integer range 0 to 7;

begin

t_contador : contador8 port map(
    clk => clk_in,
    selector => selector_in
 );
 
 t_process : process    
 begin
 --Los leds se encienden con logica negada y de uno en uno
 --si esta encendido el led i el selector tiene que ser igual a i
 
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
