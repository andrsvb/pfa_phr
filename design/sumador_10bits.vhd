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

suma : process
begin
    carry0 : for i in 0 to 8 loop
        acarreo0(i) <= entrada0(i) AND entrada1(i);
    end loop;
    
    salida0(0) <= entrada0(0) XOR entrada1(0);
    
    suma0 : for i in 1 to 9 loop
        salida0(i) <= entrada0(i) XOR entrada1(i) XOR acarreo0(i-1);
    end loop;
    
    carry1 : for i in 0 to 8 loop
        acarreo1(i) <= salida0(i) AND entrada2(i);
    end loop;
    
    salida(0) <= salida0(0) XOR entrada2(0);
    
    suma1 : for i in 1 to 9 loop
        salida(i) <= salida0(i) XOR entrada2(i) XOR acarreo1(i-1);
    end loop;
end process;

end Behavioral;
