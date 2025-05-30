library ieee;
use ieee.std_logic_1164.all;
entity eq_top is
   port(
      sw  : in  std_logic_vector(7 downto 0); -- 4 switches
      led : out std_logic_vector(2 downto 0) -- 1 red LED
   );
end eq_top;

architecture struc_arch of eq_top is
signal sel : std_logic_vector (1 downto 0);
begin
   -- instantiate 2-bit comparator
   encoder : entity work.prio_encoder(cond_arch)
      port map(
         r    => sw(2 downto 0),
         pcode   => sel(1 downto 0)
);
    led_mux1 : entity work.led_mux8(arch)
      port map(
        sel => sel(1 downto 0),
         in0 => sw(4),
         in1 => sw(3),
         in2 => sw(5),
         in3 => sw(5),
         b => led(0)
);

led_mux2 : entity work.led_mux8(arch)
      port map(
        sel => sel(1 downto 0),
         in0 => sw(5),
         in1 => sw(4),
         in2 => sw(6),
         in3 => sw(6),
         b => led(1)
);

led_mux3 : entity work.led_mux8(arch)
      port map(
        sel => sel(1 downto 0),
         in0 => sw(6),
         in1 => sw(5),
         in2 => sw(4),
         in3 => sw(7),
         b => led(2)
);
end struc_arch;