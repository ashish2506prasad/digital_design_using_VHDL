library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Tonegenerator is
port (clk_out,l1,l2,l3,l4,l5,l6,l7,l8 : out std_logic;
		clk_50, s1, s2, s3, s4, s5, s6, s7, s8: in std_logic);
end entity Tonegenerator;

architecture bhv of Tonegenerator is
	signal count1,count2,count3,count4,count5,count6,count7,count8: integer := 1;
	signal a1,a2,a3,a4,a5,a6,a7,a8: std_logic:='1' ;

	begin
	note_sa: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count1<104167) then 
				count1 <= count1+1; 
			else 
				count1 <=1 ;
				
				a1 <= not a1; 
				 
			end if ;
	end if;
	end process;
	
	note_re: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count2<92593) then 
				count2 <= count2+1; 
			else 
				count2 <=1 ;
				
				a2 <= not a2; 
				 
			end if ;
	end if;
	end process;
	
	note_ga: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count3<83333) then 
				count3 <= count1+1; 
			else 
				count3 <=1 ;
				
				a3 <= not a3; 
				 
			end if ;
	end if;
	end process;
	
	note_ma: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count4<78125) then 
				count4 <= count4+1; 
			else 
				count4 <=1 ;
				
				a4 <= not a4; 
				 
			end if ;
	end if;
	end process;
	
	note_pa: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count5<69444) then 
				count5 <= count5+1; 
			else 
				count5 <=1 ;
				
				a5 <= not a5; 
				 
			end if ;
	end if;
	end process;
	
	note_dha: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count6<62500) then 
				count6 <= count6+1; 
			else 
				count6 <=1 ;
				
				a6 <= not a6; 
				 
			end if ;
	end if;
	end process;
	
	note_ni: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count7<55556) then 
				count7 <= count7+1; 
			else 
				count7 <=1 ;
				
				a7 <= not a7; 
				 
			end if ;
	end if;
	end process;
	
	note_upper_sa: process(clk_50)
		begin
		if(clk_50 = '1' and clk_50' event) then 
			if(count8<52083) then 
				count8 <= count8+1; 
			else 
				count8 <=1 ;
				
				a8 <= not a8; 
				 
			end if ;
	end if;
	end process;
	
	
	outpt : process(clk_50,s1, s2, s3, s4, s5, s6, s7, s8, a1,a2,a3,a4,a5,a6,a7,a8)
	begin
	if s1 = '1' and s2 = '1' and s3 = '1' and s4 = '1' and s5 = '1' and s6 = '1' and s7= '1' and s8 = '1' then
		clk_out<= a8;
		l1<='0';l2<='0';l3<='0';l4<='0';l5<='0';l6<='0';l7<='0';l8<='1';
	elsif s1 = '1' and s2 = '1' and s3 = '1' and s4 = '1' and s5 = '1' and s6 = '1' and s7= '1' then
		clk_out<= a7;
		l1<='0';l2<='0';l3<='0';l4<='0';l5<='0';l6<='0';l7<='1';l8<='0';
	elsif s1 = '1' and s2 = '1' and s3 = '1' and s4 = '1' and s5 = '1' and s6 = '1' then
		clk_out<= a6;
	   l1<='0';l2<='0';l3<='0';l4<='0';l5<='0';l6<='1';l7<='0';l8<='0';
	elsif s1 = '1' and s2 = '1' and s3 = '1' and s4 = '1' and s5 = '1' then
		clk_out<= a5;
		l1<='0';l2<='0';l3<='0';l4<='0';l5<='1';l6<='0';l7<='0';l8<='0';
	elsif s1 = '1' and s2 = '1' and s3 = '1' and s4 = '1' then  
		clk_out<= a4;
		l1<='0';l2<='0';l3<='0';l4<='1';l5<='0';l6<='0';l7<='0';l8<='0';
	elsif s1 = '1' and s2 = '1' and s3 = '1' then
		clk_out<= a3;
		l1<='0';l2<='0';l3<='1';l4<='0';l5<='0';l6<='0';l7<='0';l8<='0';
	elsif s1 = '1' and s2 = '1' then 
		clk_out<= a2;
		l1<='0';l2<='1';l3<='0';l4<='0';l5<='0';l6<='0';l7<='0';l8<='0';
	elsif s1 = '1' then
		clk_out<= a1;
		l1<='1';l2<='0';l3<='0';l4<='0';l5<='0';l6<='0';l7<='0';l8<='0';

	end if;
	
	end process;
	
	
end bhv;
	
	