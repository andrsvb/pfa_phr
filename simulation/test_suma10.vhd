----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2020 16:42:19
-- Design Name: 
-- Module Name: test_suma10 - Behavioral
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

entity test_suma10 is
--  Port ( );
end test_suma10;

architecture Behavioral of test_suma10 is

component sumador_10bits is
    Port ( 
        entrada0 : in std_logic_vector (9 downto 0);
        entrada1 : in std_logic_vector (9 downto 0);
        entrada2 : in std_logic_vector (9 downto 0);
        salida : out std_logic_vector (9 downto 0)
    );
end component;

signal in0 : std_logic_vector (9 downto 0);
signal in1 : std_logic_vector (9 downto 0);
signal in2 : std_logic_vector (9 downto 0);
signal salida : std_logic_vector (9 downto 0);

begin

test_sum10 : sumador_10bits
    port map(
        entrada0 => in0,
        entrada1 => in1,
        entrada2 => in2,
        salida => salida
    );
    
t_process : process
begin
    
    --puntuacion: 000
      in0 <= "0000000000";
      in1 <= "0000000000";
      in2 <= "0000000000";
      wait for 100 ns;
    --puntuacion: 315
      in0 <= "0000000011";
      in1 <= "0000001010";
      in2 <= "0111110100";
      wait for 100 ns;
    --puntuacion: 20(10)0
      in0 <= "0000000010";
      in1 <= "0000000000";
      in2 <= "0000000000";
      wait for 100 ns;
    --puntuacion: 999
      in0 <= "0000001001";
      in1 <= "0001011010";
      in2 <= "1110000100";
      wait for 100 ns;
 
 end process;

end Behavioral;
