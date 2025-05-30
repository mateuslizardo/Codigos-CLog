library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity led_mux8 is
   port(
--      clk, reset         : in  std_logic;
      in3, in2, in1, in0 : in  std_logic;
      sel : in std_logic_vector(1 downto 0);
--      in7, in6, in5, in4 : in  std_logic_vector(7 downto 0);
--      an                 : out std_logic_vector(7 downto 0);
      b               : out std_logic
   );
end led_mux8;

architecture arch of led_mux8 is
   -- refreshing rate around 1600 Hz (100MHz/2^16)
--   constant N           : integer := 18;
--   signal q_reg, q_next : unsigned(N - 1 downto 0);
--   signal sel           : std_logic_vector(1 downto 0);
begin
   -- register
--   process(clk, reset)
--   begin
--      if reset = '1' then
--         q_reg <= (others => '0');
--      elsif (clk'event and clk = '1') then
--         q_reg <= q_next;
--      end if;
--   end process;
--   -- next-state logic for the counter
--   q_next <= q_reg + 1;
   -- 3 MSBs of counter to control 8-to-1 multiplexing
--   -- and to generate active-low enable signal
--   sel <= std_logic_vector(q_reg(N - 1 downto N - 3));
   process(sel, in0, in1, in2, in3)
   begin
      case sel is
         when "00" =>
           
            b <= in0;
         when "01" =>
            
            b <= in1;
         when "10" =>
            
            b <= in2;
           
         when others =>
            
            b <= in3;
      end case;
   end process;
end arch;