library ieee;
use ieee.std_logic_1164.all;
library work;

entity not_2 is 
  port( x: in std_logic; y: out std_logic);
end not_2;

architecture abcx of not_2 is 
begin
  y <= not x;
end abcx;
------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;

entity and_2 is 
  port( a1, b1: in std_logic; c1: out std_logic);
end and_2;

architecture abc1 of and_2 is 
begin
  c1 <= a1 and b1;
end abc1;
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;

entity or_2 is 
  port( a2, b2: in std_logic; c2: out std_logic);
end or_2;

architecture abc2 of or_2 is 
begin
  c2 <= a2 or b2;
end abc2;
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;

entity xor_2 is 
  port( a3, b3: in std_logic; c3: out std_logic);
end xor_2;

architecture abc3 of xor_2 is 
begin
  c3 <= a3 xor b3;
end abc3;
--------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;

entity f_adder is
	port (a4, b4, c4: in std_logic; sum, carry: out std_logic);
end entity f_adder;

architecture abc4 of f_adder is
--componets
component and_2 is 
	port( a1, b1: in std_logic; c1: out std_logic);
end component and_2;
----------------
component or_2 is 
	port( a2, b2: in std_logic; c2: out std_logic);
end component or_2;
---------------
component xor_2 is 
	port( a3, b3: in std_logic; c3: out std_logic);
end component xor_2;
---------------------------
signal s1,s2,s3: std_logic;
begin
	link1: xor_2 port map (a4,b4,s1);
	link2: and_2 port map (a4,b4,s2);
	link3: and_2 port map (s1,c4,s3);
	link4: xor_2 port map (s1,c4,sum);
	link5: or_2 port map (s2,s3,carry);
end architecture abc4;

---------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
library work;

entity adder_subtractor is 
	port( a3,a2,a1,a0,b3,b2,b1,b0,m: in std_logic;
	      s3,s2,s1,s0,cout: out std_logic);
end entity adder_subtractor;

architecture abcd5 of adder_subtractor is
--components
component xor_2 is 
	port( a3, b3: in std_logic; c3: out std_logic);
end component xor_2;
---------------------------
component f_adder is 
	 port (a4, b4, c4: in std_logic; sum, carry: out std_logic);
end component f_adder;
---------------------------
signal x1,x2,x3,y1,y2,y3,y4: std_logic;

begin
	limk1: xor_2 port map (m,b0,y1);
	limk2: xor_2 port map (m,b1,y2);
	limk3: xor_2 port map (m,b2,y3);
	limk4: xor_2 port map (m,b3,y4);
	limk5: f_adder port map (y1,a0,m,s0,x1);
	limk6: f_adder port map (y2,a1,x1,s1,x2);
	limk7: f_adder port map (y3,a2,x2,s2,x3);
	limk8: f_adder port map (y4,a3,x3,s3,cout);
end architecture abcd5;
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------
---------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
library work;

entity subtractor is
	port(A3,A2,A1,A0,B3,B2,B1,B0: in std_logic;
	     sign,S3,S2,S1,S0: out std_logic);
end entity subtractor;

architecture pqrs of subtractor is
--component
component not_2 is 
  port( x: in std_logic; y: out std_logic);
end component not_2;
component adder_subtractor is 
	port( a3,a2,a1,a0,b3,b2,b1,b0,m: in std_logic;
	      s3,s2,s1,s0,cout: out std_logic);
end component adder_subtractor;
component and_2 is 
	port( a1, b1: in std_logic; c1: out std_logic);
end component and_2;
----------------
component or_2 is 
	port( a2, b2: in std_logic; c2: out std_logic);
end component or_2;
----------------
signal ss3,ss2,ss1,ss0,l,m,n,o,ayush,ashish,x3,x2,x1,x0,y3,y2,y1,y0,cout1,cout2,s_sign: std_logic;

begin
	limmk1: adder_subtractor port map ('1','0','1','0',B3,B2,B1,B0,'1',ss3,ss2,ss1,ss0,cout1);
	limmk2: adder_subtractor port map (A3,A2,A1,A0,ss3,ss2,ss1,ss0,'0',x3,x2,x1,x0,l);
	limmk3: and_2 port map (x3,x2,m);
	limmk4: and_2 port map (x3,x1,n);
	limmk5: or_2 port map (l,m,ayush);
	limmk6: or_2 port map (ayush,n,o);
	limmk7: adder_subtractor port map ('0',o,o,'0',x3,x2,x1,x0,'0',y3,y2,y1,y0,cout2);
	limmk8: not_2 port map (o,s_sign);
	limmk9: adder_subtractor port map (s_sign,'0',s_sign,'0',y3,y2,y1,y0,s_sign,S3,S2,S1,S0,ashish);
	limmk10: sign<=s_sign;
end architecture pqrs;
---------------------------------------------















