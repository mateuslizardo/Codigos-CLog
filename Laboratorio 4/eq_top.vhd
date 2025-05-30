library ieee;
use ieee.std_logic_1164.all;

entity eq_top is
   port(
      sw  : in  std_logic_vector(15 downto 0);
      sseg : out std_logic_vector(7 downto 0);
      an : out std_logic_vector(7 downto 0);
      clk    : in std_logic;  
      reset  : in std_logic
    
   );
end eq_top;

architecture struc_arch of eq_top is
signal s0 : std_logic_vector (7 downto 0);
signal s1 : std_logic_vector (7 downto 0);
signal s2 : std_logic_vector (7 downto 0);
signal s3 : std_logic_vector (7 downto 0);
signal s4 : std_logic_vector (7 downto 0);
signal s5 : std_logic_vector (7 downto 0);
signal s6 : std_logic_vector (7 downto 0);
signal s7 : std_logic_vector (7 downto 0);

begin
   
   c0 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(3 downto 0),
         sseg => s0(7 downto 0),
         dp => '1'
);

c1 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(7 downto 4),
         sseg => s1(7 downto 0),
         dp => '1'
);

c2 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(11 downto 8),
         sseg => s2(7 downto 0),
         dp => '1'
);

c3 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(15 downto 12),
         sseg => s3(7 downto 0),
         dp => '1'
);

c4 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(3 downto 0),
         sseg => s4(7 downto 0),
         dp => '1'
);

c5 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(7 downto 4),
         sseg => s5(7 downto 0),
         dp => '1'
);

c6 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(11 downto 8),
         sseg => s6(7 downto 0),
         dp => '1'
);

c7 : entity work.hex_to_sseg(arch)
      port map(
         hex => sw(15 downto 12),
         sseg => s7(7 downto 0),
         dp => '1'
);

   mplx : entity work.led_mux8(arch)
        port map(
            clk => clk,
            reset => reset,
            an => an(7 downto 0),
            sseg => sseg(7 downto 0),
            in0 => s0,
            in1 => s1,
            in2 => s2,
            in3 => s3,
            in4 => s4,
            in5 => s5,
            in6 => s6,
            in7 => s7
        );

end struc_arch;