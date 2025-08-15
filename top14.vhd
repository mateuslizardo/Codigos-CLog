----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.08.2025 09:15:31
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
    sw : in std_logic_vector(6 downto 0);
    led : out std_logic_vector(3 downto 0)

  );
end top;

architecture Behavioral of top is
    signal prio : std_logic_vector(1 downto 0);
    signal enable : std_logic;
    signal incrementador : std_logic_vector(3 downto 0);
    signal q : std_logic_vector(3 downto 0);
    signal s : std_logic_vector(3 downto 0);
begin
    codificador : entity work.cod_prio(cond_arch)
        port map(
            r => sw(2 downto 0),
            pcode => prio(1 downto 0)
        );
        
    divisor : entity work.div_clk(Behavioral)
        port map(
            clk => clk,
            en => enable
        );
        
    mux4 : entity work.mux_4x1(cond_arch)
        port map(
            i(3) => sw(6),
            i(2) => incrementador(3),
            i(1) => '0',
            i(0) => q(3),
            c => prio(1 downto 0),
            s => s(3)
        );

        mux3 : entity work.mux_4x1(cond_arch)
        port map(
            i(3) => sw(5),
            i(2) => incrementador(2),
            i(1) => q(3),
            i(0) => q(2),
            c => prio(1 downto 0),
            s => s(2)
        );

        mux2 : entity work.mux_4x1(cond_arch)
        port map(
            i(3) => sw(4),
            i(2) => incrementador(1),
            i(1) => q(2),
            i(0) => q(1),
            c => prio(1 downto 0),
            s => s(1)
        );

        mux1 : entity work.mux_4x1(cond_arch)
        port map(
            i(3) => sw(3),
            i(2) => incrementador(0),
            i(1) => q(1),
            i(0) => q(0),
            c => prio(1 downto 0),
            s => s(0)
        );
        
        ff4 : entity work.FF_D(Behavioral)
            port map(
                D => s(3),
                e => enable,
                clk => clk,
                Q => q(3)
            );
        ff3 : entity work.FF_D(Behavioral)
            port map(
                D => s(2),
                e => enable,
                clk => clk,
                Q => q(2)
            );
        ff2 : entity work.FF_D(Behavioral)
            port map(
                D => s(1),
                e => enable,
                clk => clk,
                Q => q(1)
            );

        ff1 : entity work.FF_D(Behavioral)
            port map(
                D => s(0),
                e => enable,
                clk => clk,
                Q => q(0)
            );
            
        incrementadorr : entity work.inc_4bits(Behavioral)
            port map(
                inc_in => q(3 downto 0),
                inc_out => incrementador(3 downto 0)
            );
            
        led <= q(3 downto 0);
       

end Behavioral;
