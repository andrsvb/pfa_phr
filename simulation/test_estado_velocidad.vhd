----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2020 15:54:39
-- Design Name: 
-- Module Name: test_estado_velocidad - Behavioral
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

entity test_estado_velocidad is
--  Port ( );
end test_estado_velocidad;

architecture Behavioral of test_estado_velocidad is

COMPONENT estado_velocidad 
  port(
    boton_speed : in std_logic;
    speed : out std_logic
  );
END COMPONENT;

signal boton_speed_in : std_logic;
signal speed_out : std_logic;

begin
--al pulsar el boton se debe cambiar de estado, de velocidad 1(0) a velocidad 2(1) y viceversa

t_speed : estado_velocidad
  port map(
    boton_speed => boton_speed_in,
    speed => speed_out
  );
 
 t_process : process    
 begin
    
    --pulso boton: velocidad 1(0) a velocidad 2(1)
    boton_speed_in <= '0';
    wait for 100 ns;
    boton_speed_in <= '1';
    wait for 100 ns;
    --pulso boton: velocidad 2(1) a velocidad 1(0)
    boton_speed_in <= '0';
    wait for 100 ns;
    boton_speed_in <= '1';
    wait for 100 ns;
    --pulso boton: velocidad 1(0) a velocidad 2(1)
    boton_speed_in <= '0';
    wait for 100 ns;
    boton_speed_in <= '1';
    wait for 100 ns;
 
 end process;


end Behavioral;
