----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:55:14
-- Design Name: 
-- Module Name: estado_pausa - Behavioral
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

entity estado_pausa is
  port(
    boton_pausa : in std_logic;
    pausa : out std_logic
  );
end estado_pausa;
-- Máquina de estados con dos estados: pausa (0) y no pausa (1) entre los que cambia cuando se pulsa el boton

architecture Behavioral of estado_pausa is

signal s_pausa : std_logic := '1';      -- variable interna para guerdar el estado

begin

process (boton_pausa)                   -- cambio de estado: negando s_pausa
     begin
        if boton_pausa = '1' and boton_pausa'event then
            s_pausa <= NOT s_pausa;
       end if;
end process;

pausa <= s_pausa;                       -- salida

end Behavioral;
