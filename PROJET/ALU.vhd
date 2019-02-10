Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU is 
  port( A, B : in std_logic_vector (31 downto 0);
        OP : in std_logic_vector (1 downto 0);
        N : out std_logic;
        S : out std_logic_vector (31 downto 0));
end entity;

Architecture behaviour of ALU is
  signal Y : std_logic_vector(31 downto 0);
Begin
  
     N <= Y(31);
     S <= Y;
  process(OP,A,B)
    begin
      case OP is
            when "00" => Y <= Std_logic_vector( Signed(A) + signed(B));   --ADD
            when "01" => Y <= B;       --B
            when "10" => Y <= std_logic_vector( signed(A) - signed(B));   --SUB
            when "11" => Y <= A ;      --A 
            when others => Y <= (others =>'0');
    end case;     
      
  end process;
 
end architecture;
