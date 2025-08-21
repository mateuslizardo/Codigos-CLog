-- Listing 5.1
library ieee;
use ieee.std_logic_1164.all;
entity fsm_eg is
   port(
      clk : in  std_logic;
      a,b : in std_logic;
      c_en,c_ex : out std_logic
   );
end fsm_eg;

architecture mult_seg_arch of fsm_eg is
    constant N : integer := 49999999; 
    signal enable : std_logic;
    signal divide_clk : integer range 0 to N;
    
   type eg_state_type is (inic, toc_a_en, meio_en, toc_b_en, toc_b_sa, meio_sa, toc_a_sa);
   signal state_reg, state_next : eg_state_type;
begin

         process(clk)
   begin
      if (clk'event and clk='1') then
         state_reg <= state_next;
      end if;
   end process;
   -- state register
   -- next-state logic
   
   process(state_reg, a,b)
   begin
      case state_reg is
         when inic =>
            c_en <= '0';
            c_ex <= '0';
            if (a='0' and b='0') or (a='1' and b='1') then
                state_next <= inic;
            elsif a='1' and b='0' then
                state_next <= toc_a_en;
            elsif a='0' and b='1' then
                state_next <= toc_b_sa;
            end if;
         
         when toc_a_en =>
            c_en <= '0';
            c_ex <= '0';
            if(a='1' and b='0') then
               state_next <= toc_a_en;
            elsif a='0' then
               state_next <= inic;
            elsif a='1' and b='1' then
               state_next <= meio_en;
           end if;

         when meio_en =>
            c_en <= '0';
            c_ex <= '0';
            if(a='1' and b='1') then
               state_next <= meio_en;
            elsif a='0' then
               state_next <= toc_b_en;
            elsif b='0' then
               state_next <= toc_a_en;
            end if;

         when toc_b_en =>
            c_en <= '0';
            c_ex <= '0';
            if(a='0' and b='1') then
               state_next <= toc_b_en;
            elsif a='1' and b='1' then
               state_next <= meio_en;
            elsif b='0' then
               c_en <= '1';
               state_next <= inic;
           end if;

           when toc_a_sa =>
            c_en <= '0';
            c_ex <= '0';
            if(a='1' and b='0') then
               state_next <= toc_a_sa;
            elsif a='0' then
               c_ex <= '1';
               state_next <= inic;
            elsif a='1' and b='1' then
               state_next <= meio_sa;
           end if;

         when meio_sa =>
            c_en <= '0';
            c_ex <= '0';
            if(a='1' and b='1') then
               state_next <= meio_sa;
            elsif a='0' then
               state_next <= toc_b_sa;
            elsif b='0' then
               state_next <= toc_a_sa;
            end if;

         when toc_b_sa =>
            c_en <= '0';
            c_ex <= '0';
            if(a='0' and b='1') then
               state_next <= toc_b_sa;
            elsif a='1' and b='1' then
               state_next <= meio_sa;
            elsif b='0' then
               state_next <= inic;
           end if;

      end case;
   end process;

end mult_seg_arch;

