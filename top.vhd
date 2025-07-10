----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.07.2025 14:50:45
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

begin
    fsm : entity work.fsm(Behavioral)
        port map (
            in0 => "1000000",
            in1 => "1111001",
            in2 => "0100100",
            in3 => "0110000",
            in4 => "0011001",
            in5 => "0010010",
            in6 => "0000010",
            in7 => "1111000",
            clk => clk,
            saida => sseg(6 downto 0),
            an => an(7 downto 0)
        );

end Behavioral;
