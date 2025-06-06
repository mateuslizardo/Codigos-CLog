library ieee;
use ieee.std_logic_1164.all;
entity eq_top is
   port(
      sw : in std_logic_vector(8 downto 0);
      led : out std_logic_vector(3 downto 0)
   );
end eq_top;

architecture struc_arch of eq_top is
signal entra : std_logic_vector (3 downto 0);
signal bfinal : std_logic_vector(3 downto 0);
signal inv : std_logic_vector(3 downto 0);
signal led3: std_logic;
begin
inv(0) <= not sw(1);
inv(1) <= not sw(2);
inv(2) <= not sw(3);
inv(3) <= not sw(4);
   -- instantiate 2-bit comparator
   mux : entity work.mux4(cond_arch)
      port map(
         b => sw(4 downto 1),
         sub => sw(0),
         naob => inv(3 downto 0),
         x => bfinal(3 downto 0)
);
    somador1 : entity work.somador(arch)
      port map(
       
         in0 => sw(5),
         in1 => bfinal(0),
         entra1 => sw(0),
         sai1 => entra(0),
         resultado => led(0)
);
  somador2 : entity work.somador(arch)
    port map(
     
       in0 => sw(6),
       in1 => bfinal(1),
       entra1 => entra(0),
       sai1 => entra(1),
       resultado => led(1)
);
  somador3 : entity work.somador(arch)
    port map(
     
       in0 => sw(7),
       in1 => bfinal(2),
       entra1 => entra(1),
       sai1 => entra(2),
       resultado => led(2)
);
  somador4 : entity work.somador(arch)
    port map(
     
       in0 => sw(8),
       in1 => bfinal(3),
       entra1 => entra(2),
       sai1 => entra(3),
       resultado => led3
);

led(3) <= led3;
led(4) <= (sw(8) and bfinal(3) and not led3) or (not sw(8) and not bfinal(3) and led3);
end struc_arch;