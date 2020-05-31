----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_decoder_puntuacion - Behavioral
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

entity test_decoder_puntuacion is
--  Port ( );
end test_decoder_puntuacion;

architecture Behavioral of test_decoder_puntuacion is

component decoder_puntuacion is
 Port ( 
  puntuacion : in integer;
  leds : out std_logic_vector (7 downto 0)
  );
end component;

signal puntuacion_in : integer;
signal leds_out : std_logic_vector (7 downto 0);

begin

t_decoder : decoder_puntuacion port map(
    puntuacion => puntuacion_in,
    leds => leds_out
 );
 
 t_process : process
 begin
    --puntuacion: 0
    puntuacion_in <= 0;
    wait for 100 ns;
    --puntuacion: 1
    puntuacion_in <= 1;
    wait for 100 ns;
    --puntuacion: 2
    puntuacion_in <= 2;
    wait for 100 ns;
    --puntuacion: 3
    puntuacion_in <= 3;
    wait for 100 ns;
    --puntuacion: 4
    puntuacion_in <= 4;
    wait for 100 ns;
    --puntuacion: 5
    puntuacion_in <= 5;
    wait for 100 ns;
    --puntuacion: 6
    puntuacion_in <= 6;
    wait for 100 ns;
    --puntuacion: 7
    puntuacion_in <= 7;
    wait for 100 ns;
    --puntuacion: 8
    puntuacion_in <= 8;
    wait for 100 ns;
    --puntuacion: 9
    puntuacion_in <= 9;
    wait for 100 ns;
    --puntuacion: 10 (0)
    puntuacion_in <= 10;
    
 end process;

end Behavioral;
