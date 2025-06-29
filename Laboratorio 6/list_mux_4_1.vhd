--=============================
-- Listing 4.1
--=============================
library ieee;
use ieee.std_logic_1164.all;
entity mux4 is
   port(
      b,naob: in std_logic_vector(3 downto 0);
      sub: in std_logic;
      x: out std_logic_vector(3 downto 0)
   );
end mux4;

architecture cond_arch of mux4 is
begin
   x <= b when (sub = '0') else naob;
end cond_arch;

----=============================
---- Listing 4.5
----=============================
--architecture sel_arch of mux4 is
--begin
--   with s select
--     x <= a when "00",
--          b when "01",
--          c when "10",
--          d when others;
--end sel_arch;

----=============================
---- Listing 5.1
----=============================
--architecture if_arch of mux4 is
--begin
--   process(a,b,c,d,s)
--   begin
--      if (s="00") then
--         x <= a;
--      elsif (s="01")then
--         x <= b;
--      elsif (s="10")then
--         x <= c;
--      else
--         x <= d;
--      end if;
--   end process;
--end if_arch;

----=============================
---- Listing 5.6
----=============================
--architecture case_arch of mux4 is
--begin
--   process(a,b,c,d,s)
--   begin
--      case s is
--         when "00" =>
--            x <= a;
--         when "01" =>
--             x <= b;
--         when "10" =>
--             x <= c;
--         when others =>
--             x <= d;
--      end case;
--   end process;
--end case_arch;
