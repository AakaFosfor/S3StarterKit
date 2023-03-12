-- Spartan3 Starter Kit template - top level testbench
-- Aaka Fosfor, 2023
-- https://github.com/AakaFosfor/S3StarterKit
--
-- state: draft

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

library std;
use std.env.all;

entity S3StarterKit_tb is
end entity;

architecture sim of S3StarterKit_tb is

  constant c_ClkFrequency: positive := 50e6;

  signal Clk50Mhz_ik: std_logic := '0';
  signal Led_ob8: std_logic_vector(7 downto 0);
  signal Switch_ib8: std_logic_vector(7 downto 0) := (others => '0');
  signal Button_ib4: std_logic_vector(3 downto 0) := (others => '0');

begin

  p_Clk: process is begin
    Clk50Mhz_ik <= '0';
    wait for (1 sec)/(2*c_ClkFrequency);
    Clk50Mhz_ik <= '1';
    wait for (1 sec)/(2*c_ClkFrequency);
  end process;
        
  i_DUT: entity work.S3StarterKit(base)
  port map (
    Clk50Mhz_ik,
    Led_ob8,
    Switch_ib8,
    Button_ib4
  );
        
  p_Test: process is begin
    wait for 1 us;
    Switch_ib8 <= "00000100";
    wait for 1 us;
    Switch_ib8 <= "00100100";
    wait for 1 us;
    Button_ib4 <= "0011";
    
    wait for 10 us;
    stop(0);
  end process;

end architecture;