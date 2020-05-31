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

architecture Behavioral of sumador_10bits is

signal acarreo0 : std_logic_vector (8 downto 0);
signal acarreo1 : std_logic_vector (8 downto 0);
signal salida0 : std_logic_vector (9 downto 0);

begin

acarreo0(0) <= entrada0(0) AND entrada1(0);
acarreo0(1) <= entrada0(1) AND entrada1(1);
acarreo0(2) <= entrada0(2) AND entrada1(2);
acarreo0(3) <= entrada0(3) AND entrada1(3);
acarreo0(4) <= entrada0(4) AND entrada1(4);
acarreo0(5) <= entrada0(5) AND entrada1(5);
acarreo0(6) <= entrada0(6) AND entrada1(6);
acarreo0(7) <= entrada0(7) AND entrada1(7);
acarreo0(8) <= entrada0(8) AND entrada1(8);

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

acarreo1(0) <= salida0(0) AND entrada2(0);
acarreo1(1) <= salida0(1) AND entrada2(1);
acarreo1(2) <= salida0(2) AND entrada2(2);
acarreo1(3) <= salida0(3) AND entrada2(3);
acarreo1(4) <= salida0(4) AND entrada2(4);
acarreo1(5) <= salida0(5) AND entrada2(5);
acarreo1(6) <= salida0(6) AND entrada2(6);
acarreo1(7) <= salida0(7) AND entrada2(7);
acarreo1(8) <= salida0(8) AND entrada2(8);

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


--suma : process
--begin
--    carry0 : for i in 0 to 8 loop
--        acarreo0(i) <= entrada0(i) AND entrada1(i);
--    end loop;
    
--    salida0(0) <= entrada0(0) XOR entrada1(0);
    
--    suma0 : for i in 1 to 9 loop
--        salida0(i) <= entrada0(i) XOR entrada1(i) XOR acarreo0(i-1);
--    end loop;
    
--    carry1 : for i in 0 to 8 loop
--        acarreo1(i) <= salida0(i) AND entrada2(i);
--    end loop;
    
--    salida(0) <= salida0(0) XOR entrada2(0);
    
--    suma1 : for i in 1 to 9 loop
--        salida(i) <= salida0(i) XOR entrada2(i) XOR acarreo1(i-1);
--    end loop;
--end process;

end Behavioral;
