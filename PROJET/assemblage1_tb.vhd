Library ieee;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;


entity assemblage1_tb is
  
 
    port(OK: out BOOLEAN);
end;


architecture sql of assemblage1_tb is

  signal Clock, We,Wde: std_logic;
  signal Rw, Ra, Rb : std_logic_vector(3 downto 0);
  signal OP : std_logic_vector (1 downto 0);

-- signal pour test--
signal TbusW, busA, BusB : std_logic_vector(31 downto 0);
  
begin
  process
    begin
        OK <= TRUE;
        We <= '0';
        Ra <= "1111";
        Rb <= "0001";        
        OP <= "11";
        --Wde <= '0'; -- ne change jamais on veut juste pouvoir lire les valeurs;
	TbusW <= (others => '0');

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

	TbusW <="00000000000000000000000000110000";
        Rw <= "0001";
        We <= '1';
        

        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

	-- test R(1) = R(15)--
        if( BusA /= BusB) then
		OK <= False;
	end if;
	--OK <= True;
        Rb <= "0001";
        OP <= "00";
        We <= '0';
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
        
	TbusW <= "00000000000000000000000001100000";
        We <= '1';
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

	--Test R(1) = R(1) +R(15)--
        if (BusB /= std_logic_vector(Signed(BusA)+Signed(BusA)))then
		OK <= False;
	end if;
	--OK <= True;
        We <= '0';
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
         
	TbusW <= "00000000000000000000000010010000";
        
        We <= '1';
        Rw <= "0010";
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;

	--Test R(2) =R(1) + R(15)--
	Rb <= Rw;
	 if (BusB /= std_logic_vector(Signed(BusA)+Signed(BusA)))then
		OK <= False;
	end if;
	
        Rb <= "1111";
	Ra <= "0001";
        We <= '0';
        OP <= "10";
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
        
	TbusW <= "00000000000000000000000000110000";
        We <= '1';
        Rw <= "0011";
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
        
	--Test R(3) = R(1) - R(15)--
	Rb <= RW;
	if ( BusB /= TbusW) then
		OK <= False;
	end if;
	Rb <= "1111";
        Ra <= "0111";
        We <= '0';
        
	
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
        
	TbusW <= "11111111111111111111111111010000";
        We <= '1';
        Rw <= "0101";
        
        Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
	
	--Test R(5) = R(7) -R(15)
	Ra <= Rw;
	if (busA /= TbusW ) then -- retourne false??
		Ok <= False;
	end if;
	Clock <= '0';
        wait for 5 NS;
        Clock <= '1';
        wait for 5 NS;
      	wait;
end process;
    ass: entity work.assemblage1(sql) port map( clk => Clock, We => We, Ra => Ra, Rb => Rb, Rw => Rw, OP => OP);
-- entity créee pour les tests
tbbancR : entity work.bancregistre(RTL) port map( W => TbusW, clk => Clock, We => We, Rw => Rw, Ra => Ra, Rb => Rb, A => busA, B => busB);
end architecture;