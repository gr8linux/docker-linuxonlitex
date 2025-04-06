library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;
library work;
use work.commonPak.all;

entity wrapper is
  Port (
    clk: in std_logic;
    xCoord: in std_logic_vector(11 downto 0);
    yCoord: in std_logic_vector(11 downto 0);
    pixOn: out std_logic
   );
end wrapper;

architecture Behavioral of wrapper is
	
	signal h : integer := to_integer(signed(xCoord));
	signal v : integer := to_integer(signed(yCoord));
    
    signal d1 : std_logic := '0';
    signal d2 : std_logic := '0';
    signal d3 : std_logic := '0';
    signal d4 : std_logic := '0';
    signal d5 : std_logic := '0';
    
begin


	textElement1: entity work.Pixel_On_Text
	generic map (
		textLength => 38
	)
	port map(
		clk => clk,
		displayText => "Pixel_On_Text -- test 1!@#$ at (50,50)",
		position => (50, 50),
		horzCoord => h,
		vertCoord => v,
		pixel => d1
	);
	
	textElement2: entity work.Pixel_On_Text
	generic map (
		textLength => 39
	)
	port map(
		clk => clk,
		displayText => "Pixel_On_Text -- test 2%^&* at (500,50)",
		position => (500, 50),
		horzCoord => h,
		vertCoord => v,
		pixel => d2
	);
	
	textElement3: entity work.Pixel_On_Text
	generic map (
		textLength => 41
	)
	port map(
		clk => clk,
		displayText => "Pixel_On_Text -- test 3()_+-= at (50,130)",
		position => (50, 130),
		horzCoord => h,
		vertCoord => v,
		pixel => d3
	);

        
    textElement4: entity work.Pixel_On_Text
    generic map (
        textLength => 40
    )
    port map(
        clk => clk,
        displayText => "Pixel_On_Text -- test 4()_+-= at (70,90)", 
        position => (70, 90),
        horzCoord => h,
        vertCoord => v,
        pixel => d4
    );
    textElement5: entity work.Pixel_On_Text
    generic map (
        textLength => 40
    )
    port map(
        clk => clk,
        displayText => "Pixel_On_Text -- test 5()_+-= at (30,90)", 
        position => (30, 90),
        horzCoord => h,
        vertCoord => v,
        pixel => d5
    );
	
	pixelInTextGroup: process(clk)
        begin
            
            if rising_edge(clk) then
                pixOn <= d1 or d2 or d3 or d4 or d5;

            end if;
        end process;

end Behavioral;
