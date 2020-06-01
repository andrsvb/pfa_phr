----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 14.05.2020 19:46:33
-- Design Name: 
-- Module Name: mux_41 - Behavioral
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

entity mux_41 is
port(
      a, b, c, d : in integer range 0 to 2;
     s0, s1 : in std_logic;
     z : out integer range 0 to 2
);
end mux_41;

architecture Behavioral of mux_41 is

signal auxSelVect : std_logic_vector (1 downto 0);

begin

auxSelVect(1) <= s1;
auxSelVect(0) <= s0;

z <= a when auxSelVect = "00" else
     b when auxSelVect = "01" else
     c when auxSelVect = "10" else
     d when auxSelVect = "11";

end Behavioral;
