library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;
use work.defs.all;

entity instruction_fetch_pipe is
    Port 
        ( instructions_in               : in    STD_LOGIC_VECTOR (31 downto 0)
        ; instructions_out              : out   STD_LOGIC_VECTOR (31 downto 0)
        ; program_counter_pluss_one_in  : in    addr_t
        ; program_counter_pluss_one_out : out   addr_t
        ; reset                         : in    std_logic
        ; clk                           : in    std_logic
        );
           
end instruction_fetch_pipe;

architecture Behavioral of instruction_fetch_pipe is

begin

    process(reset, clk)
    begin
        if reset = '1' then
            instructions_out                <= (others => '0');
            program_counter_pluss_one_out   <= (others => '0');
        elsif rising_edge(clk) then
            instructions_out                <= instructions_in;
            program_counter_pluss_one_out   <= program_counter_pluss_one_in;
        end if;
        
    end process;
end Behavioral;
