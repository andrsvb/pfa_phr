----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_estado_pausa - Behavioral
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

entity test_estado_pausa is
--  Port ( );
end test_estado_pausa;

architecture Behavioral of test_estado_pausa is

component estado_pausa is
  port(
    boton_pausa : in std_logic;
    pausa : out std_logic
  );
end component;

signal boton_pausa_in : std_logic;
signal pausa_out : std_logic;

begin
--al pulsar el boton se debe cambiar de estado, de pausa(0) a no pausa(1) y viceversa

t_pausa : estado_pausa
  port map(
    boton_pausa => boton_pausa_in,
    pausa => pausa_out
  );
 
 t_process : process    
 begin
    
    --pulso boton: no pausa a pausa
    boton_pausa_in <= '0';
    wait for 100 ns;
    boton_pausa_in <= '1';
    wait for 100 ns;
    --pulso boton: pausa a no pausa
    boton_pausa_in <= '0';
    wait for 100 ns;
    boton_pausa_in <= '1';
    wait for 100 ns;
    --pulso boton: no pausa a pausa
    boton_pausa_in <= '0';
    wait for 100 ns;
    boton_pausa_in <= '1';
    wait for 100 ns;
 
 end process;


end Behavioral;
