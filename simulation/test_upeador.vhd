----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_decoder_puntuacion - Behavioral
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

entity test_upeador is
--  Port ( );
end test_upeador;

architecture Behavioral of test_upeador is

component up_pos is
 Port ( 
  posicion_u : in integer range 0 to 2;
  u_posicion : out integer range 0 to 2
  );
end component;

signal posicion_in : integer range 0 to 2;
signal posicion_out : integer range 0 to 2;

begin

t_upeador : up_pos port map(
    posicion_u => posicion_in,
    u_posicion => posicion_out
 );
 
 t_process : process
 begin
  --Zero
    posicion_in<= 0;
    wait for 100 ns;
  --Uno
    posicion_in<= 1;
    wait for 100 ns;
  --Dos
    posicion_in<= 2;
 end process;

end Behavioral;
