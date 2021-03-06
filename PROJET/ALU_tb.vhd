Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

Entity ALU_tb is
port(OK: out BOOLEAN);
end;

architecture TB1 of ALU_tb is
    signal A, B, S : std_logic_vector (31 downto 0);
    signal OP : std_logic_vector (1 downto 0);
    signal N : std_logic;
  Begin
    process
      begin
        
        OK <= TRUE;
        
        A <= "00000000000000000000000000001010";
        B <= "00000000000000000000000000000001";
        OP <= "00";
        wait for 10 ns;
        if (S /= "00000000000000000000000000001011" or N = '1') then
          OK <= FALSE;
        end if;
        
        OP <= "01";
        wait for 10 ns;
        if (S /= B or N = '1') then
          OK <= FALSE;
        end if;
        
         OP <= "10";
        wait for 10 ns;
        if (S /= "00000000000000000000000000001001" or N = '1') then
          OK <= FALSE;
        end if;
        
         OP <= "11";
        wait for 10 ns;
        if (S /= A or N = '1') then
          OK <= FALSE;
        end if;
        
        A <= "11111111111111111111111111110110";
        B <= "11111111111111111111111111111111";
        OP <= "00";
        wait for 10 ns;
        if (S /= "11111111111111111111111111110101" or N = '0') then
          OK <= FALSE;
        end if;
        
        OP <= "01";
        wait for 10 ns;
        if (S /= B or N = '0') then
          OK <= FALSE;
        end if;
        
         OP <= "10";
        wait for 10 ns;
        if (S /= "11111111111111111111111111110111" or N = '0') then
          OK <= FALSE;
        end if;
        
         OP <= "11";
        wait for 10 ns;
        if (S /= A or N = '0') then
          OK <= FALSE;
        end if;
        
        wait;

    end process;
  ALU1: entity work.ALU(behaviour) port map( A => A, B => B, OP => OP, N => N, S => S); 
end architecture;