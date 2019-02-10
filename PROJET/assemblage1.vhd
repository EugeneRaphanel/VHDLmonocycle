Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

Entity assemblage1 is
  port (
    clk, We :  in std_logic;
    Rw, Ra, Rb :  in std_logic_vector(3 downto 0);
    OP : in std_logic_vector (1 downto 0));
    
end entity;

Architecture sql of assemblage1 is
  signal busA, busB, TbusW: std_logic_vector ( 31 downto 0); 
  signal N : std_logic;
  begin
  
ALU1: entity work.ALU(behaviour) port map( A => busA, B => busB, OP => OP, N => N, S => TbusW);
Regis: entity work.bancregistre(RTL) port map( W => TbusW, clk => clk, We => We, Rw => Rw, Ra => Ra, Rb => Rb, A => busA, B => busB); 
    
end architecture;