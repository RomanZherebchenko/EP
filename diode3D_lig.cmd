


#header
environment (title : "Diode", save : true, grid : true, debug : false, check1d : false, analytical : false, simulator : sprocess, mask : Struct {
}, region : "SIM3D", coordinate_shift : true, output : @diode@, node : "@node@", side : front, graphics : false, depth : 5 um, user_grid : default, grid_refinement : Struct {
  dios : "repl(cont(maxtrl=5,RefineGradient=-6,RefineMaximum=0,RefineJunction=-6,RefineBoundary=-6))";
}, tsuprem4_delta_vertical : 0.5 um, tsuprem4_delta_horizontal : 0.5 um, tsuprem4_min_vertical : 0.1 um, tsuprem4_min_horizontal : 0.1 um);
substrate (dopant : "boron", concentration : 1e16 /cm3);
comment (text : "Added process flow header");
#endheader
deposit (material : "Oxide", thickness : 3000 angstr, dopant : "phosphorus", concentration : 5e21 /cm3);
anneal (time : 60 min);
pattern (layer : "M1", polarity : dark_field, thickness : 1 um);
etch (material : "Oxide", etch_type : anisotropic);
etch (material : "Photoresist", etch_type : strip);
deposit (material : "Aluminum", thickness : 2500 angstr);
pattern (layer : "M2", polarity : light_field, thickness : 1 um);
etch (material : "Aluminum", etch_type : anisotropic, overetch : 10);
etch (material : "Photoresist", etch_type : strip);


