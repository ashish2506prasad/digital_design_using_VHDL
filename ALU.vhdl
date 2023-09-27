library ieee;
use ieee.std_logic_1164.all;

entity alu_beh is
	generic(operand_width : integer:=4);
	port (A: in std_logic_vector(3 downto 0);
		   B: in std_logic_vector(3 downto 0);
		   op: out std_logic_vector(5 downto 0)) ;
end alu_beh;

architecture a1 of alu_beh is

   --- function for addition
	function add(A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
	variable sum: std_logic_vector(operand_width-1 downto 0);
	variable carry: std_logic_vector(operand_width downto 1); -- Declare "sum" and "carry" variable
	-- you can use aggregate to initialize the variables as shown below
	-- variable variable_name : std_logic_vector(3 downto 0) := (others => '0');
	begin
		addition: for i in 0 to 3 loop
			abc : if i=0 then
				sum(i) := A(i) xor B(i);
				carry(i+1) := A(i) and B(i);
			else 
				sum(i) := A(i) xor B(i) xor carry(i);
				carry(i+1) := (A(i) and B(i)) or (carry(i) and A(i)) or (carry(i) and B(i)) ;
			end if abc;
		end loop addition;
	return carry(4) & sum ;
	end add;
	-----------------------------------------------------------------------
	
	---funtion for AND
	function BIT_AND (A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
	variable bitwise_and: std_logic_vector(operand_width-1 downto 0);
	-- you can use aggregate to initialize the variables as shown below
	-- variable variable_name : std_logic_vector(3 downto 0) := (others => '0');
	begin
		bit_and_2: for i in 0 to operand_width-1 loop
		bitwise_and(i) := A(i) and B(i);	
		end loop bit_and_2;
	return bitwise_and;
	end BIT_AND;
	-----------------------------------------------------------------------
	
	---funtion for max
	function maximum (A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
	--variable max: std_logic_vector(operand_width-1 downto 0)
	-- you can use aggregate to initialize the variables as shown below
	variable max : std_logic_vector(3 downto 0) := (others => '0');
	begin
		abc: if A > B then
			 return A;
		elsif B > A then
			return B;
	   else 
			 return max;
		end if abc;
	end maximum;
	------------------------------------------------------------------------
	
	
	---funtion for Eq(A,B)
	function Eq (A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
	-- you can use aggregate to initialize the variables as shown below
	variable a_not_equals_b : std_logic_vector(3 downto 0) := (others => '0');
	begin
		multiply: for i in 0 to operand_width-1 loop
			abc : if A = B then
				return A;
			else 
				return a_not_equals_b;
			end if abc;
		end loop multiply;
	end Eq;
	------------------------------------------------------------------------
	
	
	--funtion for A*3
	function A3 (A: in std_logic_vector(operand_width-1 downto 0);
	B: in std_logic_vector(operand_width-1 downto 0))
	return std_logic_vector is
	-- you can use aggregate to initialize the variables as shown below
	variable  a_1: std_logic_vector(5 downto 0) := (others => '0');
	variable  b_1: std_logic_vector(5 downto 0) := (others => '0');
	begin
			a_1 := '0' & add(A,A);
			b_1 := '0' & add( a_1(3 downto 0) , A);
			b_1(5) := a_1(4) and b_1(4);
			b_1(4) := a_1(4) xor b_1(4);
		--end loop product;
		return b_1;
	end A3;
	------------------------------------------------------------------------
	
	
	begin
		alu : process( A, B)
		variable sel : std_logic_vector(1 downto 0);
		--sel := A(3) & B(3);
		
		begin
			-- complete VHDL code for various outputs of ALU based on select lines
			sel := A(3) & B(3);
			case sel is
				when "00" =>
					op <= "00" & maximum(A,B); 
				when "01" =>
					op <= "00" & BIT_AND(A,B); 
				when "10" =>
					op <= A3(A,B); 
				when "11" =>
					op <= "00" & Eq(A,B); 
				when others => 
				   op <= "000000";
				end case;	
	end process ; -- alu
end a1 ; -- a1