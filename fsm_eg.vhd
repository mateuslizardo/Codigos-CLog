-- Listing 5.1
library ieee;
use ieee.std_logic_1164.all;
entity fsm_eg is
   port(
      clk : in  std_logic;
      sseg0, sseg1, sseg2, sseg3       : in  std_logic_vector(6 downto 0);
      sseg4, sseg5, sseg6, sseg7 : in std_logic_vector(6 downto 0);
      saida     : out std_logic_vector(6 downto 0);
      an : out std_logic_vector(7 downto 0)
   );
end fsm_eg;

architecture mult_seg_arch of fsm_eg is
    constant N : integer := 99999; 
    signal enable : std_logic;
    signal divide_clk : integer range 0 to N;
    
   type eg_state_type is (s0, s1, s2, s3, s4, s5, s6, s7);
   signal state_reg, state_next : eg_state_type;
begin

    
   PROCESS (clk, state_reg, state_next)
            BEGIN
                IF (clk'EVENT AND clk='1') THEN
                    divide_clk <= divide_clk+1;
                    IF divide_clk = N THEN
                        state_reg <= state_next;
                        divide_clk <= 0;
                    END IF;
                END IF;
         END PROCESS;
         
   -- state register
   
   -- next-state logic
   process(state_reg, sseg0, sseg1, sseg2, sseg3, sseg4, sseg5, sseg6, sseg7)
   begin
      case state_reg is
         when s0 =>
            an <= "11111110";
            saida <= sseg0;
            state_next <= s1; 
         when s1 =>
            an <= "11111101";
            saida <= sseg1;
            state_next <= s2; 
         when s2 =>
            an <= "11111011";
            saida <= sseg2;
            state_next <= s3; 
         when s3 =>
            an <= "11110111";
            saida <= sseg3;
            state_next <= s4; 
         when s4 =>
             an <= "11101111";
             saida <= sseg4;
             state_next <= s5; 
         when s5 =>
             an <= "11011111";
             saida <= sseg5;
             state_next <= s6; 
         when s6 =>
             an <= "10111111";
             saida <= sseg6;
             state_next <= s7; 
         when s7 =>
             an <= "01111111";
             saida <= sseg7;
             state_next <= s0; 
      end case;
   end process;

end mult_seg_arch;

