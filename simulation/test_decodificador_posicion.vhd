----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 21:11:23
-- Design Name: 
-- Module Name: test_decodificador_posicion - Behavioral
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

entity test_decodificador_posicion is
--  Port ( );
end test_decodificador_posicion;

architecture Behavioral of test_decodificador_posicion is

component decoder_posicion is
 Port ( 
  posicion_d : in integer range 0 to 2;
  leds : out std_logic_vector (7 downto 0)
  );
end component;

signal posicion_in : integer range 0 to 2;
signal leds_out : std_logic_vector (7 downto 0);

begin

t_decoder : decoder_posicion port map(
    posicion_d => posicion_in,
    leds => leds_out
 );
 
test: process
begin
--Cero
    posicion_in <= 0;
    wait for 100 ns;
  --Uno
    posicion_in <= 1;
    wait for 100 ns;
  --Dos
    posicion_in <= 2;
    wait for 100 ns;
end process;
end Behavioral;
