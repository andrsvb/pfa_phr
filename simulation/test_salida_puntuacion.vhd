----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:11:19
-- Design Name: 
-- Module Name: test_salida_puntuacion - Behavioral
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

entity test_salida_puntuacion is
--  Port ( );
end test_salida_puntuacion;

architecture Behavioral of test_salida_puntuacion is

component salida_puntuacion is
    port(
        p0 : integer range 0 to 10;
        p1 : integer range 0 to 10;
        p2 : integer range 0 to 10;
        puntuacion : out std_logic_vector (9 downto 0)
	);
end component;

signal p0 : integer range 0 to 10;
signal p1 : integer range 0 to 10;
signal p2 : integer range 0 to 10;
signal puntuacion : std_logic_vector (9 downto 0);

begin

test_salida : salida_puntuacion port map(
      puntuacion => puntuacion,
      p0 => p0,
      p1 => p1,
      p2 => p2
	);
 
 t_process : process
 begin
    
    --puntuacion: 000
      p0 <= 0;
      p1 <= 0;
      p2 <= 0;
      wait for 100 ns;
    --puntuacion: 315
      p0 <= 3;
      p1 <= 1;
      p2 <= 5;
      wait for 100 ns;
    --puntuacion: 20(10)0
      p0 <= 2;
      p1 <= 10;
      p2 <= 0;
      wait for 100 ns;
    --puntuacion: 999
      p0 <= 9;
      p1 <= 9;
      p2 <= 9;
      wait for 100 ns;
 
 end process;

end Behavioral;
