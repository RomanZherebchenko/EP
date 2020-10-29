library verilog;
use verilog.vl_types.all;
entity testbench is
    generic(
        PERIOD          : integer := 20;
        DIV_BY          : integer := 7
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of PERIOD : constant is 1;
    attribute mti_svvh_generic_type of DIV_BY : constant is 1;
end testbench;
