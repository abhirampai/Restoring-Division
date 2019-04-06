library IEEE;
use IEEE.std_logic_1164.all;
library ieee;
    use ieee.std_logic_1164.all;
   use ieee.numeric_std.all;
    use ieee.std_logic_unsigned.all;
   
    entity Boot is
        port(x, y: in std_logic_vector(4 downto 0);
             O: out std_logic_vector(4 downto 0);
             c: out std_logic_vector(4 downto 0));
    end Boot;
   
    architecture boot of Boot is
        begin
           
            process(x, y)
             variable a: std_logic_vector(4 downto 0);
             variable s,p,q : std_logic_vector(4 downto 0);
             variable i:integer;


                begin
                    a := "00000";
                    s := x;
                    q(4 downto 0):=y;
                   -- a(5 downto 1) := x;
                   
                    for i in 0 to 4 loop
                       if(q(4) = '1') then
                          p := a;
                          a(4 downto 0) := (p - s);
                        if(a(4)='1') then
                        	p :=a;
                        	a(4 downto 0) := (p+s);
                            q(0):='0';
                          
                         else
                         	q(0):='1';
                       end if;
                       end if;
                      
                      a(4 downto 1) := a(3 downto 0);
                        	a(0) := q(4);
                       		q(4 downto 1):=q(3 downto 0);

                       
      					               
                    end loop;
                    
                    O(4 downto 0) <= a(4 downto 0);
      				c(4 downto 0) <= q(4 downto 0);
                   
                end process;
               
            end boot;
