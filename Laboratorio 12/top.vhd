----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.08.2025 10:01:17
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
  Port ( 
    clk : in std_logic;
    sw : in std_logic_vector(1 downto 0);

    an : out std_logic_vector(3 downto 0);
    sseg : out std_logic_vector(7 downto 0);
    btn : in std_logic_vector(4 downto 0)
  );
end top;

architecture Behavioral of top is
signal entrou : std_logic;
signal saiu : std_logic;
signal enable : std_logic;
signal hex : std_logic_vector(3 downto 0);
signal btn_db_a : std_logic;
signal btn_db_b : std_logic;

begin
    enable <= entrou or saiu;
    
    fsm : entity work.fsm_eg(mult_seg_arch)
        port map(
            clk => clk,
            a => btn_db_a,
            b => btn_db_b,
            c_en => entrou,
            c_ex => saiu
        );
        
    contador : entity work.contador(com_fsm)
        port map(
            enable => enable,
            inc => entrou,
            dec => saiu,
            cont => hex,
            clk => clk
        );
        
     mux : entity work.disp_hex_mux(arch)
        port map(
            clk => clk,
            hex3 => "0000",
            hex2 => "0000",
            hex1 => "0000",
            hex0 => hex,
            dp_in => "1111",
            an => an(3 downto 0),
            sseg => sseg(7 downto 0),
            reset => btn(0)
        );
        
     debouncer_a : entity work.db_fsm(arch)
        port map(
            clk => clk,
            reset => btn(0),
            sw => btn(1),
            db => btn_db_a
        ); 
        
     debouncer_b : entity work.db_fsm(arch)
                port map(
                    clk => clk,
                    reset => btn(0),
                    sw => btn(2),
                    db => btn_db_b
                ); 
                
end Behavioral;
