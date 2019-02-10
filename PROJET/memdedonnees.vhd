Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity memdedonnees is

port (
clk, WrEn : in std_logic;
addr : in std_logic_vector( 5 downto 0);
datain : in std_logic_vector ( 31 downto 0);
dataout : out std_logic_vector(  31 downto 0)
);
end entity;

architecture RTL of memdedonnees is

type mem is array (63 downto 0) of std_logic_vector( 31 downto 0);
    
    function init_mem return mem is
      variable result : mem;
      begin
        for i in 63 downto 0 loop
            result(i) := (others => '0');
      end loop;
      return result ;
      
    end init_mem;

 signal Banc: mem:= init_mem;
begin

 dataout <= Banc( To_integer(unsigned(addr)));

	process(clk,WrEn,addr)
		begin
		if (rising_edge(clk) and wrEn = '1') then
			Banc(To_integer(unsigned(addr))) <= datain ;
		end if;
	end process;
end architecture;

	
