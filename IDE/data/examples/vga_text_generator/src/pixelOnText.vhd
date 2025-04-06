
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 
library work;
use work.commonPak.all;

entity Pixel_On_Text is
	generic(
       textLength: integer := 11
	);
	port (
		clk: in std_logic;
		displayText: in string (1 to textLength) := (others => NUL);
		position: in point_2d := (0, 0);
		horzCoord: in integer;
		vertCoord: in integer;
		
		pixel: out std_logic := '0'
	);

end Pixel_On_Text;

architecture Behavioral of Pixel_On_Text is

	signal fontAddress: integer;
	signal charBitInRow: std_logic_vector(FONT_WIDTH-1 downto 0) := (others => '0');
	signal charCode:integer := 0;
	signal charPosition:integer := 0;
	signal bitPosition:integer := 0;
begin
    charPosition <= (horzCoord - position.x)/FONT_WIDTH + 1;
    bitPosition <= (horzCoord - position.x) mod FONT_WIDTH;
    charCode <= character'pos(displayText(charPosition));
    fontAddress <= charCode*16+(vertCoord - position.y);


	fontRom: entity work.Font_Rom
	port map(
		clk => clk,
		addr => fontAddress,
		fontRow => charBitInRow
	);
	
	pixelOn: process(clk)
		variable inXRange: boolean := false;
		variable inYRange: boolean := false;
	begin
        if rising_edge(clk) then
            
            inXRange := false;
            inYRange := false;
            pixel <= '0';
            if horzCoord >= position.x and horzCoord < position.x + (FONT_WIDTH * textlength) then
                inXRange := true;
            end if;
            
            if vertCoord >= position.y and vertCoord < position.y + FONT_HEIGHT then
                inYRange := true;
            end if;
            
            if inXRange and inYRange then
                if charBitInRow(FONT_WIDTH-bitPosition) = '1' then
                    pixel <= '1';
                end if;					
            end if;

		end if;
	end process;

end Behavioral;