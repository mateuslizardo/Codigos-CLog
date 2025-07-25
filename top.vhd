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
    clk : in std_logic;
    sw : in std_logic_vector(1 downto 0)
  );
end top;

architecture Behavioral of top is
constant N : integer := 9999999;
 signal divide_clk : integer range 0 to N;
   type eg_state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
   signal state_reg, state_next : eg_state_type;
   signal tin0, tin1, tin2, tin3, tin4, tin5, tin6, tin7 : std_logic_vector(6 downto 0);
   signal enable, sentido : std_logic;
begin
    enable <= sw(1);
    sentido <= sw(0);
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
 process(state_reg, tin0, tin1, tin2, tin3, tin4, tin5, tin6, tin7, enable, sentido)
 begin
       case state_reg is
           when s0 =>
            tin7 <= "0011100";
            tin6 <= "1111111";
            tin5 <= "1111111";
            tin4 <= "1111111";
            tin3 <= "1111111";
            tin2 <= "1111111";
            tin1 <= "1111111";
            tin0 <= "1111111";

                if(enable = '1') then
                    if(sentido = '0') then
                        state_next <= s1;
                    else
                        state_next <= s7;
                        end if;
                else
                    state_next <= s0;
                    end if;

            when s1 =>
                tin7 <= "1111111";
            tin6 <= "0011100";
            tin5 <= "1111111";
            tin4 <= "1111111";
            tin3 <= "1111111";
            tin2 <= "1111111";
            tin1 <= "1111111";
            tin0 <= "1111111";

            if(enable = '1') then
                if(sentido = '0') then
                    state_next <= s2;
                else
                    state_next <= s0;
                    end if;
                else
                    state_next <= s1;
                
                end if;
                       when s2 =>
                        tin7 <= "1111111";
                        tin6 <= "1111111";
                        tin5 <= "0011100";
                        tin4 <= "1111111";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";
                        
                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s3;
                            else
                                state_next <= s1;
                                end if;
                            else
                                state_next <= s2;
                            end if;
                       when s3 =>
                        tin7 <= "1111111";
                        tin6 <= "1111111";
                        tin5 <= "1111111";
                        tin4 <= "0011100";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";
                        
                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s4;
                            else
                                state_next <= s2;
                                end if;
                            else
                                state_next <= s3;
                            end if;

                       when s4 =>
                        tin7 <= "1111111";
                        tin6 <= "1111111";
                        tin5 <= "1111111";
                        tin4 <= "0100011";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";
                        
                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s5;
                            else
                                state_next <= s3;
                                end if;
                            else
                                state_next <= s4;
                            end if;
                       when s5 =>
                        tin7 <= "1111111";
                        tin6 <= "1111111";
                        tin5 <= "0100011";
                        tin4 <= "1111111";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";
                        
                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s6;
                            else
                                state_next <= s4;
                                end if;
                            else
                                state_next <= s5;
                            end if;
                       when s6 =>
                        tin7 <= "1111111";
                        tin6 <= "0100011";
                        tin5 <= "1111111";
                        tin4 <= "1111111";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";

                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s7;
                            else
                                state_next <= s5;
                                end if;
                            else
                                state_next <= s6;
                            end if;
                       when s7 =>
                        tin7 <= "0100011";
                        tin6 <= "1111111";
                        tin5 <= "1111111";
                        tin4 <= "1111111";
                        tin3 <= "1111111";
                        tin2 <= "1111111";
                        tin1 <= "1111111";
                        tin0 <= "1111111";
                        
                        if(enable = '1') then
                            if(sentido = '0') then
                                state_next <= s0;
                            else
                                state_next <= s6;
                                end if;
                            else
                                state_next <= s7;
                            end if;
            end case;
     end process;
fsm : entity work.fsm_eg(mult_seg_arch)
        port map (
            sseg7 => tin7,
            sseg6 => tin6,
            sseg5 => tin5,
            sseg4 => tin4,
            sseg3 => tin3,
            sseg2 => tin2,
            sseg1 => tin1,
            sseg0 => tin0,
            clk => clk,
            saida => sseg(6 downto 0),
            an => an(7 downto 0)
        );

end Behavioral;
