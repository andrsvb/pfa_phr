----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.05.2020 13:42:38
-- Design Name: 
-- Module Name: test_general - Behavioral
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

entity test_general is
--  Port ( );
end test_general;

architecture Behavioral of test_general is

signal clk_cg : std_logic;
signal reset_cg : std_logic;
signal boton_speed_cg : std_logic;
signal boton_pausa_cg : std_logic;
signal displays_anodes_cg : std_logic_vector (7 downto 0);
signal displays_cathodes_cg : std_logic_vector (7 downto 0);
signal adc_cg : std_logic;
signal rx_cg : STD_LOGIC;
signal tx_cg : STD_LOGIC;

begin

circuito : entity work.circuito_general
    port map(
        clk_cg => clk_cg,
        reset_cg => reset_cg,
        boton_speed_cg => boton_speed_cg,
        boton_pausa_cg => boton_pausa_cg,
        displays_anodes_cg => displays_anodes_cg,
        displays_cathodes_cg => displays_cathodes_cg,
        adc_cg => adc_cg,
        rx_cg => rx_cg,
        tx_cg => tx_cg
    );
    
test_contador_8 : entity work.test_contador_8;
test_contador_puntuacion : entity work.test_contador_puntuacion;
test_contador_v1 : entity work.test_contador_v1;
test_contador_v2 : entity work.test_contador_v2;
test_contador_vidas : entity work.test_contador_vidas;
test_controlador_colision : entity work.test_controlador_colision;
test_controlador_displays : entity work.test_controlador_displays;
test_controlador_led : entity work.test_controlador_led;
test_controlador_obstaculos : entity work.test_controlador_obstaculos;
test_controlador_pausa : entity work.test_controlador_pausa;
test_controlador_posicion : entity work.test_controlador_posicion;
test_controlador_puntuacion : entity work.test_controlador_puntuacion;
test_controlador_velocidad : entity work.test_controlador_velocidad;
test_controlador_vidas : entity work.test_controlador_vidas;
test_decoder_anodes : entity work.test_decoder_anodes;
test_decoder_obstaculos : entity work.test_decoder_obstaculos;
test_decoder_puntuacion : entity work.test_decoder_puntuacion;
test_decoder_vidas : entity work.test_decoder_vidas;
test_decodificador_posicion : entity work.test_decodificador_posicion;
test_downeador : entity work.test_downeador;
test_estado_pausa : entity work.test_estado_pausa;
test_estado_velocidad : entity work.test_estado_velocidad;
test_generador_obstaculos : entity work.test_generador_obstaculos;
test_mux21 : entity work.test_mux21;
test_mux_41 : entity work.test_mux_41;
test_mux_8_1 : entity work.test_mux_8_1;
test_registro_o : entity work.test_registro_o;
test_registro_p : entity work.test_registro_p;
test_salida_puntuacion : entity work.test_salida_puntuacion;
test_upeador : entity work.test_upeador;

end Behavioral;
