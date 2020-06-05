----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.05.2020 19:06:36
-- Design Name: 
-- Module Name: sumador_10bits - Behavioral
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

entity sumador_10bits is
    Port ( 
        entrada0 : in std_logic_vector (9 downto 0);
        entrada1 : in std_logic_vector (9 downto 0);
        entrada2 : in std_logic_vector (9 downto 0);
        salida : out std_logic_vector (9 downto 0)
    );
end sumador_10bits;

-- Este bloque funcional suma tres numeros de 10 bits sin acarreo de entrada ni salida
--      Cada entrada es una cifra en binario de un numero de 3 cifras en decimal, por lo que el máximo es 999

architecture Behavioral of sumador_10bits is

signal acarreo0 : std_logic_vector (8 downto 0);
signal acarreo1 : std_logic_vector (8 downto 0);
signal salida0 : std_logic_vector (9 downto 0);

begin


-- 1. Sumo los dos primeros numeros, entrada0 y entrada1, y guardo el resultado en suma0
--      Para el primer bit no recibo acarreo por lo que uso un semisumador
--          entradas: entrada0(0) y entrada1(0)
--          salidas: suma0(0) = entrada0(0) XOR entrada1(0)
--                   acarreo0(0) = entrada0(0) AND entrada1(0)
--      Para los otros 9 bits uso un sumador total, para i = 1, 2, ... , 10
--          entradas: entrada0(i), entrada1(i) y acarreo0(i-1)
--          salidas: suma0(i) = entrada0(i) XOR entrada1(i) XOR acarreo0(i-1)
--                   acarreo0(i) = ( entrada0(i) AND entrada1(i) ) OR ( acarreo0(i-1) AND ( entrada0(i) XOR entrada1(i) )
--                      menos para el ultimo bit ( acarreo0(10) ), ya que no hay acarreo de salida global, no hace falta calcularlo
--                          además la suma nunca debe ser mayor de 999

acarreo0(0) <= entrada0(0) AND entrada1(0);

acarreo0(1) <= (entrada0(1) AND entrada1(1)) OR (acarreo0(0) AND (entrada0(1) XOR entrada1(1)));
acarreo0(2) <= (entrada0(2) AND entrada1(2)) OR (acarreo0(1) AND (entrada0(2) XOR entrada1(2)));
acarreo0(3) <= (entrada0(3) AND entrada1(3)) OR (acarreo0(2) AND (entrada0(3) XOR entrada1(3)));
acarreo0(4) <= (entrada0(4) AND entrada1(4)) OR (acarreo0(3) AND (entrada0(4) XOR entrada1(4)));
acarreo0(5) <= (entrada0(5) AND entrada1(5)) OR (acarreo0(4) AND (entrada0(5) XOR entrada1(5)));
acarreo0(6) <= (entrada0(6) AND entrada1(6)) OR (acarreo0(5) AND (entrada0(6) XOR entrada1(6)));
acarreo0(7) <= (entrada0(7) AND entrada1(7)) OR (acarreo0(6) AND (entrada0(7) XOR entrada1(7)));
acarreo0(8) <= (entrada0(8) AND entrada1(8)) OR (acarreo0(7) AND (entrada0(8) XOR entrada1(8)));

salida0(0) <= entrada0(0) XOR entrada1(0);

salida0(1) <= entrada0(1) XOR entrada1(1) XOR acarreo0(0);
salida0(2) <= entrada0(2) XOR entrada1(2) XOR acarreo0(1);
salida0(3) <= entrada0(3) XOR entrada1(3) XOR acarreo0(2);
salida0(4) <= entrada0(4) XOR entrada1(4) XOR acarreo0(3);
salida0(5) <= entrada0(5) XOR entrada1(5) XOR acarreo0(4);
salida0(6) <= entrada0(6) XOR entrada1(6) XOR acarreo0(5);
salida0(7) <= entrada0(7) XOR entrada1(7) XOR acarreo0(6);
salida0(8) <= entrada0(8) XOR entrada1(8) XOR acarreo0(7);
salida0(9) <= entrada0(9) XOR entrada1(9) XOR acarreo0(8);

-- 2. Sumo el ultimo numero y la suma de los anteriores de la misma forma que antes pero cambiando:
--      entrada0 -> salida0
--      entrada1 -> entrada2
--      acarreo0 -> acarreo1
--      salida0 -> salida

acarreo1(0) <= salida0(0) AND entrada2(0);

acarreo1(1) <= (salida0(1) AND entrada2(1)) OR (acarreo1(0) AND (salida0(1) XOR entrada2(1)));
acarreo1(2) <= (salida0(2) AND entrada2(2)) OR (acarreo1(1) AND (salida0(2) XOR entrada2(2)));
acarreo1(3) <= (salida0(3) AND entrada2(3)) OR (acarreo1(2) AND (salida0(3) XOR entrada2(3)));
acarreo1(4) <= (salida0(4) AND entrada2(4)) OR (acarreo1(3) AND (salida0(4) XOR entrada2(4)));
acarreo1(5) <= (salida0(5) AND entrada2(5)) OR (acarreo1(4) AND (salida0(5) XOR entrada2(5)));
acarreo1(6) <= (salida0(6) AND entrada2(6)) OR (acarreo1(5) AND (salida0(6) XOR entrada2(6)));
acarreo1(7) <= (salida0(7) AND entrada2(7)) OR (acarreo1(6) AND (salida0(7) XOR entrada2(7)));
acarreo1(8) <= (salida0(8) AND entrada2(8)) OR (acarreo1(7) AND (salida0(8) XOR entrada2(8)));

salida(0) <= salida0(0) XOR entrada2(0);

salida(1) <= salida0(1) XOR entrada2(1) XOR acarreo1(0);
salida(2) <= salida0(2) XOR entrada2(2) XOR acarreo1(1);
salida(3) <= salida0(3) XOR entrada2(3) XOR acarreo1(2);
salida(4) <= salida0(4) XOR entrada2(4) XOR acarreo1(3);
salida(5) <= salida0(5) XOR entrada2(5) XOR acarreo1(4);
salida(6) <= salida0(6) XOR entrada2(6) XOR acarreo1(5);
salida(7) <= salida0(7) XOR entrada2(7) XOR acarreo1(6);
salida(8) <= salida0(8) XOR entrada2(8) XOR acarreo1(7);
salida(9) <= salida0(9) XOR entrada2(9) XOR acarreo1(8);

end Behavioral;
