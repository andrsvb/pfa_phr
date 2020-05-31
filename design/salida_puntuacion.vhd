----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.05.2020 20:32:04
-- Design Name: 
-- Module Name: salida_puntuacin - Behavioral
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

entity salida_puntuacion is
    port(
        p0 : in integer range 0 to 10;
        p1 : in integer range 0 to 10;
        p2 : in integer range 0 to 10;
        puntuacion : out std_logic_vector (9 downto 0)
	);
end salida_puntuacion;

architecture Behavioral of salida_puntuacion is

component decoder_salida_puntuacion is
    Port ( 
        puntuacion0 : in integer range 0 to 10;
        puntuacion1 : in integer range 0 to 10;
        puntuacion2 : in integer range 0 to 10;
        salida0 : out std_logic_vector (9 downto 0);
        salida1 : out std_logic_vector (9 downto 0);
        salida2 : out std_logic_vector (9 downto 0)
    );
end component;

component sumador_10bits is
    Port ( 
        entrada0 : in std_logic_vector (9 downto 0);
        entrada1 : in std_logic_vector (9 downto 0);
        entrada2 : in std_logic_vector (9 downto 0);
        salida : out std_logic_vector (9 downto 0)
    );
end component;

signal cable0 : std_logic_vector (9 downto 0);
signal cable1 : std_logic_vector (9 downto 0);
signal cable2 : std_logic_vector (9 downto 0);

begin

deco_sp : decoder_salida_puntuacion port map(
    puntuacion0 => p0,
    puntuacion1 => p1,
    puntuacion2 => p2,
    salida0 => cable0,
    salida1 => cable1,
    salida2 => cable2
);

suma10 : sumador_10bits port map(
    entrada0 => cable0,
    entrada1 => cable1,
    entrada2 => cable2,
    salida => puntuacion
);

end Behavioral;
