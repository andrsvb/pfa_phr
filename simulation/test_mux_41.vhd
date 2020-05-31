----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 11:58:06
-- Design Name: 
-- Module Name: test_contador_puntuacion - Behavioral
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

entity test_mux_41 is
--  Port ( );
end test_mux_41;

architecture Behavioral of test_mux_41 is

component mux_41 is
  port(
     A,B,C,D : in integer range 0 to 2;
     S0,S1: in std_logic;
     Z: out integer range 0 to 2
  );
end component;

signal A_in : integer range 0 to 2;
signal B_in : integer range 0 to 2;
signal C_in : integer range 0 to 2;
signal D_in : integer range 0 to 2;
signal S0_in : std_logic;
signal S1_in : std_logic;
signal Z_out : integer range 0 to 2;

begin

t_mux : mux_41 port map(
    A => A_in,
    B => B_in,
    C => C_in,
    D => D_in,
    S0 => S0_in,
    S1 => S1_in
 );
 
 t_process : process
 begin
    --CERO
    A_in <= 1;
    B_in <= 0;
    C_in <= 0;
    D_in <= 0;
    S0_in <= '0';
    S1_in <= '0';
    wait for 100 ns;
    --Uno
    A_in <= 0;
    B_in <= 1;
    C_in <= 0;
    D_in <= 0;
    S0_in <= '1';
    S1_in <= '0';
    wait for 100 ns;
    --Dos
    A_in <= 0;
    B_in <= 0;
    C_in <= 1;
    D_in <= 0;
    S0_in <= '0';
    S1_in <= '1';
    wait for 100 ns;
    --Tres
    A_in <= 0;
    B_in <= 0;
    C_in <= 0;
    D_in <= 1;
    S0_in <= '1';
    S1_in <= '1';
    wait for 100 ns;
 end process;

end Behavioral;