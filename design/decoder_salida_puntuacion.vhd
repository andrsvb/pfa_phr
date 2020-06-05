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
-- Este bloque funcional recibe tres enteros de 0 a 10 que son cada uno una cifra de la puntuacion que va de 0 a 999
--  y saca sus valores en binario teniendo en cuenta su posicion. El 10 es un 0.

architecture Behavioral of decoder_salida_puntuacion is

begin

-- La primera cifra
with puntuacion0 select salida0 <=
    "0000000000" when 0,        -- 0
    "0000000001" when 1,        -- 1
    "0000000010" when 2,        -- 2
    "0000000011" when 3,        -- 3
    "0000000100" when 4,        -- 4
    "0000000101" when 5,        -- 5
    "0000000110" when 6,        -- 6
    "0000000111" when 7,        -- 7
    "0000001000" when 8,        -- 8
    "0000001001" when 9,        -- 9
    "0000000000" when 10;       -- 0

with puntuacion1 select salida1 <=
    "0000000000" when 0,        -- 00
    "0000001010" when 1,        -- 10
    "0000010100" when 2,        -- 20
    "0000011110" when 3,        -- 30
    "0000101000" when 4,        -- 40
    "0000110010" when 5,        -- 50
    "0000111100" when 6,        -- 60
    "0001000110" when 7,        -- 70
    "0001010000" when 8,        -- 80
    "0001011010" when 9,        -- 90
    "0000000000" when 10;       -- 00

with puntuacion2 select salida2 <=
    "0000000000" when 0,        -- 000
    "0001100100" when 1,        -- 100
    "0011001000" when 2,        -- 200
    "0100101100" when 3,        -- 300
    "0110010000" when 4,        -- 400
    "0111110100" when 5,        -- 500
    "1001011000" when 6,        -- 600
    "1010111100" when 7,        -- 700
    "1100100000" when 8,        -- 800
    "1110000100" when 9,        -- 900
    "0000000000" when 10;       -- 000

end Behavioral;
