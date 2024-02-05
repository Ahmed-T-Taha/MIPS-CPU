library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MUX32To1;
use work.reg;
use work.Decoder;

entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
SIGNAL L : STD_LOGIC_VECTOR (31 downto 0);
SIGNAL Out1, Out2, Out3, Out4, Out5, Out6, Out7,Out8, Out9,
 Out10, Out11, Out12, Out13, Out14, Out15, Out16, Out17, Out18,
 Out19, Out20, Out21, Out22, Out23, Out24, Out25, Out26, Out27,
 Out28, Out29, Out30, Out31, Out32 : STD_LOGIC_VECTOR (31 downto 0);
 
begin

dec1 : entity Decoder port map (write_sel, write_ena , L);

reg1 : entity reg port map ( write_data , Out1 , L(0) , clk );
reg2 : entity reg port map ( write_data , Out2 , L(1) , clk );
reg3 : entity reg port map ( write_data , Out3 , L(2) , clk );
reg4 : entity reg port map ( write_data , Out4 , L(3) , clk );
reg5 : entity reg port map ( write_data , Out5 , L(4) , clk );
reg6 : entity reg port map ( write_data , Out6 , L(5) , clk );
reg7 : entity reg port map ( write_data , Out7 , L(6) , clk );
reg8 : entity reg port map ( write_data , Out8 , L(7) , clk );
reg9 : entity reg port map ( write_data , Out9 , L(8) , clk );
reg10 : entity reg port map ( write_data , Out10 , L(9) , clk );
reg11 : entity reg port map ( write_data , Out11 , L(10) , clk );
reg12 : entity reg port map ( write_data , Out12 , L(11) , clk );
reg13 : entity reg port map ( write_data , Out13 , L(12) , clk );
reg14 : entity reg port map ( write_data , Out14 , L(13) , clk );
reg15 : entity reg port map ( write_data , Out15 , L(14) , clk );
reg16 : entity reg port map ( write_data , Out16 , L(15) , clk );
reg17 : entity reg port map ( write_data , Out17 , L(16) , clk );
reg18 : entity reg port map ( write_data , Out18 , L(17) , clk );
reg19 : entity reg port map ( write_data , Out19 , L(18) , clk );
reg20 : entity reg port map ( write_data , Out20 , L(19) , clk );
reg21 : entity reg port map ( write_data , Out21 , L(20) , clk );
reg22 : entity reg port map ( write_data , Out22 , L(21) , clk );
reg23 : entity reg port map ( write_data , Out23 , L(22) , clk );
reg24 : entity reg port map ( write_data , Out24 , L(23) , clk );
reg25 : entity reg port map ( write_data , Out25 , L(24) , clk );
reg26 : entity reg port map ( write_data , Out26 , L(25) , clk );
reg27 : entity reg port map ( write_data , Out27 , L(26) , clk );
reg28 : entity reg port map ( write_data , Out28 , L(27) , clk );
reg29 : entity reg port map ( write_data , Out29 , L(28) , clk );
reg30 : entity reg port map ( write_data , Out30 , L(29) , clk );
reg31 : entity reg port map ( write_data , Out31 , L(30) , clk );
reg32 : entity reg port map ( write_data , Out32 , L(31) , clk );

mux1 : entity MUX32To1 port map (Out1, Out2, Out3, Out4, Out5, Out6,
 Out7, Out8, Out9, Out10, Out11, Out12, Out13, Out14, Out15, Out16,
 Out17, Out18, Out19, Out20, Out21, Out22, Out23, Out24, Out25,
 Out26, Out27, Out28, Out29, Out30, Out31, Out32, read_sel1, data1);
 
mux2 : entity MUX32To1 port map (Out1, Out2, Out3, Out4, Out5, Out6,
 Out7, Out8, Out9, Out10, Out11, Out12, Out13, Out14, Out15, Out16,
 Out17, Out18, Out19, Out20, Out21, Out22, Out23, Out24, Out25,
 Out26, Out27, Out28, Out29, Out30, Out31, Out32, read_sel2, data2);

end Behavioral;