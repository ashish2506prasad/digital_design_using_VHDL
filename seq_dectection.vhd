library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity word_detection is
port( inp:in std_logic_vector(4 downto 0);
      reset,clock:in std_logic;
      outp: out std_logic);
end word_detection;

architecture bhv of word_detection is
type state1 is (rst1,a1,a2,a3);
type state2 is (rst2,b1,b2,b3);
type state3 is (rst3,c1,c2);

signal y_present1,y_next1: state1:=rst1;
signal y_present2,y_next2: state2:=rst2;
signal y_present3,y_next3: state3:=rst3;

signal outp1,outp2,outp3: std_logic;


begin
	clock_proc:process(clock,reset)
	begin
	if(clock='1' and clock' event) then
		if(reset='1') then
			y_present1<=rst1;
			y_present2<=rst2;
			y_present3<=rst3;
		else
			y_present1<=y_next1;
			y_present2<=y_next2;
			y_present3<=y_next3;
		end if;
	end if;
	end process;
	
	state_transition_proc_bomb:process(inp,y_present1)
	begin
		case y_present1 is
		when rst1=>
			if(unsigned(inp)= 2) then --b has been detected
				y_next1<= a1; -- Fill the code here
			else
				y_next1 <= y_present1;
			end if;
		when a1=> 
			if(unsigned(inp)= 15) then --0 has been detected
				y_next1<= a2; -- Fill the code here
			else
				y_next1<= y_present1;
			end if;
		when a2=> 
			if(unsigned(inp)= 13) then --m has been detected
				y_next1<= a3; -- Fill the code here
			else
				y_next1 <= y_present1;
			end if;
		when a3=> 
			if(unsigned(inp)= 2) then --b has been detected
				y_next1<= rst1; -- Fill the code here
			else
				y_next1 <= y_present1;
			end if;
		end case;
	end process;

state_transition_proc_roam:process(inp,y_present2)
	begin
		case y_present2 is
		when rst2=>
			if(unsigned(inp)= 18) then --r has been detected
				y_next2<= b1; -- Fill the code here
			else
				y_next2 <= y_present2;
			end if;
		when b1=> 
			if(unsigned(inp)= 15) then --o has been detected
				y_next2<= b2; -- Fill the code here
			else
				y_next2<= y_present2;
			end if;
		when b2=> 
			if(unsigned(inp)= 1) then --a has been detected
				y_next2<= b3; -- Fill the code here
			else
				y_next2<= y_present2;
			end if;
		when b3=> 
			if(unsigned(inp)= 13) then --m has been detected
				y_next2<= rst2; -- Fill the code here
			else
				y_next2 <= y_present2;	
			end if;
		end case;
	end process;
state_transition_proc_gun:process(inp,y_present3)
	begin
		case y_present3 is
		when rst3=>
			if(unsigned(inp)= 7) then --g has been detected
				y_next3<= c1; -- Fill the code here
			else
				y_next3 <= y_present3;
				end if;
		when c1=> 
			if(unsigned(inp)= 21) then --u has been detected
				y_next3<= c2; -- Fill the code here
			else
				y_next3<= y_present3;
			end if;
		when c2=> 
			if(unsigned(inp)= 14) then --n has been detected
				y_next3<= rst3; -- Fill the code here
			else
				y_next3 <= y_present3;
			end if;
		end case;
	end process;

	output_proc_bomb:process(y_present1, inp) ------- output process after this which will give
	begin
	case y_present1 is
		when rst1=>
		outp1<='0';
		when a1=>
		outp1<='0';
		when a2=>
		outp1<='0';
		when a3 =>
		if ( unsigned(inp)=2) then
			outp1<='1';
		else 
			outp1<='0';
		end if ;
	end case;
	end process;
		
	output_proc_roam:process(y_present2, inp) ------- output process after this which will give
	begin
	case y_present2 is
		when rst2=>
		outp2<='0';
		when b1 =>
		outp2<='0';
		when b2 =>
		outp2<='0';
		when b3 =>
		if ( unsigned(inp)=13) then
			outp2<='1';
		else 
			outp2<='0';
		end if; 
	end case;
	end process;
		
	output_proc_gun:process(y_present3, inp) ------- output process after this which will give
	begin
	case y_present3 is
		when rst3=>
		outp3<='0';
		when c1=>
		outp3<='0';
		when c2 =>
		if ( unsigned(inp)=14) then
			outp3<='1';
		else 
			outp3<='0';
		end if; 
	end case;
	end process;

outp<= outp1 or outp2 or outp3;	
end architecture;
		