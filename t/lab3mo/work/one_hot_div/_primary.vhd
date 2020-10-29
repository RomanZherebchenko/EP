library verilog;
use verilog.vl_types.all;
entity one_hot_div is
    generic(
        N               : integer := 7
    );
    port(
        CLOCK_50        : in     vl_logic;
        KEY             : in     vl_logic_vector(1 downto 0);
        GPIO_0          : out    vl_logic_vector(35 downto 0)
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of N : constant is 1;
end one_hot_div;
