----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:55:14
-- Design Name: 
-- Module Name: estado_velocidad - Behavioral
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

entity estado_velocidad is
  port(
    boton_speed : in std_logic;
    speed : out std_logic
  );
end estado_velocidad;

architecture Behavioral of estado_velocidad is

signal s_speed : std_logic := '0';

begin

process (boton_speed)
     begin
        if boton_speed = '1' and boton_speed'event then
            s_speed <= NOT s_speed;
       end if;
end process;


end Behavioral;
