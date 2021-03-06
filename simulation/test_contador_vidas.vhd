----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_contador_vidas - Behavioral
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

entity test_contador_vidas is
--  Port ( );
end test_contador_vidas;

architecture Behavioral of test_contador_vidas is

component contador_vidas is
  port(
    colision : in std_logic;
    tick : in std_logic;
	reset: in std_logic;
    game_over : out std_logic;
    vidas : out integer range 0 to 3
  );
end component;

signal colision_in : std_logic;
signal tick_in : std_logic;
signal reset_in : std_logic;
signal game_over_out : std_logic;
signal vidas_out : integer range 0 to 3;

begin

t_contador : contador_vidas port map(
    colision => colision_in,
    tick => tick_in,
	reset => reset_in,
    game_over => game_over_out,
    vidas => vidas_out
 );
 
 t_process : process
 begin
   --Bajada de vidas (de 3 a 0)
	reset_in <= '0';
	colision_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
	reset_in <= '0';
    colision_in <= '1'; -- Primera colision (2 vidas)
    tick_in <= '1';
    wait for 100 ns;
	reset_in <= '0';
    colision_in <= '1'; -- Segunda colision (1 vida)
	tick_in <= '0';
	wait for 100 ns;
	reset_in <= '0';
	colision_in <= '1'; -- Tercera colision (0 vidas)
	tick_in <= '1';  
	wait for 100 ns;
	
    -- Se pulsa el botón reset 
    reset_in<= '0';
	colision_in <= '0';
    tick_in <= '0';
    wait for 100 ns;
	reset_in <= '0';
	colision_in <= '1'; -- Primera colision (2 vidas)
    tick_in <= '1';
    wait for 100 ns;
	reset_in <= '1'; --Botón reset = 1;
	colision_in <= '0'; 
    tick_in <= '0';
    wait for 100 ns;
 end process;

end Behavioral;
