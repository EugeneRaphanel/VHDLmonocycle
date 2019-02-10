Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity bancregistre is 
  
  port(
    clk, We :  in std_logic;
    Rw, Ra, Rb :  in std_logic_vector(3 downto 0);
    W : in std_logic_vector ( 31 downto 0);
    A,B : out std_logic_vector ( 31 downto 0)
  );
  
end entity;


architecture RTL of bancregistre is
  --Declaration type Tableau memoire
  
    type table is array ( 15 downto 0) of std_logic_vector( 31 downto 0);
    
    function init_banc return table is
      variable result : table;
      begin
        for i in 14 downto 0 loop
            result(i) := (others => '0');
      end loop;
      
      result(15) :=X"00000030";
      return result ;
      
    end init_banc;
    

    signal Banc: table:= init_banc;
        begin 
          A <= Banc( To_integer(unsigned(Ra)));
          B <= Banc (To_integer(unsigned(Rb)));
    process(clk,We,Rw,W)
      begin
        if rising_edge(clk) then
          if We = '1' then 
            Banc(To_integer(unsigned(Rw))) <= W ;
          end if;
      end if;
end process;

end architecture; 
 