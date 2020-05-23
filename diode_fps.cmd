set sim_left 0
set sim_right 1.5
set sim_bottom 5
set sim_top 0
set intersections_M1 { {0.0 1.0} }
set intersections_M2 { {0.0 1.5} }
## -----------------------------------##
## --------  LIGAMENT OUTPUT  --------##
## -----------------------------------##
## ------ Ligament defined grid ------##
## -----------------------------------##
line y loc=0 spa=0.3 tag=left
line y loc=1.5 spa=0.3 tag=right
line x loc=0 spa=0.25 tag=top
line x loc=5 tag=bottom
region Silicon xlo=top xhi=bottom ylo=left yhi=right
init concentration=1e16 field=Boron wafer.orient=100  slice.angle=[CutLine2D 0 0 1.5 0]

## ------------------------------------
## ---- Added process flow header -----
## ------------------------------------
deposit material = {Oxide} type = isotropic  Phosphorus conc=5e21 rate = {1.0} time=0.3
temp_ramp name=tempramp_1_2 time=60 temp=900 
diffuse temp_ramp=tempramp_1_2 
mask name=mask_1_2 segments = {1.0 1.6 } negative
photo mask=mask_1_2 thickness=1
etch material = {Oxide} type=anisotropic rate = {10.0} time=1 
strip Photoresist 
deposit material = {Aluminum} type = isotropic  rate = {1.0} time=0.25
mask name=mask_1_3 segments = {-0.1 1.6 } negative
photo mask=mask_1_3 thickness=1
etch material = {Aluminum} type=anisotropic rate = {10.0} time=1.1 
strip Photoresist 
struct smesh=@diode@
exit



