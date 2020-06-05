----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 01:37:43
-- Design Name: 
-- Module Name: contador8 - Behavioral
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

entity contador8 is
    port(
      clk : in std_logic;
      selector : out integer range 0 to 7
	);
end contador8;
-- Cuenta, de 0 a 7 a 0 de nuevo, los flancos de subida del reloj ( clk )

architecture Behavioral of contador8 is

signal conta : integer  range 0 to 7 := 0;

begin

process (clk)
     begin
       if clk = '1' and clk'event then
         if conta = 7 then                      -- vuelve a 0
            conta <= 0;
         else
            conta <= conta + 1;                 -- cuenta normal
         end if;
       end if;
end process;

selector <= conta;

end Behavioral;
