----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.07.2025 09:27:17
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
        sseg : out std_logic_vector(6 downto 0);
        an : out std_logic_vector(7 downto 0);
        clk : in std_logic
   );
end top;

architecture Behavioral of top is
--    signal d0 : std_logic_vector(6 downto 0);
--    d0 <= "0000001";
--    signal d1 : std_logic_vector(6 downto 0);
--    d1 <= "1001111";
--    signal d2 : std_logic_vector(6 downto 0);
--    d2 <= "0010010";
--    signal d3 : std_logic_vector(6 downto 0);
--    d3 <= "0000110";
--    signal d4 : std_logic_vector(6 downto 0);
--    d4 <= "1001100";
--    signal d5 : std_logic_vector(6 downto 0);
--    d5 <= "0100100";
--    signal d6 : std_logic_vector(6 downto 0);
--    d6 <= "0100000";
--    signal d7 : std_logic_vector(6 downto 0);
--     d7 <= "0001111";
     
     
begin
    fsm : entity work.fsm_eg(mult_seg_arch)
        port map (
            sseg0 => "1000000",
            sseg1 => "1001111",
            sseg2 => "0010010",
            sseg3 => "0000110",
            sseg4 => "1001100",
            sseg5 => "0100100",
            sseg6 => "0100000",
            sseg7 => "0001111",
            clk => clk,
            saida => sseg(6 downto 0),
            an => an(7 downto 0)
        );    
     
     
end Behavioral;
