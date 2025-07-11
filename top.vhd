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
constant N : integer := 9999999;
 signal divide_clk : integer range 0 to N;
   type eg_state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
   signal state_reg, state_next : eg_state_type;
   signal tin0, tin1, tin2, tin3, tin4, tin5, tin6, tin7 : std_logic_vector(6 downto 0);
begin
process(clk, state_reg, state_next)
        BEGIN
        IF(clk'EVENT and clk='1') THEN
            divide_clk <= divide_clk + 1;
            IF divide_clk = N then
                state_reg <= state_next;
                divide_clk <= 0;
            END IF;
        END IF;
    END PROCESS;
 process(state_reg, tin0, tin1, tin2, tin3, tin4, tin5, tin6, tin7)
 begin
       case state_reg is
           when s0 =>
              tin7 <= "1000000";
                                 tin6 <= "1111001";
                                 tin5 <= "0100100";
                                 tin4 <= "0110000";
                                 tin3 <= "0011001";
                                 tin2 <= "0010010";
                                 tin1 <= "0000010";
                                 tin0 <= "1111000";
                                 state_next <= s1;
            when s1 =>
                       tin6 <= "1000000";
                       tin5 <= "1111001";
                       tin4 <= "0100100";
                       tin3 <= "0110000";
                       tin2 <= "0011001";
                       tin1 <= "0010010";
                       tin0 <= "0000010";
                       tin7 <= "1111000";
                       state_next <= s2;
                       when s2 =>
                          tin5 <= "1000000";
                                             tin4 <= "1111001";
                                             tin3 <= "0100100";
                                             tin2 <= "0110000";
                                             tin1 <= "0011001";
                                             tin0 <= "0010010";
                                             tin7 <= "0000010";
                                             tin6 <= "1111000";
                                             state_next <= s3;
                       when s3 =>
                       tin4 <= "1000000";
                                             tin3 <= "1111001";
                                             tin2 <= "0100100";
                                             tin1 <= "0110000";
                                             tin0 <= "0011001";
                                             tin7 <= "0010010";
                                             tin6 <= "0000010";
                                             tin5 <= "1111000";
                                             state_next <= s4;
                       when s4 =>
                          tin3 <= "1000000";
                                             tin2 <= "1111001";
                                             tin1 <= "0100100";
                                             tin0 <= "0110000";
                                             tin7 <= "0011001";
                                             tin6 <= "0010010";
                                             tin5 <= "0000010";
                                             tin4 <= "1111000";
                                             state_next <= s5;
                       when s5 =>
                          tin2 <= "1000000";
                                             tin1 <= "1111001";
                                             tin0 <= "0100100";
                                             tin7 <= "0110000";
                                             tin6 <= "0011001";
                                             tin5 <= "0010010";
                                             tin4 <= "0000010";
                                             tin3 <= "1111000";
                                             state_next <= s6; 
                       when s6 =>
                          tin1 <= "1000000";
                                             tin0 <= "1111001";
                                             tin7 <= "0100100";
                                             tin6 <= "0110000";
                                             tin5 <= "0011001";
                                             tin4 <= "0010010";
                                             tin3 <= "0000010";
                                             tin2 <= "1111000";
                                             state_next <= s7;
                       when s7 =>
                           tin0 <= "1000000";
                                             tin7 <= "1111001";
                                             tin6 <= "0100100";
                                             tin5 <= "0110000";
                                             tin4 <= "0011001";
                                             tin3 <= "0010010";
                                             tin2 <= "0000010";
                                             tin1 <= "1111000";
                                             state_next <= s0; 
            end case;
     end process;
fsm : entity work.fsm(Behavioral)
        port map (
            in7 => tin7,
            in6 => tin6,
            in5 => tin5,
            in4 => tin4,
            in3 => tin3,
            in2 => tin2,
            in1 => tin1,
            in0 => tin0,
            clk => clk,
            saida => sseg(6 downto 0),
            an => an(7 downto 0)
        );

end Behavioral;
