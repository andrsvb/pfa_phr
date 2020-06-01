----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_controlador_pausa - Behavioral
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

entity test_controlador_pausa is
--  Port ( );
end test_controlador_pausa;

architecture Behavioral of test_controlador_pausa is

COMPONENT controlador_pausa 
  port(
    boton_pausa : in std_logic;
    clk_in : in std_logic;
    clk_out : out std_logic
  );
END COMPONENT;

signal boton_pausa_in : std_logic;
signal clock_in : std_logic;
signal clock_out : std_logic;

begin

c_pau : controlador_pausa 
  port map(
    boton_pausa => boton_pausa_in,
    clk_in => clock_in,
    clk_out => clock_out
  );
 
 t_process : process    
 begin
    
    --el reloj deberia actualizarse segun el clock
    --ciclo de reloj
    boton_pausa_in <= '0';
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
    --ciclo de reloj
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
    
    --pulso boton: no pausa a pausa
    boton_pausa_in <= '1';
    wait for 100 ns;
    boton_pausa_in <= '0';
    
    --el reloj no deberia pasar a 1 en estado pausa
    --ciclo de reloj
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
    --ciclo de reloj
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
        
    --pulso boton: pausa a no pausa
    boton_pausa_in <= '1';
    wait for 100 ns;
    boton_pausa_in <= '0';
    
    --el reloj deberia actualizarse segun el clock
    --ciclo de reloj
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
    --ciclo de reloj
    clock_in <= '0';
    wait for 100 ns;
    clock_in <= '1';
    wait for 100 ns;
 
 end process;


end Behavioral;
