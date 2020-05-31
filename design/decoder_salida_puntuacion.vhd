----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2020 19:06:36
-- Design Name: 
-- Module Name: decoder_salida_puntuacion - Behavioral
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

entity decoder_salida_puntuacion is
    Port ( 
        puntuacion0 : in integer range 0 to 10;
        puntuacion1 : in integer range 0 to 10;
        puntuacion2 : in integer range 0 to 10;
        salida0 : out std_logic_vector (9 downto 0);
        salida1 : out std_logic_vector (9 downto 0);
        salida2 : out std_logic_vector (9 downto 0)
    );
end decoder_salida_puntuacion;

architecture Behavioral of decoder_salida_puntuacion is

begin

with puntuacion0 select salida0 <=
    "0000000000" when 0,
    "0000000001" when 1,
    "0000000010" when 2,
    "0000000011" when 3,
    "0000000100" when 4,
    "0000000101" when 5,
    "0000000110" when 6,
    "0000000111" when 7,
    "0000001000" when 8,
    "0000001001" when 9,
    "0000000000" when 10;

with puntuacion1 select salida1 <=
    "0000000000" when 0,
    "0000001010" when 1,
    "0000010100" when 2,
    "0000011110" when 3,
    "0000101000" when 4,
    "0000110010" when 5,
    "0000111100" when 6,
    "0001000110" when 7,
    "0001010000" when 8,
    "0001011010" when 9,
    "0000000000" when 10;

with puntuacion2 select salida2 <=
    "0000000000" when 0,
    "0001100100" when 1,
    "0011001000" when 2,
    "0100101100" when 3,
    "0110010000" when 4,
    "0111110100" when 5,
    "1001011000" when 6,
    "1010111100" when 7,
    "1100100000" when 8,
    "1110000100" when 9,
    "0000000000" when 10;

end Behavioral;
