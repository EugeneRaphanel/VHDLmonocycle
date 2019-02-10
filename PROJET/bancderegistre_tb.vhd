Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity bancderegistre_tb is
  
 
    port(OK: out BOOLEAN);
end;


architecture RTL of bancderegistre_tb is
  
    signal Clock, We :  std_logic;
    signal Rw, Ra, Rb :  std_logic_vector(3 downto 0);
    signal A,B ,W:  std_logic_vector ( 31 downto 0);
    
    
    Begin
      
      process
        begin
          OK <= TRUE;
          We <= '1';
          Rw <= "0001";
          Ra <= "0001";
          Rb <= "0010";
          W <= "11000000000000000000000000000000";
   
          
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
        
        if( A /= W) then
              OK <= FALSE;
        end if;
          
          We <= '0';
          Rw <= "0010";
          W <="00000000000000000000000000000011";
          wait for 10 ns;
          
          if ( B = W) then
              OK <= FALSE ;
          end if;  
          
          wait;
          
        end process;
        
      BR : entity work.bancregistre(RTL) port map ( clk =>Clock, We => We, Rw => Rw, Ra => Ra, Rb =>Rb, A =>A, B=>B,  W=> W);
        
      end architecture;    
       
              
            