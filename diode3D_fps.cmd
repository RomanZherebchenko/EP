set sim_left 2
set sim_right 2.4
set sim_bottom 5
set sim_top 0
set sim_front 2
set sim_back 3.5
## -----------------------------------##
## --------  LIGAMENT OUTPUT  --------##
## -----------------------------------##
## ------ Ligament defined grid ------##
## -----------------------------------##
line y loc=2 spa=0.3 tag=left
line y loc=2.4 spa=0.3 tag=right
line x loc=0 spa=0.25 tag=top
line x loc=5 tag=bottom
line z loc=2 spa=0.08 tag=front
line z loc=3.5 spa=0.08 tag=back
region Silicon xlo=top xhi=bottom ylo=left yhi=right zlo=front zhi=back
init concentration=1e16 field=Boron wafer.orient=100 

## ------------------------------------
## ---- Added process flow header -----
## ------------------------------------
deposit material = {Oxide} type = isotropic  Phosphorus conc=5e21 rate = {1.0} time=0.3
temp_ramp name=tempramp_1_2 time=60 temp=900 
diffuse temp_ramp=tempramp_1_2 
mask layoutfile=diode3D.lyt
photo mask=M1 thickness=1
etch material = {Oxide} type=anisotropic rate = {10.0} time=1 
strip Photoresist 
deposit material = {Aluminum} type = isotropic  rate = {1.0} time=0.25
mask name=M2 negative
photo mask=M2 thickness=1
etch material = {Aluminum} type=anisotropic rate = {10.0} time=1.1 
strip Photoresist 
struct smesh=@diode@
exit



