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
        p0 : in integer range 0 to 10;                          -- primera cifra x
        p1 : in integer range 0 to 10;                          -- segunda cifra y
        p2 : in integer range 0 to 10;                          -- tercera cifra z
        puntuacion : out std_logic_vector (9 downto 0)          -- puntuacion en binario
	);
end salida_puntuacion;
-- Este bloque funcional recibe la puntuacion en el formato de 3 enteros ( zyx ) y la saca en 10 bits

architecture Behavioral of salida_puntuacion is

-- Pasa cada cifra a binario individualmente
component decoder_salida_puntuacion is
    Port ( 
        puntuacion0 : in integer range 0 to 10;                 -- x
        puntuacion1 : in integer range 0 to 10;                 -- y
        puntuacion2 : in integer range 0 to 10;                 -- z
        salida0 : out std_logic_vector (9 downto 0);            -- x en binario
        salida1 : out std_logic_vector (9 downto 0);            -- y en binario
        salida2 : out std_logic_vector (9 downto 0)             -- z en binario
    );
end component;

-- Suma las tres cifras ahora en binario
component sumador_10bits is
    Port ( 
        entrada0 : in std_logic_vector (9 downto 0);            -- x en binario
        entrada1 : in std_logic_vector (9 downto 0);            -- y en binario
        entrada2 : in std_logic_vector (9 downto 0);            -- z en binario
        salida : out std_logic_vector (9 downto 0)              -- puntuacion en binario
    );
end component;

-- Para conectar las salidas del decoder con las entradas del sumador
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
