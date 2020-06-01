----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2020 16:42:19
-- Design Name: 
-- Module Name: test_decoder_sp - Behavioral
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

entity test_decoder_sp is
--  Port ( );
end test_decoder_sp;

architecture Behavioral of test_decoder_sp is

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

signal p0 : integer range 0 to 10;
signal p1 : integer range 0 to 10;
signal p2 : integer range 0 to 10;
signal salida0_out : std_logic_vector (9 downto 0);
signal salida1_out : std_logic_vector (9 downto 0);
signal salida2_out : std_logic_vector (9 downto 0);

begin

test_dsp : decoder_salida_puntuacion
    port map(
        puntuacion0 => p0,
        puntuacion1 => p1,
        puntuacion2 => p2,
        salida0 => salida0_out,
        salida1 => salida1_out,
        salida2 => salida2_out
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
