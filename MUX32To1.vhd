library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MUX32To1 is
    port (
        i0,i1,i2,i3,i4,i5,i6,i7,i8,i9,i10,i11,i12,i13,i14,
        i15,i16,i17,i18,i19,i20,i21,i22,i23,i24,i25,i26,i27,
        i28,i29,i30,i31: in std_logic_vector (31 downto 0);
        selector: in std_logic_vector (4 downto 0);
        o: out std_logic_vector (31 downto 0)
    );
end MUX32To1;

architecture Behaviorl of MUX32To1 is

begin

    o<= 
    i0 when selector = "00000" else
    i1 when selector = "00001" else
    i2 when selector = "00010" else
    i3 when selector = "00011" else
    i4 when selector = "00100" else
    i5 when selector = "00101" else
    i6 when selector = "00110" else
    i7 when selector = "00111" else
    i8 when selector = "01000" else
    i9 when selector = "01001" else
    i10 when selector = "01010" else
    i11 when selector = "01011" else
    i12 when selector = "01100" else
    i13 when selector = "01101" else
    i14 when selector = "01110" else
    i15 when selector = "01111" else
    i16 when selector = "10000" else
    i17 when selector = "10001" else
    i18 when selector = "10010" else
    i19 when selector = "10011" else
    i20 when selector = "10100" else
    i21 when selector = "10101" else
    i22 when selector = "10110" else
    i23 when selector = "10111" else
    i24 when selector = "11000" else
    i25 when selector = "11001" else
    i26 when selector = "11010" else
    i27 when selector = "11011" else
    i28 when selector = "11100" else
    i29 when selector = "11101" else
    i30 when selector = "11110" else
    i31 when selector = "11111" else
   (others => 'Z');

end architecture;