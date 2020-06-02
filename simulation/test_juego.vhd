----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.06.2020 18:46:18
-- Design Name: 
-- Module Name: test_juego - Behavioral
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

entity test_juego is
--  Port ( );
end test_juego;

architecture Behavioral of test_juego is

component juego is
  port(
    clk : in std_logic;
    reset : in std_logic;
    boton_speed : in std_logic;
    boton_pausa : in std_logic;
    up : in std_logic;
    down : in std_logic;
    displays_anodes : out std_logic_vector (7 downto 0);
    displays_cathodes : out std_logic_vector (7 downto 0);
    puntuacion : out std_logic_vector (9 downto 0)
  );
end component;

signal clk : std_logic;
signal reset : std_logic;
signal boton_speed : std_logic;
signal boton_pausa : std_logic;
signal up : std_logic;
signal down : std_logic;
signal displays_anodes : std_logic_vector (7 downto 0);
signal displays_cathodes : std_logic_vector (7 downto 0);
signal puntuacion : std_logic_vector (9 downto 0);

begin

t_juego : juego port map(
    clk => clk,
    reset => reset,
    boton_speed => boton_speed,
    boton_pausa => boton_pausa,
    up => up,
    down => down,
    displays_anodes => displays_anodes,
    displays_cathodes => displays_cathodes,
    puntuacion => puntuacion
);

t_process : process
begin

    -- inicializo las entradas a 0
    clk <= '0';
    reset <= '0';
    boton_speed <= '0';
    boton_pausa <= '0';
    up <= '0';
    down <= '0';
    wait for 100 ns;
    -- primer ciclo de tick
    tick1 : for i in 0 to 5 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- pausa
    boton_pausa <= '1';
    wait for 100 ns;
    boton_pausa <= '0';
    wait for 100 ns;
    -- un ciclo de tick
    tick2 : for i in 0 to 7 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- salgo de pausa
    boton_pausa <= '1';
    wait for 100 ns;
    boton_pausa <= '0';
    wait for 100 ns;
    -- un ciclo de tick
    tick3 : for i in 0 to 7 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- reset
    reset <= '1';
    wait for 100 ns;
    -- un ciclo de tick
    tick4 : for i in 0 to 7 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- salgo de reset
    reset <= '0';
    wait for 100 ns;
    -- un ciclo de tick
    tick5 : for i in 0 to 7 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- cambio a la segunda velocidad
    boton_speed <= '1';
    wait for 100 ns;
    boton_speed <= '0';
    wait for 100 ns;
    -- un ciclo de tick
    tick6 : for i in 0 to 15 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- subo el personaje
    up <= '1';
    wait for 100 ns;
    -- un ciclo de tick
    tick7 : for i in 0 to 15 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- bajo el personaje
    up <= '0';
    wait for 100 ns;
    down <= '1';
    wait for 100 ns;
    -- un ciclo de tick
    tick8 : for i in 0 to 15 loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
    -- dejo el personaje quieto
    down <= '0';
    wait for 100 ns;
    -- sigue el reloj para probar el game over
    final : loop
        clk <= not clk;
        wait for 100 ns;
    end loop;
	
end process;

end Behavioral;
