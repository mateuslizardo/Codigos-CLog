----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.08.2025 10:30:09
-- Design Name: 
-- Module Name: contador - Behavioral
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity contador is
  Port (
    enable : in std_logic;
    inc,dec : in std_logic;
    cont : out std_logic_vector(3 downto 0);
    clk : std_logic
   );
   
end contador;



architecture com_fsm of contador is

signal q0_reg : unsigned(3 downto 0);
signal q0_next : unsigned(3 downto 0);

begin
process(clk)
   begin
      if (clk'event and clk='1') then
         q0_reg <= q0_next;
      end if;
   end process;
   -- next-state logic for the counter;
   q0_next <= 
              q0_reg + 1    when inc='1' else
              q0_reg - 1    when dec='1' else
              q0_reg;
   --output
   cont <= std_logic_vector(q0_reg);
end com_fsm;