library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity somador is
    port(
        in0,in1 : in std_logic;
        entra1 : in std_logic;
        sai1 : out std_logic;
        resultado : out std_logic
    );
end somador;

architecture arch of somador is
begin
    sai1 <= (in1 and entra1) or (in0 and entra1) or (in0 and in1);
    resultado <= in0 xor in1 xor entra1;

end arch;
