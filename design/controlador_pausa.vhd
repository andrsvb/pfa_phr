----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2020 16:55:14
-- Design Name: 
-- Module Name: controlador_pausa - Behavioral
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

entity controlador_pausa is
  port(
    boton_pausa : in std_logic;
    clk_in : in std_logic;
    clk_out : out std_logic
  );
end controlador_pausa;

architecture Behavioral of controlador_pausa is

component estado_pausa is
  port(
    boton_pausa : in std_logic;
    pausa : out std_logic
  );
end component;

signal s_pausa : std_logic;

begin

e_pausa : estado_pausa
  port map(
    boton_pausa => boton_pausa,
    pausa => s_pausa
  );
  
clk_out <= clk_in AND s_pausa;

end Behavioral;
