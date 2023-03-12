-- Spartan3 Starter Kit template - top level
-- Aaka Fosfor, 2023
-- https://github.com/AakaFosfor/S3StarterKit
--
-- state: final

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity S3StarterKit is
  port (
    --! soldered 50MHz Clock
    Clk50Mhz_ik      : in  std_logic;
    -- --! empty socket IC8
    -- Gclk4_ik      : in  std_logic;
    --! LEDs
    Led_ob8          : out std_logic_vector(7 downto 0);
    --! Slide switches
    Switch_ib8       : in  std_logic_vector(7 downto 0);
    --! Push buttons
    Button_ib4       : in  std_logic_vector(3 downto 0);
    --! UART connections to female DB9 connector J2
    UartTx_o         : out std_logic;
    -- UartRx_i         : in  std_logic;
    --! UART connections to connector J1
    UartATx_o        : out std_logic;
    -- UartARx_i        : in  std_logic;
    --! 7-segment display
    SegmentAnode_onb4: out std_logic_vector(3 downto 0);
    Segment_onb8     : out std_logic_vector(7 downto 0)
    -- --! Expansion connector A2
    -- ... (see UCF)
    -- --! SRAM
    -- ... (see UCF)
    --! XCF02S Serial PROM connections
    -- ... (see UCF)
    -- --! VGA DB15 connector J6
    -- VgaRed_o         : out std_logic;
    -- VgaGreen_o       : out std_logic;
    -- VgaBlue_o        : out std_logic;
    -- VgaHSync_o       : out std_logic;
    -- VgaVSync_o       : out std_logic;
    -- --! PS/2 connector J3
    -- Ps2Clock_iok     : inout std_logic;
    -- Ps2Data_io       : inout std_logic;
  );
end entity;

architecture base of S3StarterKit is

  constant c_ClkFrequency: positive := 50e6; -- input clock frequency in Hz

  signal Counter_b: unsigned(25 downto 0) := (others => '0');
  
begin

  Led_ob8 <= Switch_ib8 xor (Button_ib4 & Button_ib4);
  UartTx_o <= '1';
  UartATx_o <= '1';
  SegmentAnode_onb4 <= (others => '0');
  Segment_onb8 <= Counter_b(Counter_b'left)&"1111111";
  
  process (Clk50Mhz_ik) begin
    if rising_edge(Clk50Mhz_ik) then
      Counter_b <= Counter_b + 1;
    end if;
  end process;

end architecture;
