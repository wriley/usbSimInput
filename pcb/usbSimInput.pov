//POVRay-File created by 3d41.ulp v20110101
//C:/Users/Computer User/Documents/svn/usbSimInput/pcb/usbSimInput.brd
//1/24/2012 9:16:25 PM

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = off;

#local cam_x = 0;
#local cam_y = 250;
#local cam_z = 0;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = 0;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 24;
#local lgt1_pos_y = 37;
#local lgt1_pos_z = 33;
#local lgt1_intense = 0.759599;
#local lgt2_pos_x = -24;
#local lgt2_pos_y = 37;
#local lgt2_pos_z = 33;
#local lgt2_intense = 0.759599;
#local lgt3_pos_x = 24;
#local lgt3_pos_y = 37;
#local lgt3_pos_z = -22;
#local lgt3_intense = 0.759599;
#local lgt4_pos_x = -24;
#local lgt4_pos_y = 37;
#local lgt4_pos_z = -22;
#local lgt4_intense = 0.759599;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 65.710000;
#declare pcb_y_size = 63.490000;
#declare pcb_layer1_used = 0;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(21);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//right 1.77*x
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-32.855000,0,-31.745000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro USBSIMINPUT(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,8
<0.000000,0.000000><65.710000,0.000000>
<65.710000,0.000000><65.710000,63.490000>
<65.710000,63.490000><0.000000,63.490000>
<0.000000,63.490000><0.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
cylinder{<3.810000,1,3.810000><3.810000,-5,3.810000>1.651000 texture{col_hls}}
cylinder{<3.810000,1,59.690000><3.810000,-5,59.690000>1.651000 texture{col_hls}}
cylinder{<62.230000,1,59.690000><62.230000,-5,59.690000>1.651000 texture{col_hls}}
cylinder{<62.230000,1,3.810000><62.230000,-5,3.810000>1.651000 texture{col_hls}}
//Holes(real)/Board
//Holes(real)/Vias
cylinder{<5.080000,0.095000,9.220000><5.080000,-1.595000,9.220000>1.150000 texture{col_hls}}
cylinder{<5.080000,0.095000,21.260000><5.080000,-1.595000,21.260000>1.150000 texture{col_hls}}
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
//MPD-File
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_DIS_ELKO_2MM5_5MM("10uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<19.050000,0.000000,6.350000>}#end		//Elko 2,5mm Pitch, 5mm  Diameter, 11,2mm High C1 10uF E2,5-5
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_DIS_CERAMIC_25MM_44MM("15pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<17.780000,0.000000,24.130000>}#end		//ceramic disc capacitator C2 15pF C025-024X044
#ifndef(pack_C3) #declare global_pack_C3=yes; object {CAP_DIS_CERAMIC_25MM_44MM("15pF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<22.860000,0.000000,24.130000>}#end		//ceramic disc capacitator C3 15pF C025-024X044
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<46.990000,0.000000,35.560000>}#end		//ceramic disc capacitator C4 0.1uF C050-025X075
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_DIS_CERAMIC_50MM_76MM("0.1uF",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<22.860000,0.000000,34.290000>}#end		//ceramic disc capacitator C5 0.1uF C050-025X075
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_DIS_DO34_050MM_H("3.3V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<13.970000,0.000000,7.620000>}#end		//Diode DO34 5mm hor. D1 3.3V ZDIO-5
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_DIS_DO34_050MM_H("3.3V",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<10.160000,0.000000,31.750000>}#end		//Diode DO34 5mm hor. D2 3.3V ZDIO-5
#ifndef(pack_J1) #declare global_pack_J1=yes; object {CON_USB_B_001()translate<-10.3,0,0> rotate<0,-90,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<5.080000,0.000000,15.240000>}#end		//USB-B Stecker J1  PN61729-S
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_DIS_WS10G()translate<0,0,0> rotate<0,180.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<7.620000,0.000000,45.720000>}#end		//Shrouded Header 10Pin JP1  ML10
#ifndef(pack_JP2) #declare global_pack_JP2=yes; object {CON_PH_2X20()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<57.150000,0.000000,31.750000>}#end		//Header 2,54mm Grid 20Pin 2Row (jumper.lib) JP2  MA20-2
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_DIS_0207_075MM(texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<10.160000,0.000000,24.130000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R1 2K2 0207/7
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_DIS_0207_075MM(texture{pigment{Yellow}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Violet*1.2}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.350000,0.000000,30.480000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R2 4K7 0207/7
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_DIS_0207_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,44.450000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R3 330 0207/7
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_DIS_0207_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,36.830000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R4 330 0207/7
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_DIS_0207_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,39.370000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R5 330 0207/7
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_DIS_0207_075MM(texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Orange}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{DarkBrown}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,41.910000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R6 330 0207/7
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_DIS_0207_075MM(texture{pigment{Gray45}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.780000,0.000000,15.240000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R7 82 0207/7
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_DIS_0207_075MM(texture{pigment{Gray45}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Red*0.7}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture{pigment{Black}finish{phong 0.2 ambient (0.1 * global_ambient_mul)}},texture {T_Gold_5C finish{reflection 0.1}},)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<17.780000,0.000000,12.700000>}#end		//Discrete Resistor 0,3W 7,5MM Grid R8 82 0207/7
#ifndef(pack_U1) #declare global_pack_U1=yes; object {IC_DIS_DIP40_W("MEGA16-P","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<35.560000,0.000000,33.020000>translate<0,3.000000,0> }#end		//DIP40 U1 MEGA16-P DIL40
#ifndef(pack_U1) object{SOCKET_DIP40W()rotate<0,-270.000000,0> rotate<0,0,0> translate<35.560000,0.000000,33.020000>}#end					//IC-Sockel 40Pin 600mil U1 MEGA16-P
#ifndef(pack_X1) #declare global_pack_X1=yes; object {SPC_XTAL_5MM("12MHz",3,)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<20.320000,0.000000,19.050000>}#end		//Quarz 4,9MM X1 12MHz HC49U-V
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_C1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.600200,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<19.050000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<17.780000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_C3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<22.860000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.990000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_C4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<46.990000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<20.320000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_C5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<25.400000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,5.080000> texture{col_thl}}
#ifndef(global_pack_D1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<13.970000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_D2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<10.160000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<9.790000,0,13.990000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<9.790000,0,16.490000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.790000,0,16.490000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.458000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<7.790000,0,13.990000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.316000,2.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.080000,0,21.260000> texture{col_thl}}
#ifndef(global_pack_J1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(3.316000,2.300000,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<5.080000,0,9.220000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<6.350000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.914400,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<8.890000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,55.880000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,53.340000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,48.260000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,38.100000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,35.560000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,33.020000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,22.860000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,20.320000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,17.780000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,10.160000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<55.880000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_JP2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.524000,1.016000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<58.420000,0,7.620000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<6.350000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<13.970000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.350000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_R2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<6.350000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<16.510000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_R6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-0.000000,0>translate<24.130000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.590000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R7) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,15.240000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<21.590000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_R8) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<13.970000,0,12.700000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,57.150000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,49.530000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<27.940000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,46.990000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,49.530000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,52.070000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,54.610000> texture{col_thl}}
#ifndef(global_pack_U1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,3+global_tmp,100) rotate<0,-0.000000,0>translate<43.180000,0,57.150000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<17.907000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_X1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,1+global_tmp,0) rotate<0,-0.000000,0>translate<22.733000,0,19.050000> texture{col_thl}}
//Pads/Vias
#end
#if(pcb_wires=on)
union{
//Signals
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,9.220000>}
box{<0,0,-0.127000><0.178000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.080000,-1.535000,9.220000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,11.684000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.080000,-1.535000,9.398000> }
}cylinder{<5.080000,1,9.220000><5.080000,-2.500000,9.220000>1.150000 texture{col_thl}}}
difference{union{
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,21.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,24.638000>}
box{<0,0,-0.127000><3.378000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.080000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,21.260000>}
box{<0,0,-0.127000><4.496000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.080000,-1.535000,21.260000> }
}cylinder{<5.080000,1,21.260000><5.080000,-2.500000,21.260000>1.150000 texture{col_thl}}}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,-1.535000,50.292000>}
box{<0,0,-0.127000><9.144000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.064000,-1.535000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.572000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.572000,-1.535000,48.260000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.572000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,33.528000>}
box{<0,0,-0.127000><6.604000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.080000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,40.132000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<4.064000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,42.672000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.080000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,45.212000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.080000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<5.080000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,45.212000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<5.080000,-1.535000,45.212000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.572000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,49.530000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.572000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,24.130000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.350000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,25.908000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.080000,-1.535000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,26.670000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.350000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,32.258000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,26.670000>}
box{<0,0,-0.127000><5.588000,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.350000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,32.258000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<5.080000,-1.535000,33.528000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.350000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.572000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,40.640000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<4.572000,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,48.260000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.080000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,-1.535000,50.292000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,52.578000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.064000,-1.535000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,-1.535000,17.018000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.604000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.842000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.842000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,-1.535000,16.002000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<6.604000,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,17.780000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.604000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,11.938000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.366000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,13.970000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.620000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,14.224000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<5.080000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,17.780000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.366000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<6.350000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<6.350000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.350000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.790000,-1.535000,13.990000>}
box{<0,0,-0.127000><0.171172,0.035000,0.127000> rotate<0,-6.709394,0> translate<7.620000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.790000,-1.535000,13.990000>}
box{<0,0,-0.127000><0.289233,0.035000,0.127000> rotate<0,53.998191,0> translate<7.620000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.790000,-1.535000,16.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,16.256000>}
box{<0,0,-0.127000><0.248620,0.035000,0.127000> rotate<0,70.248527,0> translate<7.790000,-1.535000,16.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.128000,-1.535000,40.640000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<6.858000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.128000,-1.535000,43.180000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<6.858000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,16.256000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.874000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.366000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.128000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,40.640000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.128000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.128000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,43.180000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.128000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,45.720000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.890000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,48.260000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.350000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<8.382000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.620000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.620000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.842000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,49.530000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.842000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.620000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,14.224000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<8.636000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,14.224000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.790000,-1.535000,13.990000>}
box{<0,0,-0.127000><0.271662,0.035000,0.127000> rotate<0,59.466369,0> translate<9.652000,-1.535000,14.224000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,12.700000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<9.906000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.790000,-1.535000,13.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,13.970000>}
box{<0,0,-0.127000><0.117712,0.035000,0.127000> rotate<0,9.781761,0> translate<9.790000,-1.535000,13.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.790000,-1.535000,16.490000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,16.510000>}
box{<0,0,-0.127000><0.117712,0.035000,0.127000> rotate<0,-9.781761,0> translate<9.790000,-1.535000,16.490000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,52.578000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.350000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,28.956000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.350000,-1.535000,25.146000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,29.210000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<6.350000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,29.210000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.160000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,35.052000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,34.290000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.160000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.080000,-1.535000,40.132000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,35.052000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,44.997030,0> translate<5.080000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,35.052000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.160000,-1.535000,35.052000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<8.890000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,48.768000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,48.260000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.160000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,48.768000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<9.398000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.398000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.668000,-1.535000,28.956000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.160000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<9.906000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.938000,-1.535000,39.370000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<9.398000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,40.640000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<9.398000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,5.080000>}
box{<0,0,-0.127000><9.339466,0.035000,0.127000> rotate<0,44.997030,0> translate<7.366000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,8.636000>}
box{<0,0,-0.127000><5.747364,0.035000,0.127000> rotate<0,44.997030,0> translate<9.906000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,11.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,10.160000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.970000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.414000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,11.684000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,44.997030,0> translate<10.414000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,11.684000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.970000,-1.535000,11.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.176000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,15.240000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.176000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,15.240000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.970000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.620000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,24.130000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.620000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,-1.535000,7.620000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<13.970000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,23.876000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.970000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,23.876000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.240000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.668000,-1.535000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,24.384000>}
box{<0,0,-0.127000><6.465784,0.035000,0.127000> rotate<0,44.997030,0> translate<10.668000,-1.535000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,44.450000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,44.997030,0> translate<8.890000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,44.450000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.240000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,8.636000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,10.668000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.970000,-1.535000,8.636000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,10.668000>}
box{<0,0,-0.127000><19.304000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.002000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,-1.535000,43.180000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,23.114000>}
box{<0,0,-0.127000><11.176000,0.035000,0.127000> rotate<0,90.000000,0> translate<16.510000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,36.830000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.510000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.938000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,39.370000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,0.000000,0> translate<11.938000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.160000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,41.910000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,44.997030,0> translate<10.160000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,44.958000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,44.450000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<16.510000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.398000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,44.958000>}
box{<0,0,-0.127000><10.057887,0.035000,0.127000> rotate<0,44.997030,0> translate<9.398000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,40.640000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.208000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,43.180000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<16.256000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,19.050000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.780000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,24.384000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.510000,-1.535000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,25.400000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<17.780000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,39.116000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.510000,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,39.624000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,39.116000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.780000,-1.535000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,39.624000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<16.764000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,44.196000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<17.780000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,52.578000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,44.704000>}
box{<0,0,-0.127000><11.135518,0.035000,0.127000> rotate<0,44.997030,0> translate<9.906000,-1.535000,52.578000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.907000,-1.535000,19.050000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.780000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,5.080000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.970000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,7.620000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.986000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,24.130000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<17.780000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,6.350000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<19.050000,-1.535000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,8.128000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<16.510000,-1.535000,11.938000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,8.128000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.320000,-1.535000,8.128000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.002000,-1.535000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,34.290000>}
box{<0,0,-0.127000><6.106574,0.035000,0.127000> rotate<0,-44.997030,0> translate<16.002000,-1.535000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.764000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,39.624000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,44.997030,0> translate<16.764000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,39.624000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,90.000000,0> translate<20.320000,-1.535000,39.624000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<21.590000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.733000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,19.050000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<22.733000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,19.050000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.860000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,21.590000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.860000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,25.400000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<17.780000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,25.400000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,-90.000000,0> translate<22.860000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,55.880000>}
box{<0,0,-0.127000><15.240000,0.035000,0.127000> rotate<0,90.000000,0> translate<22.860000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<19.050000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.114000,-1.535000,24.130000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,0.000000,0> translate<19.050000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<20.320000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,-1.535000,34.290000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<20.320000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<17.780000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,-1.535000,38.100000>}
box{<0,0,-0.127000><8.621046,0.035000,0.127000> rotate<0,44.997030,0> translate<17.780000,-1.535000,44.196000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.114000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,25.146000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.114000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,25.400000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<24.130000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<22.860000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.146000,-1.535000,35.560000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<23.876000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,-1.535000,57.912000>}
box{<0,0,-0.127000><13.462000,0.035000,0.127000> rotate<0,90.000000,0> translate<25.654000,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,20.828000>}
box{<0,0,-0.127000><6.465784,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.590000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,20.828000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.162000,-1.535000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,47.752000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<26.162000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,53.848000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,-90.000000,0> translate<26.162000,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.146000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,-1.535000,35.560000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.146000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.924000,-1.535000,45.720000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<26.162000,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<21.590000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,19.050000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,-44.997030,0> translate<21.590000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,21.590000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<27.940000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,24.130000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.162000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,26.670000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.860000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,29.210000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,-44.997030,0> translate<24.130000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,31.750000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.860000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.400000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,31.750000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<25.400000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.670000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<26.670000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,36.830000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,39.370000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<24.130000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,41.910000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<24.130000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,44.450000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<25.654000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,47.752000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,49.530000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.162000,-1.535000,47.752000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,52.070000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<26.162000,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<23.876000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,38.100000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<23.876000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.924000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,45.720000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<26.924000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<22.860000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,61.976000>}
box{<0,0,-0.127000><8.621046,0.035000,0.127000> rotate<0,-44.997030,0> translate<22.860000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,46.990000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.940000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<25.654000,-1.535000,57.912000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,61.468000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,-44.997030,0> translate<25.654000,-1.535000,57.912000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<26.162000,-1.535000,57.658000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464000,-1.535000,60.960000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,-44.997030,0> translate<26.162000,-1.535000,57.658000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,-1.535000,46.482000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<28.956000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,-1.535000,46.482000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,-90.000000,0> translate<29.718000,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.226000,-1.535000,44.196000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<27.940000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.226000,-1.535000,44.196000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.226000,-1.535000,46.482000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,90.000000,0> translate<30.226000,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,30.480000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<27.940000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,-1.535000,34.290000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<28.956000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.068000,-1.535000,54.610000>}
box{<0,0,-0.127000><8.128000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.940000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<27.940000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,57.150000>}
box{<0,0,-0.127000><9.906000,0.035000,0.127000> rotate<0,0.000000,0> translate<27.940000,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.878000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.878000,-1.535000,25.908000>}
box{<0,0,-0.127000><16.764000,0.035000,0.127000> rotate<0,90.000000,0> translate<39.878000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,23.876000>}
box{<0,0,-0.127000><14.478000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.386000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,19.304000>}
box{<0,0,-0.127000><7.874000,0.035000,0.127000> rotate<0,90.000000,0> translate<40.894000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,41.148000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,-90.000000,0> translate<40.894000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<37.846000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.148000,-1.535000,60.452000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,-44.997030,0> translate<37.846000,-1.535000,57.150000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,13.208000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,-90.000000,0> translate<41.402000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,42.672000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<41.402000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,55.372000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,90.000000,0> translate<41.402000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<36.068000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,59.944000>}
box{<0,0,-0.127000><7.543415,0.035000,0.127000> rotate<0,-44.997030,0> translate<36.068000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.656000,-1.535000,59.436000>}
box{<0,0,-0.127000><17.601302,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.210000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.718000,-1.535000,46.736000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,-1.535000,58.928000>}
box{<0,0,-0.127000><17.242092,0.035000,0.127000> rotate<0,-44.997030,0> translate<29.718000,-1.535000,46.736000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,7.620000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<40.386000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,10.160000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<40.894000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,17.018000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,17.780000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.402000,-1.535000,17.018000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,40.640000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<41.402000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,45.720000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.894000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,54.102000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,53.340000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<41.402000,-1.535000,54.102000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<30.226000,-1.535000,46.482000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,58.420000>}
box{<0,0,-0.127000><16.882882,0.035000,0.127000> rotate<0,-44.997030,0> translate<30.226000,-1.535000,46.482000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.878000,-1.535000,9.144000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,-1.535000,6.350000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,44.997030,0> translate<39.878000,-1.535000,9.144000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,-1.535000,39.370000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<40.894000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,11.430000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,44.997030,0> translate<41.402000,-1.535000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.894000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,21.590000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.894000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<40.386000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,26.670000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<40.386000,-1.535000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<39.878000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,29.210000>}
box{<0,0,-0.127000><4.669733,0.035000,0.127000> rotate<0,-44.997030,0> translate<39.878000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<32.766000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,34.290000>}
box{<0,0,-0.127000><10.414000,0.035000,0.127000> rotate<0,0.000000,0> translate<32.766000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,39.370000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.672000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,42.672000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,44.450000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.402000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,57.150000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.402000,-1.535000,55.372000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<31.750000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.196000,-1.535000,30.480000>}
box{<0,0,-0.127000><12.446000,0.035000,0.127000> rotate<0,0.000000,0> translate<31.750000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,58.420000>}
box{<0,0,-0.127000><2.286000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,-1.535000,34.290000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,-1.535000,58.928000>}
box{<0,0,-0.127000><4.064000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.910000,-1.535000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.196000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,-1.535000,27.940000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<44.196000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.720000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,-1.535000,33.020000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<45.720000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,-1.535000,52.070000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.656000,-1.535000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,59.436000>}
box{<0,0,-0.127000><5.588000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.656000,-1.535000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,54.610000>}
box{<0,0,-0.127000><4.318000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.752000,-1.535000,49.530000>}
box{<0,0,-0.127000><4.572000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.006000,-1.535000,53.340000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,36.830000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,36.830000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<46.990000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,45.720000>}
box{<0,0,-0.127000><6.858000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,46.990000>}
box{<0,0,-0.127000><6.350000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.292000,-1.535000,24.130000>}
box{<0,0,-0.127000><7.112000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.260000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,34.290000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<48.260000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.562000,-1.535000,40.640000>}
box{<0,0,-0.127000><9.398000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,-1.535000,16.510000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,-1.535000,41.910000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,-1.535000,13.970000>}
box{<0,0,-0.127000><9.652000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,-1.535000,19.050000>}
box{<0,0,-0.127000><9.652000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,17.780000>}
box{<0,0,-0.127000><11.176000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.402000,-1.535000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.356000,-1.535000,59.944000>}
box{<0,0,-0.127000><12.954000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.402000,-1.535000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.450000,-1.535000,58.420000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,48.260000>}
box{<0,0,-0.127000><14.368410,0.035000,0.127000> rotate<0,44.997030,0> translate<44.450000,-1.535000,58.420000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,52.832000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<54.610000,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.498000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.118000,-1.535000,46.990000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<47.498000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,11.430000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<52.832000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.832000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,16.510000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<52.832000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.292000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,19.050000>}
box{<0,0,-0.127000><7.184205,0.035000,0.127000> rotate<0,44.997030,0> translate<50.292000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.562000,-1.535000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,36.830000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<51.562000,-1.535000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.022000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,39.370000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,44.997030,0> translate<49.022000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.752000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,41.910000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<47.752000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.974000,-1.535000,58.928000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,49.530000>}
box{<0,0,-0.127000><13.290779,0.035000,0.127000> rotate<0,44.997030,0> translate<45.974000,-1.535000,58.928000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,52.832000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<54.610000,-1.535000,52.832000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,53.848000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,54.610000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<54.610000,-1.535000,53.848000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.006000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,-1.535000,45.720000>}
box{<0,0,-0.127000><10.776307,0.035000,0.127000> rotate<0,44.997030,0> translate<48.006000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.148000,-1.535000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,-1.535000,60.452000>}
box{<0,0,-0.127000><14.478000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.148000,-1.535000,60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,7.620000>}
box{<0,0,-0.127000><13.716000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.164000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,10.160000>}
box{<0,0,-0.127000><13.716000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.164000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,12.700000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<52.070000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<53.340000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,15.240000>}
box{<0,0,-0.127000><3.592102,0.035000,0.127000> rotate<0,44.997030,0> translate<53.340000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.736000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,27.940000>}
box{<0,0,-0.127000><9.144000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.736000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,33.020000>}
box{<0,0,-0.127000><8.890000,0.035000,0.127000> rotate<0,0.000000,0> translate<46.990000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.070000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,38.100000>}
box{<0,0,-0.127000><5.388154,0.035000,0.127000> rotate<0,44.997030,0> translate<52.070000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.530000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,40.640000>}
box{<0,0,-0.127000><8.980256,0.035000,0.127000> rotate<0,44.997030,0> translate<49.530000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,43.180000>}
box{<0,0,-0.127000><12.572359,0.035000,0.127000> rotate<0,44.997030,0> translate<46.990000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,-1.535000,45.720000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,45.720000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.626000,-1.535000,45.720000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.610000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,48.260000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<54.610000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.244000,-1.535000,59.436000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,50.800000>}
box{<0,0,-0.127000><12.213148,0.035000,0.127000> rotate<0,44.997030,0> translate<47.244000,-1.535000,59.436000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.464000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,60.960000>}
box{<0,0,-0.127000><26.416000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.464000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<29.210000,-1.535000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.134000,-1.535000,61.468000>}
box{<0,0,-0.127000><26.924000,0.035000,0.127000> rotate<0,0.000000,0> translate<29.210000,-1.535000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,11.430000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,36.830000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,49.530000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,54.610000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<28.956000,-1.535000,61.976000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,61.976000>}
box{<0,0,-0.127000><27.432000,0.035000,0.127000> rotate<0,0.000000,0> translate<28.956000,-1.535000,61.976000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.672000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,6.350000>}
box{<0,0,-0.127000><14.478000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.672000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,12.192000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.388000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,12.192000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.150000,-1.535000,12.192000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,37.592000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.388000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,37.592000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.150000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,40.132000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.388000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,40.132000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.150000,-1.535000,40.132000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.118000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,46.990000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.118000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,50.292000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<56.388000,-1.535000,49.530000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,51.308000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,50.292000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<57.150000,-1.535000,50.292000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,51.308000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<56.388000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<55.880000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,55.880000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,54.610000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<55.880000,-1.535000,55.880000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,53.340000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<56.388000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,41.148000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.912000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,7.620000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,15.240000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,27.940000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.880000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,33.020000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.880000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,40.640000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,43.180000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<57.150000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,45.720000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<57.150000,-1.535000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,48.260000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,-90.000000,0> translate<58.420000,-1.535000,48.260000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.658000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,53.340000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.658000,-1.535000,53.340000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<54.356000,-1.535000,59.944000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,55.880000>}
box{<0,0,-0.127000><5.747364,0.035000,0.127000> rotate<0,44.997030,0> translate<54.356000,-1.535000,59.944000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,16.510000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.372000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,19.050000>}
box{<0,0,-0.127000><3.556000,0.035000,0.127000> rotate<0,0.000000,0> translate<55.372000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,31.750000>}
box{<0,0,-0.127000><15.748000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.800000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,34.290000>}
box{<0,0,-0.127000><8.128000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.800000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.912000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,41.910000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.912000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,52.070000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.150000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<57.150000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,54.610000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<57.150000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,13.970000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,15.748000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<58.928000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,15.748000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.690000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,32.512000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.928000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,32.512000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,-90.000000,0> translate<59.690000,-1.535000,32.512000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,33.528000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<58.928000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,39.370000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,41.148000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<58.928000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,41.148000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.690000,-1.535000,41.148000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,54.610000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,55.372000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.928000,-1.535000,54.610000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.626000,-1.535000,60.452000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,56.388000>}
box{<0,0,-0.127000><5.747364,0.035000,0.127000> rotate<0,44.997030,0> translate<55.626000,-1.535000,60.452000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,55.372000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<59.690000,-1.535000,56.388000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<59.690000,-1.535000,56.388000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,11.938000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,17.780000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<58.928000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,11.938000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,17.780000>}
box{<0,0,-0.127000><5.842000,0.035000,0.127000> rotate<0,90.000000,0> translate<60.198000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.928000,-1.535000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,53.340000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.928000,-1.535000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<55.880000,-1.535000,60.960000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,56.642000>}
box{<0,0,-0.127000><6.106574,0.035000,0.127000> rotate<0,44.997030,0> translate<55.880000,-1.535000,60.960000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,53.340000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.198000,-1.535000,56.642000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,90.000000,0> translate<60.198000,-1.535000,56.642000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.706000,-1.535000,53.086000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.706000,-1.535000,56.896000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.706000,-1.535000,53.086000>}
box{<0,0,-0.127000><3.810000,0.035000,0.127000> rotate<0,-90.000000,0> translate<60.706000,-1.535000,53.086000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.134000,-1.535000,61.468000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<60.706000,-1.535000,56.896000>}
box{<0,0,-0.127000><6.465784,0.035000,0.127000> rotate<0,44.997030,0> translate<56.134000,-1.535000,61.468000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<58.420000,-1.535000,49.022000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.214000,-1.535000,51.816000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,-44.997030,0> translate<58.420000,-1.535000,49.022000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.214000,-1.535000,57.150000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.214000,-1.535000,51.816000>}
box{<0,0,-0.127000><5.334000,0.035000,0.127000> rotate<0,-90.000000,0> translate<61.214000,-1.535000,51.816000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<56.388000,-1.535000,61.976000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<61.214000,-1.535000,57.150000>}
box{<0,0,-0.127000><6.824995,0.035000,0.127000> rotate<0,44.997030,0> translate<56.388000,-1.535000,61.976000> }
//Text
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
texture{col_pol}
}
#end
union{
cylinder{<19.050000,0.038000,7.620000><19.050000,-1.538000,7.620000>0.406400}
cylinder{<19.050000,0.038000,5.080000><19.050000,-1.538000,5.080000>0.406400}
cylinder{<17.780000,0.038000,22.860000><17.780000,-1.538000,22.860000>0.406400}
cylinder{<17.780000,0.038000,25.400000><17.780000,-1.538000,25.400000>0.406400}
cylinder{<22.860000,0.038000,22.860000><22.860000,-1.538000,22.860000>0.406400}
cylinder{<22.860000,0.038000,25.400000><22.860000,-1.538000,25.400000>0.406400}
cylinder{<46.990000,0.038000,38.100000><46.990000,-1.538000,38.100000>0.406400}
cylinder{<46.990000,0.038000,33.020000><46.990000,-1.538000,33.020000>0.406400}
cylinder{<20.320000,0.038000,34.290000><20.320000,-1.538000,34.290000>0.406400}
cylinder{<25.400000,0.038000,34.290000><25.400000,-1.538000,34.290000>0.406400}
cylinder{<13.970000,0.038000,5.080000><13.970000,-1.538000,5.080000>0.406400}
cylinder{<13.970000,0.038000,10.160000><13.970000,-1.538000,10.160000>0.406400}
cylinder{<10.160000,0.038000,34.290000><10.160000,-1.538000,34.290000>0.406400}
cylinder{<10.160000,0.038000,29.210000><10.160000,-1.538000,29.210000>0.406400}
cylinder{<9.790000,0.038000,13.990000><9.790000,-1.538000,13.990000>0.475000}
cylinder{<9.790000,0.038000,16.490000><9.790000,-1.538000,16.490000>0.475000}
cylinder{<7.790000,0.038000,16.490000><7.790000,-1.538000,16.490000>0.475000}
cylinder{<7.790000,0.038000,13.990000><7.790000,-1.538000,13.990000>0.475000}
cylinder{<6.350000,0.038000,50.800000><6.350000,-1.538000,50.800000>0.457200}
cylinder{<8.890000,0.038000,50.800000><8.890000,-1.538000,50.800000>0.457200}
cylinder{<6.350000,0.038000,48.260000><6.350000,-1.538000,48.260000>0.457200}
cylinder{<8.890000,0.038000,48.260000><8.890000,-1.538000,48.260000>0.457200}
cylinder{<6.350000,0.038000,45.720000><6.350000,-1.538000,45.720000>0.457200}
cylinder{<8.890000,0.038000,45.720000><8.890000,-1.538000,45.720000>0.457200}
cylinder{<6.350000,0.038000,43.180000><6.350000,-1.538000,43.180000>0.457200}
cylinder{<8.890000,0.038000,43.180000><8.890000,-1.538000,43.180000>0.457200}
cylinder{<6.350000,0.038000,40.640000><6.350000,-1.538000,40.640000>0.457200}
cylinder{<8.890000,0.038000,40.640000><8.890000,-1.538000,40.640000>0.457200}
cylinder{<55.880000,0.038000,55.880000><55.880000,-1.538000,55.880000>0.508000}
cylinder{<58.420000,0.038000,55.880000><58.420000,-1.538000,55.880000>0.508000}
cylinder{<55.880000,0.038000,53.340000><55.880000,-1.538000,53.340000>0.508000}
cylinder{<58.420000,0.038000,53.340000><58.420000,-1.538000,53.340000>0.508000}
cylinder{<55.880000,0.038000,50.800000><55.880000,-1.538000,50.800000>0.508000}
cylinder{<58.420000,0.038000,50.800000><58.420000,-1.538000,50.800000>0.508000}
cylinder{<55.880000,0.038000,48.260000><55.880000,-1.538000,48.260000>0.508000}
cylinder{<58.420000,0.038000,48.260000><58.420000,-1.538000,48.260000>0.508000}
cylinder{<55.880000,0.038000,45.720000><55.880000,-1.538000,45.720000>0.508000}
cylinder{<58.420000,0.038000,45.720000><58.420000,-1.538000,45.720000>0.508000}
cylinder{<55.880000,0.038000,43.180000><55.880000,-1.538000,43.180000>0.508000}
cylinder{<58.420000,0.038000,43.180000><58.420000,-1.538000,43.180000>0.508000}
cylinder{<55.880000,0.038000,40.640000><55.880000,-1.538000,40.640000>0.508000}
cylinder{<58.420000,0.038000,40.640000><58.420000,-1.538000,40.640000>0.508000}
cylinder{<55.880000,0.038000,38.100000><55.880000,-1.538000,38.100000>0.508000}
cylinder{<58.420000,0.038000,38.100000><58.420000,-1.538000,38.100000>0.508000}
cylinder{<55.880000,0.038000,35.560000><55.880000,-1.538000,35.560000>0.508000}
cylinder{<58.420000,0.038000,35.560000><58.420000,-1.538000,35.560000>0.508000}
cylinder{<55.880000,0.038000,33.020000><55.880000,-1.538000,33.020000>0.508000}
cylinder{<58.420000,0.038000,33.020000><58.420000,-1.538000,33.020000>0.508000}
cylinder{<55.880000,0.038000,30.480000><55.880000,-1.538000,30.480000>0.508000}
cylinder{<58.420000,0.038000,30.480000><58.420000,-1.538000,30.480000>0.508000}
cylinder{<55.880000,0.038000,27.940000><55.880000,-1.538000,27.940000>0.508000}
cylinder{<58.420000,0.038000,27.940000><58.420000,-1.538000,27.940000>0.508000}
cylinder{<55.880000,0.038000,25.400000><55.880000,-1.538000,25.400000>0.508000}
cylinder{<58.420000,0.038000,25.400000><58.420000,-1.538000,25.400000>0.508000}
cylinder{<55.880000,0.038000,22.860000><55.880000,-1.538000,22.860000>0.508000}
cylinder{<58.420000,0.038000,22.860000><58.420000,-1.538000,22.860000>0.508000}
cylinder{<55.880000,0.038000,20.320000><55.880000,-1.538000,20.320000>0.508000}
cylinder{<58.420000,0.038000,20.320000><58.420000,-1.538000,20.320000>0.508000}
cylinder{<55.880000,0.038000,17.780000><55.880000,-1.538000,17.780000>0.508000}
cylinder{<58.420000,0.038000,17.780000><58.420000,-1.538000,17.780000>0.508000}
cylinder{<55.880000,0.038000,15.240000><55.880000,-1.538000,15.240000>0.508000}
cylinder{<58.420000,0.038000,15.240000><58.420000,-1.538000,15.240000>0.508000}
cylinder{<55.880000,0.038000,12.700000><55.880000,-1.538000,12.700000>0.508000}
cylinder{<58.420000,0.038000,12.700000><58.420000,-1.538000,12.700000>0.508000}
cylinder{<55.880000,0.038000,10.160000><55.880000,-1.538000,10.160000>0.508000}
cylinder{<58.420000,0.038000,10.160000><58.420000,-1.538000,10.160000>0.508000}
cylinder{<55.880000,0.038000,7.620000><55.880000,-1.538000,7.620000>0.508000}
cylinder{<58.420000,0.038000,7.620000><58.420000,-1.538000,7.620000>0.508000}
cylinder{<6.350000,0.038000,24.130000><6.350000,-1.538000,24.130000>0.406400}
cylinder{<13.970000,0.038000,24.130000><13.970000,-1.538000,24.130000>0.406400}
cylinder{<6.350000,0.038000,26.670000><6.350000,-1.538000,26.670000>0.406400}
cylinder{<6.350000,0.038000,34.290000><6.350000,-1.538000,34.290000>0.406400}
cylinder{<16.510000,0.038000,44.450000><16.510000,-1.538000,44.450000>0.406400}
cylinder{<24.130000,0.038000,44.450000><24.130000,-1.538000,44.450000>0.406400}
cylinder{<16.510000,0.038000,36.830000><16.510000,-1.538000,36.830000>0.406400}
cylinder{<24.130000,0.038000,36.830000><24.130000,-1.538000,36.830000>0.406400}
cylinder{<16.510000,0.038000,39.370000><16.510000,-1.538000,39.370000>0.406400}
cylinder{<24.130000,0.038000,39.370000><24.130000,-1.538000,39.370000>0.406400}
cylinder{<16.510000,0.038000,41.910000><16.510000,-1.538000,41.910000>0.406400}
cylinder{<24.130000,0.038000,41.910000><24.130000,-1.538000,41.910000>0.406400}
cylinder{<21.590000,0.038000,15.240000><21.590000,-1.538000,15.240000>0.406400}
cylinder{<13.970000,0.038000,15.240000><13.970000,-1.538000,15.240000>0.406400}
cylinder{<21.590000,0.038000,12.700000><21.590000,-1.538000,12.700000>0.406400}
cylinder{<13.970000,0.038000,12.700000><13.970000,-1.538000,12.700000>0.406400}
cylinder{<27.940000,0.038000,57.150000><27.940000,-1.538000,57.150000>0.406400}
cylinder{<27.940000,0.038000,54.610000><27.940000,-1.538000,54.610000>0.406400}
cylinder{<27.940000,0.038000,52.070000><27.940000,-1.538000,52.070000>0.406400}
cylinder{<27.940000,0.038000,49.530000><27.940000,-1.538000,49.530000>0.406400}
cylinder{<27.940000,0.038000,46.990000><27.940000,-1.538000,46.990000>0.406400}
cylinder{<27.940000,0.038000,44.450000><27.940000,-1.538000,44.450000>0.406400}
cylinder{<27.940000,0.038000,41.910000><27.940000,-1.538000,41.910000>0.406400}
cylinder{<27.940000,0.038000,39.370000><27.940000,-1.538000,39.370000>0.406400}
cylinder{<27.940000,0.038000,36.830000><27.940000,-1.538000,36.830000>0.406400}
cylinder{<27.940000,0.038000,34.290000><27.940000,-1.538000,34.290000>0.406400}
cylinder{<27.940000,0.038000,31.750000><27.940000,-1.538000,31.750000>0.406400}
cylinder{<27.940000,0.038000,29.210000><27.940000,-1.538000,29.210000>0.406400}
cylinder{<27.940000,0.038000,26.670000><27.940000,-1.538000,26.670000>0.406400}
cylinder{<27.940000,0.038000,24.130000><27.940000,-1.538000,24.130000>0.406400}
cylinder{<27.940000,0.038000,21.590000><27.940000,-1.538000,21.590000>0.406400}
cylinder{<27.940000,0.038000,19.050000><27.940000,-1.538000,19.050000>0.406400}
cylinder{<27.940000,0.038000,16.510000><27.940000,-1.538000,16.510000>0.406400}
cylinder{<27.940000,0.038000,13.970000><27.940000,-1.538000,13.970000>0.406400}
cylinder{<27.940000,0.038000,11.430000><27.940000,-1.538000,11.430000>0.406400}
cylinder{<27.940000,0.038000,8.890000><27.940000,-1.538000,8.890000>0.406400}
cylinder{<43.180000,0.038000,8.890000><43.180000,-1.538000,8.890000>0.406400}
cylinder{<43.180000,0.038000,11.430000><43.180000,-1.538000,11.430000>0.406400}
cylinder{<43.180000,0.038000,13.970000><43.180000,-1.538000,13.970000>0.406400}
cylinder{<43.180000,0.038000,16.510000><43.180000,-1.538000,16.510000>0.406400}
cylinder{<43.180000,0.038000,19.050000><43.180000,-1.538000,19.050000>0.406400}
cylinder{<43.180000,0.038000,21.590000><43.180000,-1.538000,21.590000>0.406400}
cylinder{<43.180000,0.038000,24.130000><43.180000,-1.538000,24.130000>0.406400}
cylinder{<43.180000,0.038000,26.670000><43.180000,-1.538000,26.670000>0.406400}
cylinder{<43.180000,0.038000,29.210000><43.180000,-1.538000,29.210000>0.406400}
cylinder{<43.180000,0.038000,31.750000><43.180000,-1.538000,31.750000>0.406400}
cylinder{<43.180000,0.038000,34.290000><43.180000,-1.538000,34.290000>0.406400}
cylinder{<43.180000,0.038000,36.830000><43.180000,-1.538000,36.830000>0.406400}
cylinder{<43.180000,0.038000,39.370000><43.180000,-1.538000,39.370000>0.406400}
cylinder{<43.180000,0.038000,41.910000><43.180000,-1.538000,41.910000>0.406400}
cylinder{<43.180000,0.038000,44.450000><43.180000,-1.538000,44.450000>0.406400}
cylinder{<43.180000,0.038000,46.990000><43.180000,-1.538000,46.990000>0.406400}
cylinder{<43.180000,0.038000,49.530000><43.180000,-1.538000,49.530000>0.406400}
cylinder{<43.180000,0.038000,52.070000><43.180000,-1.538000,52.070000>0.406400}
cylinder{<43.180000,0.038000,54.610000><43.180000,-1.538000,54.610000>0.406400}
cylinder{<43.180000,0.038000,57.150000><43.180000,-1.538000,57.150000>0.406400}
cylinder{<17.907000,0.038000,19.050000><17.907000,-1.538000,19.050000>0.406400}
cylinder{<22.733000,0.038000,19.050000><22.733000,-1.538000,19.050000>0.406400}
//Holes(fast)/Vias
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.640800,0.000000,2.490197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.640800,0.000000,1.320800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<21.640800,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.640800,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.835697,0.000000,2.100397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<21.640800,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<21.835697,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.225497,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<21.835697,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.225497,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.420397,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<22.225497,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.420397,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.420397,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<22.420397,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.005094,0.000000,2.295297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.005094,0.000000,1.515697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.005094,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.005094,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.199994,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<23.005094,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.810197,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.199994,0.000000,2.100397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<22.810197,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.784691,0.000000,2.295297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.784691,0.000000,1.515697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.784691,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.784691,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.979591,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<23.784691,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.589794,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.979591,0.000000,2.100397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<23.589794,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.369391,0.000000,0.931003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.369391,0.000000,2.100397>}
box{<0,0,-0.050800><1.169394,0.036000,0.050800> rotate<0,90.000000,0> translate<24.369391,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.369391,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.954087,0.000000,2.100397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<24.369391,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.954087,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.148988,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<24.954087,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.148988,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.148988,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.148988,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.148988,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.954087,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<24.954087,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.954087,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.369391,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<24.369391,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,2.100397>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<25.538788,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.905497>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.733684,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.905497>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<25.538788,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,2.100397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,90.000000,0> translate<25.538788,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<25.538788,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<25.733684,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.733684,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<25.538788,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.538788,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<25.538788,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.123484,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.903081,0.000000,2.490197>}
box{<0,0,-0.050800><1.405440,0.036000,0.050800> rotate<0,-56.306252,0> translate<26.123484,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.292881,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.072478,0.000000,2.490197>}
box{<0,0,-0.050800><1.405440,0.036000,0.050800> rotate<0,-56.306252,0> translate<27.292881,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.462278,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.462278,0.000000,1.515697>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<28.462278,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.462278,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.657175,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<28.462278,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.657175,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.852075,0.000000,1.515697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<28.657175,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.852075,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.046975,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<28.852075,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.046975,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.241875,0.000000,1.515697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<29.046975,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.241875,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.241875,0.000000,2.100397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,90.000000,0> translate<29.241875,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.826572,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.216372,0.000000,1.320800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<29.826572,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.216372,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.411272,0.000000,1.515697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<30.216372,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.411272,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.411272,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<30.411272,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.411272,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.216372,0.000000,2.100397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<30.216372,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.216372,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.826572,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<29.826572,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.826572,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.631675,0.000000,1.905497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<29.631675,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.631675,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.631675,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.631675,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.631675,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.826572,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<29.631675,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.801072,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.801072,0.000000,2.100397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<30.801072,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.801072,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.190869,0.000000,2.100397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<30.801072,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.190869,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.385769,0.000000,2.100397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<31.190869,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.775569,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.775569,0.000000,2.490197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<31.775569,0.000000,2.490197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.360266,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.775569,0.000000,1.710597>}
box{<0,0,-0.050800><0.702718,0.036000,0.050800> rotate<0,33.687773,0> translate<31.775569,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.775569,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.360266,0.000000,2.100397>}
box{<0,0,-0.050800><0.702719,0.036000,0.050800> rotate<0,-33.687985,0> translate<31.775569,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.750066,0.000000,2.490197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.750066,0.000000,1.320800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.750066,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.750066,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.334763,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<32.750066,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.334763,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.529663,0.000000,1.515697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<33.334763,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.529663,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.529663,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<33.529663,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.529663,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.334763,0.000000,2.100397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.334763,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.334763,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.750066,0.000000,2.100397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<32.750066,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.504159,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.114359,0.000000,1.320800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.114359,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.114359,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.919463,0.000000,1.515697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<33.919463,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.919463,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.919463,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<33.919463,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.919463,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.114359,0.000000,2.100397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<33.919463,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.114359,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.504159,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<34.114359,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.504159,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.699059,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<34.504159,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.699059,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.699059,0.000000,1.710597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<34.699059,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.699059,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.919463,0.000000,1.710597>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<33.919463,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.088859,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.088859,0.000000,2.100397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<35.088859,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.088859,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.673556,0.000000,2.100397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<35.088859,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.673556,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.868456,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<35.673556,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.868456,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.868456,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.868456,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.037853,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.453153,0.000000,2.100397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<36.453153,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.453153,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.258256,0.000000,1.905497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<36.258256,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.258256,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.258256,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.258256,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.258256,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.453153,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<36.258256,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.453153,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.037853,0.000000,1.320800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<36.453153,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.427653,0.000000,2.490197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.427653,0.000000,1.320800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<37.427653,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.427653,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.622550,0.000000,2.100397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<37.427653,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.622550,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.012350,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<37.622550,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.012350,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.207250,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<38.012350,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.207250,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.207250,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.207250,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.597050,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.597050,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<38.597050,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.597050,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.791947,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<38.597050,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.791947,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.791947,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.791947,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.791947,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.597050,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<38.597050,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.376644,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.376644,0.000000,2.295297>}
box{<0,0,-0.050800><0.974497,0.036000,0.050800> rotate<0,90.000000,0> translate<39.376644,0.000000,2.295297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.376644,0.000000,2.295297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.571544,0.000000,2.490197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<39.376644,0.000000,2.295297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.181747,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.571544,0.000000,1.905497>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<39.181747,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.961344,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.961344,0.000000,2.100397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<39.961344,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.961344,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.351141,0.000000,2.100397>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<39.961344,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.351141,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.546041,0.000000,2.100397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<40.351141,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.520538,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.130738,0.000000,1.320800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<41.130738,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.130738,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.935841,0.000000,1.515697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<40.935841,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.935841,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.935841,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<40.935841,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.935841,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.130738,0.000000,2.100397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<40.935841,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.130738,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.520538,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<41.130738,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.520538,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.715438,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<41.520538,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.715438,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.715438,0.000000,1.710597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.715438,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.715438,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.935841,0.000000,1.710597>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<40.935841,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.689934,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.300134,0.000000,1.320800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<42.300134,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.300134,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.105238,0.000000,1.515697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<42.105238,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.105238,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.105238,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<42.105238,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.105238,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.300134,0.000000,2.100397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<42.105238,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.300134,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.689934,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<42.300134,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.689934,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.884834,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<42.689934,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.884834,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.884834,0.000000,1.710597>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.884834,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.884834,0.000000,1.710597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.105238,0.000000,1.710597>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<42.105238,0.000000,1.710597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.469531,0.000000,2.295297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.469531,0.000000,1.515697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.469531,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.469531,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.664431,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<43.469531,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.274634,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.664431,0.000000,2.100397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<43.274634,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.833828,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.249128,0.000000,2.100397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<44.249128,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.249128,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.054231,0.000000,1.905497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<44.054231,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.054231,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.054231,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<44.054231,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.054231,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.249128,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<44.054231,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.249128,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<44.833828,0.000000,1.320800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<44.249128,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.223628,0.000000,0.931003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.223628,0.000000,2.100397>}
box{<0,0,-0.050800><1.169394,0.036000,0.050800> rotate<0,90.000000,0> translate<45.223628,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.223628,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.808325,0.000000,2.100397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<45.223628,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.808325,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.003225,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<45.808325,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.003225,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.003225,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.003225,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.003225,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.808325,0.000000,1.320800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<45.808325,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.808325,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<45.223628,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<45.223628,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.393025,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.393025,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<46.393025,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.393025,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.587922,0.000000,1.515697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<46.393025,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.587922,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.587922,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.587922,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.587922,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.393025,0.000000,1.320800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<46.393025,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.757319,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.172619,0.000000,2.100397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<47.172619,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.172619,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.977722,0.000000,1.905497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<46.977722,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.977722,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.977722,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<46.977722,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<46.977722,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.172619,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<46.977722,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.172619,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.757319,0.000000,1.320800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<47.172619,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.342016,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.731816,0.000000,1.320800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<48.342016,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.731816,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.926716,0.000000,1.515697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<48.731816,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.926716,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.926716,0.000000,1.905497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<48.926716,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.926716,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.731816,0.000000,2.100397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<48.731816,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.731816,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.342016,0.000000,2.100397>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<48.342016,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.342016,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.147119,0.000000,1.905497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<48.147119,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.147119,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.147119,0.000000,1.515697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<48.147119,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.147119,0.000000,1.515697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.342016,0.000000,1.320800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<48.147119,0.000000,1.515697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.316516,0.000000,1.320800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.316516,0.000000,2.100397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<49.316516,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.316516,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.511413,0.000000,2.100397>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<49.316516,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.511413,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.706313,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<49.511413,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.706313,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.706313,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<49.706313,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.706313,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.901212,0.000000,2.100397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<49.706313,0.000000,1.905497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<49.901212,0.000000,2.100397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.096113,0.000000,1.905497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<49.901212,0.000000,2.100397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.096113,0.000000,1.905497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<50.096113,0.000000,1.320800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<50.096113,0.000000,1.320800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.355800,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.355800,0.000000,3.420697>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<27.355800,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.355800,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550697,0.000000,3.225800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<27.355800,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<27.550697,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.135397,0.000000,3.225800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<27.550697,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.135397,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.135397,0.000000,4.005397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<28.135397,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.525197,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.109894,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<28.525197,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.109894,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.304794,0.000000,3.420697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<29.109894,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.304794,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.109894,0.000000,3.615597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<29.109894,0.000000,3.615597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.109894,0.000000,3.615597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.720094,0.000000,3.615597>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<28.720094,0.000000,3.615597> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.720094,0.000000,3.615597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.525197,0.000000,3.810497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<28.525197,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.525197,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.720094,0.000000,4.005397>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<28.525197,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<28.720094,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.304794,0.000000,4.005397>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<28.720094,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.694594,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.694594,0.000000,3.225800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<29.694594,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.694594,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.279291,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<29.694594,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.279291,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.474191,0.000000,3.420697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<30.279291,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.474191,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.474191,0.000000,3.810497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,90.000000,0> translate<30.474191,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.474191,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.279291,0.000000,4.005397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<30.279291,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.279291,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.694594,0.000000,4.005397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<29.694594,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.643588,0.000000,4.200297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,4.395197>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<31.448688,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,4.395197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.058888,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.863991,0.000000,4.200297>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<30.863991,0.000000,4.200297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.863991,0.000000,4.200297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.863991,0.000000,4.005397>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<30.863991,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.863991,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,3.810497>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.997489,0> translate<30.863991,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,3.810497>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.058888,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.643588,0.000000,3.615597>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<31.448688,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.643588,0.000000,3.615597>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.643588,0.000000,3.420697>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.643588,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.643588,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,3.225800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<31.448688,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.448688,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,3.225800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<31.058888,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.058888,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<30.863991,0.000000,3.420697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<30.863991,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.033388,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.228284,0.000000,4.005397>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<32.033388,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.228284,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.228284,0.000000,3.225800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.228284,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.033388,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.423184,0.000000,3.225800>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<32.033388,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.228284,0.000000,4.590097>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.228284,0.000000,4.395197>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,-90.000000,0> translate<32.228284,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.812984,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.812984,0.000000,4.005397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<32.812984,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<32.812984,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.007881,0.000000,4.005397>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<32.812984,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.007881,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.202781,0.000000,3.810497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.007881,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.202781,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.202781,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.202781,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.202781,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.397681,0.000000,4.005397>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,-44.997030,0> translate<33.202781,0.000000,3.810497> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.397681,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.592581,0.000000,3.810497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<33.397681,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.592581,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.592581,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<33.592581,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.982381,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.372178,0.000000,3.225800>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<33.982381,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.177278,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.177278,0.000000,4.395197>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,90.000000,0> translate<34.177278,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<33.982381,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.372178,0.000000,4.395197>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<33.982381,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.761978,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.761978,0.000000,4.005397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<34.761978,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<34.761978,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.346675,0.000000,4.005397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<34.761978,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.346675,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.541575,0.000000,3.810497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<35.346675,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.541575,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.541575,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,-90.000000,0> translate<35.541575,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.931375,0.000000,2.836003>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.931375,0.000000,4.005397>}
box{<0,0,-0.050800><1.169394,0.036000,0.050800> rotate<0,90.000000,0> translate<35.931375,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.931375,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.516072,0.000000,4.005397>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<35.931375,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.516072,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.710972,0.000000,3.810497>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<36.516072,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.710972,0.000000,3.810497>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.710972,0.000000,3.420697>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,-90.000000,0> translate<36.710972,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.710972,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.516072,0.000000,3.225800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<36.516072,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<36.516072,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<35.931375,0.000000,3.225800>}
box{<0,0,-0.050800><0.584697,0.036000,0.050800> rotate<0,0.000000,0> translate<35.931375,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.100772,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.100772,0.000000,3.420697>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,-90.000000,0> translate<37.100772,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.100772,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.295669,0.000000,3.225800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<37.100772,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.295669,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.880369,0.000000,3.225800>}
box{<0,0,-0.050800><0.584700,0.036000,0.050800> rotate<0,0.000000,0> translate<37.295669,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.880369,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<37.880369,0.000000,4.005397>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,90.000000,0> translate<37.880369,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.465066,0.000000,4.200297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.465066,0.000000,3.420697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<38.465066,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.465066,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.659966,0.000000,3.225800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,44.996571,0> translate<38.465066,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.270169,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.659966,0.000000,4.005397>}
box{<0,0,-0.050800><0.389797,0.036000,0.050800> rotate<0,0.000000,0> translate<38.270169,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.219163,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.608959,0.000000,3.225800>}
box{<0,0,-0.050800><0.871615,0.036000,0.050800> rotate<0,63.430854,0> translate<40.219163,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.608959,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<40.998759,0.000000,4.005397>}
box{<0,0,-0.050800><0.871617,0.036000,0.050800> rotate<0,-63.430671,0> translate<40.608959,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.388559,0.000000,4.005397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.778356,0.000000,4.395197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<41.388559,0.000000,4.005397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.778356,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.778356,0.000000,3.225800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<41.778356,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<41.388559,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.168156,0.000000,3.225800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<41.388559,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.557956,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.557956,0.000000,3.420697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,90.000000,0> translate<42.557956,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.557956,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.752853,0.000000,3.420697>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<42.557956,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.752853,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.752853,0.000000,3.225800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,-90.000000,0> translate<42.752853,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.752853,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<42.557956,0.000000,3.225800>}
box{<0,0,-0.050800><0.194897,0.036000,0.050800> rotate<0,0.000000,0> translate<42.557956,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.142653,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.142653,0.000000,4.200297>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,90.000000,0> translate<43.142653,0.000000,4.200297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.142653,0.000000,4.200297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.337550,0.000000,4.395197>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.997489,0> translate<43.142653,0.000000,4.200297> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.337550,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.727350,0.000000,4.395197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<43.337550,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.727350,0.000000,4.395197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.922250,0.000000,4.200297>}
box{<0,0,-0.050800><0.275630,0.036000,0.050800> rotate<0,44.997030,0> translate<43.727350,0.000000,4.395197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.922250,0.000000,4.200297>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.922250,0.000000,3.420697>}
box{<0,0,-0.050800><0.779600,0.036000,0.050800> rotate<0,-90.000000,0> translate<43.922250,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.922250,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.727350,0.000000,3.225800>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<43.727350,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.727350,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.337550,0.000000,3.225800>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<43.337550,0.000000,3.225800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.337550,0.000000,3.225800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.142653,0.000000,3.420697>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<43.142653,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.142653,0.000000,3.420697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<43.922250,0.000000,4.200297>}
box{<0,0,-0.050800><1.102519,0.036000,0.050800> rotate<0,-44.997145,0> translate<43.142653,0.000000,3.420697> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.343066,0.000000,10.190169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,10.033400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.186297,0.000000,10.033400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,10.033400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,9.719866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.186297,0.000000,9.719866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,9.719866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.343066,0.000000,9.563100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<49.186297,0.000000,9.719866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.343066,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,9.563100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<49.343066,0.000000,9.563100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,9.719866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.970134,0.000000,9.563100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,9.719866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.033400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<50.126900,0.000000,10.033400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.033400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,10.190169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<49.970134,0.000000,10.190169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.655384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.968919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<50.126900,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,11.125687>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<49.970134,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,11.125687>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<49.656600,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,10.968919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.499831,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,10.655384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.499831,0.000000,10.655384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,10.655384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,10.498619>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<49.499831,0.000000,10.655384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,10.498619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,10.498619>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<49.656600,0.000000,10.498619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,10.498619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,10.655384>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.970134,0.000000,10.498619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,11.434138>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,11.590903>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<49.186297,0.000000,11.590903> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.186297,0.000000,11.590903>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,11.590903>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<49.186297,0.000000,11.590903> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,11.434138>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,11.747672>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<50.126900,0.000000,11.747672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,12.057816>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,12.528116>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<50.126900,0.000000,12.528116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<50.126900,0.000000,12.528116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,12.684884>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<49.970134,0.000000,12.684884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.970134,0.000000,12.684884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.813366,0.000000,12.528116>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.813366,0.000000,12.528116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.813366,0.000000,12.528116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.813366,0.000000,12.214581>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<49.813366,0.000000,12.214581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.813366,0.000000,12.214581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,12.057816>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<49.656600,0.000000,12.057816> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.656600,0.000000,12.057816>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,12.214581>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<49.499831,0.000000,12.214581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,12.214581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<49.499831,0.000000,12.684884>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<49.499831,0.000000,12.684884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,15.434866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.875134,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,15.434866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,15.748400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<52.031900,0.000000,15.748400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,15.748400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,15.905169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<51.875134,0.000000,15.905169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,15.905169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,15.905169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<51.248066,0.000000,15.905169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,15.905169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,15.748400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.091297,0.000000,15.748400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,15.748400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,15.434866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.091297,0.000000,15.434866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,15.434866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,15.278100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<51.091297,0.000000,15.434866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,15.278100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<51.248066,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,15.278100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,15.434866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<51.404831,0.000000,15.278100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,15.434866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,15.905169>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<51.561600,0.000000,15.905169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,14.643100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,14.956634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<52.996297,0.000000,14.956634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,14.956634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,14.956634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<52.996297,0.000000,14.956634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,14.643100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,15.270169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.936900,0.000000,15.270169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,15.578619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,15.578619>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<53.153066,0.000000,15.578619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,15.578619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,15.735384>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<52.996297,0.000000,15.735384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,15.735384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,16.048919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<52.996297,0.000000,16.048919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,16.048919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,16.205687>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<52.996297,0.000000,16.048919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,16.205687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,16.205687>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<53.153066,0.000000,16.205687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,16.205687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,16.048919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<53.780134,0.000000,16.205687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,16.048919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,15.735384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.936900,0.000000,15.735384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,15.735384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,15.578619>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.780134,0.000000,15.578619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,15.578619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,16.205687>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<53.153066,0.000000,16.205687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,7.023100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,7.336634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<51.091297,0.000000,7.336634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,7.336634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,7.336634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<51.091297,0.000000,7.336634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,7.023100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,7.650169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<52.031900,0.000000,7.650169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,7.958619>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.091297,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,7.958619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,7.958619>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<51.091297,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,7.958619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,8.272153>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<51.404831,0.000000,8.272153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,8.272153>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,8.428919>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<51.404831,0.000000,8.428919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,8.428919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,8.585688>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.404831,0.000000,8.428919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,8.585688>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<51.561600,0.000000,8.585688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,8.428919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<51.875134,0.000000,8.585688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,8.428919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,8.115384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.031900,0.000000,8.115384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,8.115384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,7.958619>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.875134,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,7.023100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,7.336634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<52.996297,0.000000,7.336634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,7.336634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,7.336634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<52.996297,0.000000,7.336634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,7.023100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,7.650169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.936900,0.000000,7.650169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,8.272153>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<52.996297,0.000000,8.585688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,8.272153>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,7.958619>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<53.153066,0.000000,8.272153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,7.958619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,7.958619>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<53.466600,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,7.958619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,8.115384>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.780134,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,8.115384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,8.428919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<53.936900,0.000000,8.428919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,8.428919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,8.585688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<53.780134,0.000000,8.585688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.780134,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.623366,0.000000,8.585688>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<53.623366,0.000000,8.585688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.623366,0.000000,8.585688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,8.428919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<53.466600,0.000000,8.428919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,8.428919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,7.958619>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.466600,0.000000,7.958619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.948066,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,50.673400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.791297,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,50.359866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<63.791297,0.000000,50.359866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,50.359866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.948066,0.000000,50.203100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<63.791297,0.000000,50.359866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.948066,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,50.203100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<63.948066,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,50.359866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.575134,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,50.359866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,50.673400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,50.830169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,51.295384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,51.608919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,51.608919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,51.608919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,51.765688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,51.765688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,51.765688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,51.765688>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<64.261600,0.000000,51.765688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,51.765688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,51.608919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.104831,0.000000,51.608919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,51.608919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,51.295384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.104831,0.000000,51.295384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,51.295384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,51.138619>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<64.104831,0.000000,51.295384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,51.138619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,51.138619>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<64.261600,0.000000,51.138619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,51.138619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,51.295384>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.575134,0.000000,51.138619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,52.074137>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,52.230903>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<63.791297,0.000000,52.230903> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,52.230903>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,52.230903>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<63.791297,0.000000,52.230903> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,52.074137>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,52.387672>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,52.387672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,52.697816>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,53.168116>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,53.168116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,53.168116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,53.324884>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,53.324884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,53.324884>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,53.168116>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.418366,0.000000,53.168116> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,53.168116>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,52.854581>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.418366,0.000000,52.854581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,52.854581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,52.697816>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.261600,0.000000,52.697816> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,52.697816>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,52.854581>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<64.104831,0.000000,52.854581> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,52.854581>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,53.324884>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<64.104831,0.000000,53.324884> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,55.918100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,56.231634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<59.981297,0.000000,56.231634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,56.231634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,56.231634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,56.231634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,55.918100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,56.545169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<60.921900,0.000000,56.545169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,56.545169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,55.918100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.826900,0.000000,55.918100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,55.918100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,56.545169>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<62.199831,0.000000,56.545169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,56.545169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,56.545169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,56.545169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,56.545169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,56.388400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.886297,0.000000,56.388400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,56.388400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,56.074866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.886297,0.000000,56.074866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,56.074866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,55.918100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<61.886297,0.000000,56.074866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,48.290169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<59.981297,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,48.290169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,47.663100>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<60.138066,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,47.663100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<60.765134,0.000000,47.663100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,47.819866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<61.886297,0.000000,47.819866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,47.819866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,48.133400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<61.886297,0.000000,48.133400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,48.133400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,48.290169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.886297,0.000000,48.133400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,48.290169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,48.133400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<62.199831,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,48.133400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,48.290169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<62.356600,0.000000,48.133400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,48.290169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,48.290169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,48.133400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<62.670134,0.000000,48.290169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,48.133400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,47.819866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.826900,0.000000,47.819866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,47.819866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,47.663100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.670134,0.000000,47.663100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,47.663100>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,47.663100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,47.819866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<62.356600,0.000000,47.819866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,47.819866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,47.663100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<62.199831,0.000000,47.663100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,47.663100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,47.663100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,47.663100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,47.819866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,48.133400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<62.356600,0.000000,48.133400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,40.043100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<63.791297,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,40.513400>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<63.791297,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.791297,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.948066,0.000000,40.670169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<63.791297,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<63.948066,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,40.670169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<63.948066,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,40.513400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.261600,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,40.043100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.418366,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,40.356634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,40.670169>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.418366,0.000000,40.356634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,41.135384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,41.448919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,41.448919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,41.448919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,41.605688>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,41.605688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,41.605688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,41.605688>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<64.261600,0.000000,41.605688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,41.605688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,41.448919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.104831,0.000000,41.448919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,41.448919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,41.135384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.104831,0.000000,41.135384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,41.135384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,40.978619>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<64.104831,0.000000,41.135384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,40.978619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,40.978619>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<64.261600,0.000000,40.978619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,40.978619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,41.135384>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.575134,0.000000,40.978619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,41.914138>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,41.914138>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<64.104831,0.000000,41.914138> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,41.914138>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,42.070903>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.575134,0.000000,41.914138> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,42.070903>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,42.227672>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,42.227672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,42.227672>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,42.384438>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.575134,0.000000,42.227672> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,42.384438>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,42.541206>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,42.541206> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,42.541206>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,42.541206>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<64.104831,0.000000,42.541206> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,42.849656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,43.319956>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,90.000000,0> translate<64.731900,0.000000,43.319956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.731900,0.000000,43.319956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,43.476725>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<64.575134,0.000000,43.476725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.575134,0.000000,43.476725>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,43.319956>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.418366,0.000000,43.319956> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,43.319956>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,43.006422>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<64.418366,0.000000,43.006422> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.418366,0.000000,43.006422>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,42.849656>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<64.261600,0.000000,42.849656> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.261600,0.000000,42.849656>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,43.006422>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<64.104831,0.000000,43.006422> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,43.006422>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<64.104831,0.000000,43.476725>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,90.000000,0> translate<64.104831,0.000000,43.476725> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,45.758100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,46.071634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<59.981297,0.000000,46.071634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,46.071634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,46.071634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,46.071634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,45.758100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,46.385169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<60.921900,0.000000,46.385169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,46.385169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,45.758100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.826900,0.000000,45.758100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,45.758100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,46.385169>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<62.199831,0.000000,46.385169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,46.385169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,46.385169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,46.385169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,46.385169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,46.228400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.886297,0.000000,46.228400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,46.228400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,45.914866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.886297,0.000000,45.914866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,45.914866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,45.758100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<61.886297,0.000000,45.914866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,38.130169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<59.981297,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,38.130169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,37.503100>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<60.138066,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,37.503100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<60.765134,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,37.659866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<61.886297,0.000000,37.659866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,37.659866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,37.973400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<61.886297,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,38.130169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<61.886297,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,38.130169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.973400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<62.199831,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,38.130169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<62.356600,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,38.130169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,38.130169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,37.973400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<62.670134,0.000000,38.130169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,37.973400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,37.659866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.826900,0.000000,37.659866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,37.659866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,37.503100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.670134,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,37.503100>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.659866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<62.356600,0.000000,37.659866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.659866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,37.503100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<62.199831,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.199831,0.000000,37.503100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,37.503100>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<62.043066,0.000000,37.503100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.659866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,37.973400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<62.356600,0.000000,37.973400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.833400,0.000000,33.363703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<60.833400,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.833400,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519866,0.000000,33.363703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<60.519866,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519866,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.363100,0.000000,33.206934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<60.363100,0.000000,33.206934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.363100,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.363100,0.000000,32.579866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.363100,0.000000,32.579866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.363100,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519866,0.000000,32.423100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<60.363100,0.000000,32.579866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.519866,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.833400,0.000000,32.423100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<60.519866,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.833400,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,32.579866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<60.833400,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,32.893400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<60.990169,0.000000,32.893400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,32.893400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.676634,0.000000,32.893400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<60.676634,0.000000,32.893400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,33.363703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<61.298619,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,32.423100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,56.306216,0> translate<61.298619,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,33.363703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<61.925688,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,32.423100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.234138,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.704438,0.000000,32.423100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.234138,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.704438,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,32.579866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<62.704438,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,33.206934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<62.861206,0.000000,33.206934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.704438,0.000000,33.363703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<62.704438,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.704438,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,33.363703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<62.234138,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.943400,0.000000,33.363703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<51.943400,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.943400,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.629866,0.000000,33.363703>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<51.629866,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.629866,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.473100,0.000000,33.206934>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<51.473100,0.000000,33.206934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.473100,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.473100,0.000000,32.579866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.473100,0.000000,32.579866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.473100,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.629866,0.000000,32.423100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<51.473100,0.000000,32.579866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.629866,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.943400,0.000000,32.423100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<51.629866,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.943400,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,32.579866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<51.943400,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,32.893400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<52.100169,0.000000,32.893400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,32.893400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.786634,0.000000,32.893400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<51.786634,0.000000,32.893400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,33.363703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<52.408619,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,32.423100>}
box{<0,0,-0.038100><1.130464,0.036000,0.038100> rotate<0,56.306216,0> translate<52.408619,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,33.363703>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,90.000000,0> translate<53.035688,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,32.423100>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.344138,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.814438,0.000000,32.423100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<53.344138,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.814438,0.000000,32.423100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,32.579866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<53.814438,0.000000,32.423100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,32.579866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,33.206934>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.971206,0.000000,33.206934> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,33.206934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.814438,0.000000,33.363703>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<53.814438,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.814438,0.000000,33.363703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,33.363703>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,0.000000,0> translate<53.344138,0.000000,33.363703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.473100,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.100169,0.000000,27.813400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<51.473100,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.786634,0.000000,28.126934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.786634,0.000000,27.499866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.786634,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,28.283703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<52.408619,0.000000,28.283703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,27.813400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.408619,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.722153,0.000000,27.970169>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<52.408619,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.722153,0.000000,27.970169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.878919,0.000000,27.970169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<52.722153,0.000000,27.970169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.878919,0.000000,27.970169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,27.813400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<52.878919,0.000000,27.970169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,27.499866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.035688,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.035688,0.000000,27.499866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.878919,0.000000,27.343100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<52.878919,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.878919,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.565384,0.000000,27.343100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<52.565384,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.565384,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.408619,0.000000,27.499866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<52.408619,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,27.656634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.344138,0.000000,27.656634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.344138,0.000000,27.656634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.657672,0.000000,27.343100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<53.344138,0.000000,27.656634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.657672,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,27.656634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<53.657672,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,27.656634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.971206,0.000000,28.283703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.971206,0.000000,28.283703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.363100,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.990169,0.000000,27.813400>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<60.363100,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.676634,0.000000,28.126934>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.676634,0.000000,27.499866>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.676634,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,28.283703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,0.000000,0> translate<61.298619,0.000000,28.283703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,27.813400>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.298619,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.612153,0.000000,27.970169>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,-26.563526,0> translate<61.298619,0.000000,27.813400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.612153,0.000000,27.970169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.768919,0.000000,27.970169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<61.612153,0.000000,27.970169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.768919,0.000000,27.970169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,27.813400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<61.768919,0.000000,27.970169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,27.813400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,27.499866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<61.925688,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.925688,0.000000,27.499866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.768919,0.000000,27.343100>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.996459,0> translate<61.768919,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.768919,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.455384,0.000000,27.343100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<61.455384,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.455384,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.298619,0.000000,27.499866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,44.997030,0> translate<61.298619,0.000000,27.499866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,28.283703>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,27.656634>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.234138,0.000000,27.656634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.234138,0.000000,27.656634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.547672,0.000000,27.343100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<62.234138,0.000000,27.656634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.547672,0.000000,27.343100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,27.656634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.547672,0.000000,27.343100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,27.656634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.861206,0.000000,28.283703>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<62.861206,0.000000,28.283703> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,12.103100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,12.416634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<51.091297,0.000000,12.416634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,12.416634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,12.416634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<51.091297,0.000000,12.416634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,12.103100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,12.730169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<52.031900,0.000000,12.730169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,13.038619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,13.352153>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<51.091297,0.000000,13.352153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,13.352153>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,13.352153>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<51.091297,0.000000,13.352153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,13.038619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,13.665688>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<52.031900,0.000000,13.665688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,12.103100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,12.416634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<52.996297,0.000000,12.416634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,12.416634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,12.416634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<52.996297,0.000000,12.416634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,12.103100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,12.730169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.936900,0.000000,12.730169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,13.665688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,13.038619>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<53.936900,0.000000,13.038619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,13.038619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,13.665688>}
box{<0,0,-0.038100><0.886809,0.036000,0.038100> rotate<0,44.997030,0> translate<53.309831,0.000000,13.665688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,13.665688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,13.665688>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<53.153066,0.000000,13.665688> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,13.665688>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,13.508919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<52.996297,0.000000,13.508919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,13.508919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,13.195384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.996297,0.000000,13.195384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,13.195384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.153066,0.000000,13.038619>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<52.996297,0.000000,13.195384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,9.876634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<51.091297,0.000000,9.876634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,9.876634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,9.876634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<51.091297,0.000000,9.876634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,10.190169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<52.031900,0.000000,10.190169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,10.498619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,10.655384>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<51.091297,0.000000,10.655384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,10.655384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,10.968919>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<51.091297,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.091297,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,11.125687>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.091297,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.248066,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,11.125687>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<51.248066,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.404831,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,10.968919>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<51.404831,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,10.812153>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<51.561600,0.000000,10.812153> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.561600,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.718366,0.000000,11.125687>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<51.561600,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.718366,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,11.125687>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<51.718366,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,11.125687>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,10.968919>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<51.875134,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,10.655384>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<52.031900,0.000000,10.655384> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.031900,0.000000,10.655384>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<51.875134,0.000000,10.498619>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<51.875134,0.000000,10.498619> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.309831,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,9.876634>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<52.996297,0.000000,9.876634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,9.876634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,9.876634>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<52.996297,0.000000,9.876634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,9.563100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,10.190169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.936900,0.000000,10.190169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.936900,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,10.968919>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<52.996297,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<52.996297,0.000000,10.968919>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,10.498619>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,44.996840,0> translate<52.996297,0.000000,10.968919> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,10.498619>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<53.466600,0.000000,11.125687>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<53.466600,0.000000,11.125687> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,43.374866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<59.981297,0.000000,43.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,43.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,43.688400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<59.981297,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,43.845169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.981297,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,43.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,43.845169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<60.138066,0.000000,43.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,43.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,43.688400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<60.294831,0.000000,43.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,43.531634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.451600,0.000000,43.531634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.608366,0.000000,43.845169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<60.451600,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.608366,0.000000,43.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,43.845169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<60.608366,0.000000,43.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,43.845169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,43.688400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<60.765134,0.000000,43.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,43.374866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.921900,0.000000,43.374866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,43.374866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,43.218100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.765134,0.000000,43.218100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,43.688400>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<61.886297,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,43.688400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,43.218100>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,44.996840,0> translate<61.886297,0.000000,43.688400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,43.218100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,43.845169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<62.356600,0.000000,43.845169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,40.043100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.981297,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,40.043100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,40.356634>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<60.294831,0.000000,40.356634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,40.356634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,40.513400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<60.294831,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,40.670169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.294831,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,40.670169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<60.451600,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,40.513400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<60.765134,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,40.199866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.921900,0.000000,40.199866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,40.199866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,40.043100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.765134,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,40.356634>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<61.886297,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,40.356634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,40.043100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<62.043066,0.000000,40.356634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,40.043100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<62.356600,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,40.043100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,40.199866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.670134,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,40.199866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,40.513400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<62.826900,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,40.670169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<62.670134,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,40.670169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,40.670169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,40.670169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,40.513400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<62.356600,0.000000,40.513400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,40.513400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,40.043100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.356600,0.000000,40.043100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,53.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,53.534866>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.996459,0> translate<59.981297,0.000000,53.534866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,53.534866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,53.848400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<59.981297,0.000000,53.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,54.005169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<59.981297,0.000000,53.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.138066,0.000000,54.005169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,54.005169>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,0.000000,0> translate<60.138066,0.000000,54.005169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,54.005169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,53.848400>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,44.997030,0> translate<60.294831,0.000000,54.005169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,53.691634>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.451600,0.000000,53.691634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.608366,0.000000,54.005169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<60.451600,0.000000,53.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.608366,0.000000,54.005169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,54.005169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<60.608366,0.000000,54.005169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,54.005169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,53.848400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<60.765134,0.000000,54.005169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,53.534866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.921900,0.000000,53.534866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,53.534866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,53.378100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.765134,0.000000,53.378100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,53.848400>}
box{<0,0,-0.038100><0.940603,0.036000,0.038100> rotate<0,0.000000,0> translate<61.886297,0.000000,53.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,53.848400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,53.378100>}
box{<0,0,-0.038100><0.665107,0.036000,0.038100> rotate<0,44.996840,0> translate<61.886297,0.000000,53.848400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,53.378100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,54.005169>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,90.000000,0> translate<62.356600,0.000000,54.005169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,50.203100>}
box{<0,0,-0.038100><0.627069,0.036000,0.038100> rotate<0,-90.000000,0> translate<59.981297,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<59.981297,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,50.203100>}
box{<0,0,-0.038100><0.470303,0.036000,0.038100> rotate<0,0.000000,0> translate<59.981297,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,50.516634>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<60.294831,0.000000,50.516634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,50.516634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,50.673400>}
box{<0,0,-0.038100><0.156766,0.036000,0.038100> rotate<0,90.000000,0> translate<60.294831,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.294831,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,50.830169>}
box{<0,0,-0.038100><0.221704,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.294831,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.451600,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,50.830169>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<60.451600,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,50.673400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<60.765134,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,50.359866>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,-90.000000,0> translate<60.921900,0.000000,50.359866> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.921900,0.000000,50.359866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<60.765134,0.000000,50.203100>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<60.765134,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<61.886297,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,50.516634>}
box{<0,0,-0.038100><0.350543,0.036000,0.038100> rotate<0,63.430534,0> translate<61.886297,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.043066,0.000000,50.516634>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,50.203100>}
box{<0,0,-0.038100><0.443405,0.036000,0.038100> rotate<0,44.997030,0> translate<62.043066,0.000000,50.516634> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,50.203100>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,0.000000,0> translate<62.356600,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,50.203100>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,50.359866>}
box{<0,0,-0.038100><0.221700,0.036000,0.038100> rotate<0,-44.997030,0> translate<62.670134,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,50.359866>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,50.673400>}
box{<0,0,-0.038100><0.313534,0.036000,0.038100> rotate<0,90.000000,0> translate<62.826900,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.826900,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,50.830169>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,44.997601,0> translate<62.670134,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.670134,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,50.830169>}
box{<0,0,-0.038100><0.156769,0.036000,0.038100> rotate<0,0.000000,0> translate<62.513366,0.000000,50.830169> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.513366,0.000000,50.830169>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,50.673400>}
box{<0,0,-0.038100><0.221702,0.036000,0.038100> rotate<0,-44.997601,0> translate<62.356600,0.000000,50.673400> }
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,50.673400>}
cylinder{<0,0,0><0,0.036000,0>0.038100 translate<62.356600,0.000000,50.203100>}
box{<0,0,-0.038100><0.470300,0.036000,0.038100> rotate<0,-90.000000,0> translate<62.356600,0.000000,50.203100> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.690000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,57.150000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<59.690000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,54.610000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.770000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.690000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,46.990000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<59.690000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,49.530000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.770000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,44.450000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<64.770000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.690000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,36.830000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<59.690000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<64.770000,0.000000,39.370000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<64.770000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.610000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,6.350000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.530000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,8.890000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,90.000000,0> translate<49.530000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.610000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,16.510000>}
box{<0,0,-0.127000><5.080000,0.036000,0.127000> rotate<0,0.000000,0> translate<49.530000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<49.530000,0.000000,13.970000>}
box{<0,0,-0.127000><2.540000,0.036000,0.127000> rotate<0,-90.000000,0> translate<49.530000,0.000000,13.970000> }
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.747000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.747000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.493000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,7.493000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.747000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,7.747000>}
box{<0,0,-0.076200><0.254000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,7.747000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,8.001000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,7.112000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,7.112000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,6.604000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,6.604000>}
box{<0,0,-0.076200><2.540000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.780000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.112000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.320000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,7.112000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,7.112000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,7.112000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,4.699000>}
box{<0,0,-0.076200><1.016000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.050000,0.000000,4.699000> }
difference{
cylinder{<19.050000,0,6.350000><19.050000,0.036000,6.350000>2.616200 translate<0,0.000000,0>}
cylinder{<19.050000,-0.1,6.350000><19.050000,0.135000,6.350000>2.463800 translate<0,0.000000,0>}}
box{<-0.254000,0,-1.270000><0.254000,0.036000,1.270000> rotate<0,-270.000000,0> translate<19.050000,0.000000,5.842000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.289150,0.000000,9.906813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098488,0.000000,10.097475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<22.098488,0.000000,10.097475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098488,0.000000,10.097475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717163,0.000000,10.097475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.717163,0.000000,10.097475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717163,0.000000,10.097475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.526500,0.000000,9.906813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.526500,0.000000,9.906813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.526500,0.000000,9.906813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.526500,0.000000,9.144163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.526500,0.000000,9.144163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.526500,0.000000,9.144163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717163,0.000000,8.953500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.526500,0.000000,9.144163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.717163,0.000000,8.953500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098488,0.000000,8.953500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.717163,0.000000,8.953500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.098488,0.000000,8.953500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.289150,0.000000,9.144163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.098488,0.000000,8.953500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.695897,0.000000,9.716150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.077222,0.000000,10.097475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.695897,0.000000,9.716150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.077222,0.000000,10.097475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.077222,0.000000,8.953500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.077222,0.000000,8.953500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.695897,0.000000,8.953500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.458547,0.000000,8.953500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<22.695897,0.000000,8.953500> }
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,21.971000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,21.971000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<17.145000,0.000000,22.479000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<18.415000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.637000,0.000000,22.479000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<16.637000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.415000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,26.289000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.145000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.923000,0.000000,22.479000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.923000,0.000000,22.479000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<17.145000,0.000000,25.781000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<18.415000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.018000,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.542000,0.000000,23.825200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.018000,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<17.018000,0.000000,24.460200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<18.542000,0.000000,24.460200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<17.018000,0.000000,24.460200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,24.460200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<17.780000,0.000000,24.460200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,23.825200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<17.780000,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.463150,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272488,0.000000,28.004475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<17.272488,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272488,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891163,0.000000,28.004475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<16.891163,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891163,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.700500,0.000000,27.813813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.700500,0.000000,27.813813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.700500,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.700500,0.000000,27.051163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.700500,0.000000,27.051163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.700500,0.000000,27.051163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891163,0.000000,26.860500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.700500,0.000000,27.051163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.891163,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272488,0.000000,26.860500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<16.891163,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.272488,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.463150,0.000000,27.051163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.272488,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.632547,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.869897,0.000000,26.860500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<17.869897,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.869897,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.632547,0.000000,27.623150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.869897,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.632547,0.000000,27.623150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.632547,0.000000,27.813813>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,90.000000,0> translate<18.632547,0.000000,27.813813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.632547,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.441884,0.000000,28.004475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<18.441884,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.441884,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.060559,0.000000,28.004475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<18.060559,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<18.060559,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.869897,0.000000,27.813813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.869897,0.000000,27.813813> }
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,21.971000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,21.971000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,21.971000> }
object{ARC(0.508000,0.152400,180.000000,270.000000,0.036000) translate<22.225000,0.000000,22.479000>}
object{ARC(0.508000,0.152400,270.000000,360.000000,0.036000) translate<23.495000,0.000000,22.479000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.717000,0.000000,22.479000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<21.717000,0.000000,22.479000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.225000,0.000000,26.289000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.225000,0.000000,26.289000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.003000,0.000000,22.479000>}
box{<0,0,-0.076200><3.302000,0.036000,0.076200> rotate<0,-90.000000,0> translate<24.003000,0.000000,22.479000> }
object{ARC(0.508000,0.152400,90.000000,180.000000,0.036000) translate<22.225000,0.000000,25.781000>}
object{ARC(0.508000,0.152400,0.000000,90.000000,0.036000) translate<23.495000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.098000,0.000000,23.825200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.622000,0.000000,23.825200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.098000,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.098000,0.000000,24.460200>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.622000,0.000000,24.460200>}
box{<0,0,-0.152400><1.524000,0.036000,0.152400> rotate<0,0.000000,0> translate<22.098000,0.000000,24.460200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,24.460200>}
box{<0,0,-0.076200><0.939800,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.860000,0.000000,24.460200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,23.825200>}
box{<0,0,-0.076200><0.965200,0.036000,0.076200> rotate<0,90.000000,0> translate<22.860000,0.000000,23.825200> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.543150,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.352488,0.000000,28.004475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<22.352488,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.352488,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.971163,0.000000,28.004475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.971163,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.971163,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.780500,0.000000,27.813813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<21.780500,0.000000,27.813813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.780500,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.780500,0.000000,27.051163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<21.780500,0.000000,27.051163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.780500,0.000000,27.051163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.971163,0.000000,26.860500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<21.780500,0.000000,27.051163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<21.971163,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.352488,0.000000,26.860500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<21.971163,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.352488,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.543150,0.000000,27.051163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.352488,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.949897,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.140559,0.000000,28.004475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<22.949897,0.000000,27.813813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.140559,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,28.004475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<23.140559,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,28.004475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.813813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.521884,0.000000,28.004475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.813813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.623150>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.712547,0.000000,27.623150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.623150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,27.432488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.521884,0.000000,27.432488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,27.432488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.331222,0.000000,27.432488>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<23.331222,0.000000,27.432488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,27.432488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.241825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.521884,0.000000,27.432488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.241825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.051163>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.712547,0.000000,27.051163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.712547,0.000000,27.051163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,26.860500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.521884,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.521884,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.140559,0.000000,26.860500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<23.140559,0.000000,26.860500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.140559,0.000000,26.860500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.949897,0.000000,27.051163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<22.949897,0.000000,27.051163> }
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,35.864800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,35.864800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<46.990000,0.000000,35.864800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,35.864800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.355000,0.000000,35.864800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<46.355000,0.000000,35.864800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,35.864800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,37.084000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,0.000000,37.084000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<47.625000,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,35.229800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<46.990000,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.990000,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<46.355000,0.000000,35.229800>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,0.000000,0> translate<46.355000,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,34.036000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,34.036000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,39.243000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,39.243000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,39.243000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.720000,0.000000,32.131000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.720000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.974000,0.000000,31.877000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.006000,0.000000,31.877000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.974000,0.000000,31.877000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.260000,0.000000,38.989000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,90.000000,0> translate<48.260000,0.000000,38.989000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<48.006000,0.000000,32.131000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<45.974000,0.000000,32.131000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<45.974000,0.000000,38.989000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<48.006000,0.000000,38.989000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.927150,0.000000,40.767813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736488,0.000000,40.958475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<46.736488,0.000000,40.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736488,0.000000,40.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.355162,0.000000,40.958475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.355162,0.000000,40.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.355162,0.000000,40.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.164500,0.000000,40.767813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<46.164500,0.000000,40.767813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.164500,0.000000,40.767813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.164500,0.000000,40.005163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<46.164500,0.000000,40.005163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.164500,0.000000,40.005163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.355162,0.000000,39.814500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<46.164500,0.000000,40.005163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.355162,0.000000,39.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736488,0.000000,39.814500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<46.355162,0.000000,39.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.736488,0.000000,39.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<46.927150,0.000000,40.005163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<46.736488,0.000000,39.814500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.905884,0.000000,39.814500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.905884,0.000000,40.958475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<47.905884,0.000000,40.958475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.905884,0.000000,40.958475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.333897,0.000000,40.386488>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,-44.997030,0> translate<47.333897,0.000000,40.386488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.333897,0.000000,40.386488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<48.096547,0.000000,40.386488>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<47.333897,0.000000,40.386488> }
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.555200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<22.555200,0.000000,33.655000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<22.555200,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.555200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.336000,0.000000,34.290000>}
box{<0,0,-0.076200><1.219200,0.036000,0.076200> rotate<0,0.000000,0> translate<21.336000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,34.290000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<23.190200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<23.190200,0.000000,33.655000>}
box{<0,0,-0.152400><0.635000,0.036000,0.152400> rotate<0,-90.000000,0> translate<23.190200,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.190200,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.384000,0.000000,34.290000>}
box{<0,0,-0.076200><1.193800,0.036000,0.076200> rotate<0,0.000000,0> translate<23.190200,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.177000,0.000000,33.274000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.177000,0.000000,33.274000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,33.020000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,33.274000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.543000,0.000000,35.306000>}
box{<0,0,-0.076200><2.032000,0.036000,0.076200> rotate<0,90.000000,0> translate<26.543000,0.000000,35.306000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.289000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,35.560000>}
box{<0,0,-0.076200><6.858000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.431000,0.000000,35.560000> }
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<26.289000,0.000000,35.306000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<26.289000,0.000000,33.274000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<19.431000,0.000000,33.274000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<19.431000,0.000000,35.306000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.447150,0.000000,34.417813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.256488,0.000000,34.608475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.256488,0.000000,34.608475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.256488,0.000000,34.608475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875163,0.000000,34.608475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<15.875163,0.000000,34.608475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875163,0.000000,34.608475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.684500,0.000000,34.417813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.684500,0.000000,34.417813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.684500,0.000000,34.417813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.684500,0.000000,33.655163>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,-90.000000,0> translate<15.684500,0.000000,33.655163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.684500,0.000000,33.655163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875163,0.000000,33.464500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<15.684500,0.000000,33.655163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.875163,0.000000,33.464500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.256488,0.000000,33.464500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<15.875163,0.000000,33.464500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.256488,0.000000,33.464500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.447150,0.000000,33.655163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<16.256488,0.000000,33.464500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.616547,0.000000,34.608475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.853897,0.000000,34.608475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<16.853897,0.000000,34.608475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.853897,0.000000,34.608475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.853897,0.000000,34.036487>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.853897,0.000000,34.036487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.853897,0.000000,34.036487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.235222,0.000000,34.227150>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,-26.563298,0> translate<16.853897,0.000000,34.036487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.235222,0.000000,34.227150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425884,0.000000,34.227150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<17.235222,0.000000,34.227150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425884,0.000000,34.227150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.616547,0.000000,34.036487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<17.425884,0.000000,34.227150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.616547,0.000000,34.036487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.616547,0.000000,33.655163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.616547,0.000000,33.655163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.616547,0.000000,33.655163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425884,0.000000,33.464500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<17.425884,0.000000,33.464500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.425884,0.000000,33.464500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.044559,0.000000,33.464500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<17.044559,0.000000,33.464500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.044559,0.000000,33.464500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.853897,0.000000,33.655163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<16.853897,0.000000,33.655163> }
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,8.890000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<15.240000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,6.350000>}
box{<0,0,-0.127000><2.839806,0.036000,0.127000> rotate<0,63.430762,0> translate<13.970000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,6.350000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.970000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,8.890000>}
box{<0,0,-0.127000><2.839806,0.036000,0.127000> rotate<0,-63.430762,0> translate<12.700000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<15.240000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,8.890000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<13.970000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,5.969000>}
box{<0,0,-0.127000><0.381000,0.036000,0.127000> rotate<0,-90.000000,0> translate<13.970000,0.000000,5.969000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,6.350000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,8.890000>}
box{<0,0,-0.127000><0.381000,0.036000,0.127000> rotate<0,-90.000000,0> translate<13.970000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.970000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,8.890000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.700000,0.000000,10.160000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,90.000000,0> translate<12.700000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.147300,0.000000,8.116275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.147300,0.000000,6.972300>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.147300,0.000000,6.972300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.147300,0.000000,6.972300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.719288,0.000000,6.972300>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<10.147300,0.000000,6.972300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.719288,0.000000,6.972300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.909950,0.000000,7.162963>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.719288,0.000000,6.972300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.909950,0.000000,7.162963>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.909950,0.000000,7.925613>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<10.909950,0.000000,7.925613> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.909950,0.000000,7.925613>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.719288,0.000000,8.116275>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<10.719288,0.000000,8.116275> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.719288,0.000000,8.116275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.147300,0.000000,8.116275>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<10.147300,0.000000,8.116275> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.316697,0.000000,7.734950>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.698022,0.000000,8.116275>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.316697,0.000000,7.734950> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.698022,0.000000,8.116275>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.698022,0.000000,6.972300>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.698022,0.000000,6.972300> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.316697,0.000000,6.972300>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.079347,0.000000,6.972300>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<11.316697,0.000000,6.972300> }
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,30.480000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<8.890000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,33.020000>}
box{<0,0,-0.127000><2.839806,0.036000,0.127000> rotate<0,63.430762,0> translate<8.890000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,33.020000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.890000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.480000>}
box{<0,0,-0.127000><2.839806,0.036000,0.127000> rotate<0,-63.430762,0> translate<10.160000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<8.890000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.480000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<8.890000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,33.401000>}
box{<0,0,-0.127000><0.381000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.160000,0.000000,33.401000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,0.000000,33.020000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.160000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.480000>}
box{<0,0,-0.127000><0.381000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.160000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.160000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,0.000000,30.480000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,0.000000,0> translate<10.160000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<11.430000,0.000000,29.210000>}
box{<0,0,-0.127000><1.270000,0.036000,0.127000> rotate<0,-90.000000,0> translate<11.430000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.770903,0.000000,31.763675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.770903,0.000000,30.619700>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.770903,0.000000,30.619700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.770903,0.000000,30.619700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.342891,0.000000,30.619700>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<11.770903,0.000000,30.619700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.342891,0.000000,30.619700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.533553,0.000000,30.810363>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.342891,0.000000,30.619700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.533553,0.000000,30.810363>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.533553,0.000000,31.573013>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,90.000000,0> translate<12.533553,0.000000,31.573013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.533553,0.000000,31.573013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.342891,0.000000,31.763675>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<12.342891,0.000000,31.763675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.342891,0.000000,31.763675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.770903,0.000000,31.763675>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<11.770903,0.000000,31.763675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.702950,0.000000,30.619700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.940300,0.000000,30.619700>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<12.940300,0.000000,30.619700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.940300,0.000000,30.619700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.702950,0.000000,31.382350>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.940300,0.000000,30.619700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.702950,0.000000,31.382350>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.702950,0.000000,31.573013>}
box{<0,0,-0.063500><0.190662,0.036000,0.063500> rotate<0,90.000000,0> translate<13.702950,0.000000,31.573013> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.702950,0.000000,31.573013>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.512288,0.000000,31.763675>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.512288,0.000000,31.763675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.512288,0.000000,31.763675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.130963,0.000000,31.763675>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<13.130963,0.000000,31.763675> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.130963,0.000000,31.763675>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.940300,0.000000,31.573013>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.940300,0.000000,31.573013> }
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.680000,0.000000,9.340000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.680000,0.000000,21.140000>}
box{<0,0,-0.127000><11.800000,0.036000,0.127000> rotate<0,90.000000,0> translate<10.680000,0.000000,21.140000> }
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<5.310000,0.000000,17.700000>}
object{ARC(0.500000,0.050800,180.000000,360.000000,0.036000) translate<4.310000,0.000000,17.700000>}
object{ARC(0.500000,0.050800,0.000000,180.000000,0.036000) translate<4.810000,0.000000,11.575000>}
object{ARC(1.000000,0.050800,0.000000,180.000000,0.036000) translate<4.810000,0.000000,11.825000>}
object{ARC(1.891594,0.050800,352.405356,367.594643,0.036000) translate<3.435000,0.000000,11.325000>}
object{ARC(3.627672,0.050800,349.832244,361.889378,0.036000) translate<2.184300,0.000000,11.705397>}
object{ARC(2.374922,0.050800,180.250904,198.673740,0.036000) translate<6.184900,0.000000,11.835400>}
object{ARC(0.625000,0.050800,180.000000,360.000000,0.036000) translate<5.185000,0.000000,13.575000>}
object{ARC(0.187500,0.050800,180.000000,360.000000,0.036000) translate<5.122500,0.000000,13.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,19.075000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,19.075000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,19.075000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,19.075000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,18.450000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<3.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,18.450000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,18.450000>}
box{<0,0,-0.025400><1.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,19.075000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,90.000000,0> translate<5.810000,0.000000,19.075000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,17.700000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<5.310000,0.000000,17.700000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,18.450000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<4.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,18.450000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,17.700000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-56.306216,0> translate<4.310000,0.000000,17.700000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,18.450000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,56.306216,0> translate<3.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,18.450000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<3.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,17.700000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,18.450000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<5.810000,0.000000,18.450000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,16.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,16.950000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,16.950000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,16.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,15.200000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<3.810000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,15.200000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,16.325000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<4.310000,0.000000,16.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,16.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,16.325000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.310000,0.000000,16.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,16.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,15.200000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.560000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.060000,0.000000,15.200000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.560000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.060000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.060000,0.000000,16.325000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,90.000000,0> translate<5.060000,0.000000,16.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.060000,0.000000,16.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,16.325000>}
box{<0,0,-0.025400><0.250000,0.036000,0.025400> rotate<0,0.000000,0> translate<5.060000,0.000000,16.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,16.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,15.200000>}
box{<0,0,-0.025400><1.125000,0.036000,0.025400> rotate<0,-90.000000,0> translate<5.310000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,15.200000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<5.310000,0.000000,15.200000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,15.200000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,16.950000>}
box{<0,0,-0.025400><1.750000,0.036000,0.025400> rotate<0,90.000000,0> translate<5.810000,0.000000,16.950000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,14.950000>}
box{<0,0,-0.025400><2.000000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,14.950000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,14.325000>}
box{<0,0,-0.025400><0.625000,0.036000,0.025400> rotate<0,-90.000000,0> translate<3.810000,0.000000,14.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,14.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,14.325000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.810000,0.000000,14.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,14.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,13.825000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<3.810000,0.000000,13.825000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,13.825000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,13.075000>}
box{<0,0,-0.025400><0.750000,0.036000,0.025400> rotate<0,-90.000000,0> translate<3.810000,0.000000,13.075000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.810000,0.000000,13.075000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.560000,0.000000,13.575000>}
box{<0,0,-0.025400><0.901388,0.036000,0.025400> rotate<0,-33.687844,0> translate<3.810000,0.000000,13.075000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,14.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.935000,0.000000,14.325000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.935000,0.000000,14.325000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,14.950000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.810000,0.000000,13.575000>}
box{<0,0,-0.025400><1.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<5.810000,0.000000,13.575000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,14.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,13.950000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<5.310000,0.000000,13.950000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.935000,0.000000,14.325000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.935000,0.000000,13.950000>}
box{<0,0,-0.025400><0.375000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.935000,0.000000,13.950000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,11.575000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,11.075000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.810000,0.000000,11.075000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,11.575000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.310000,0.000000,11.575000>}
box{<0,0,-0.025400><0.500000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.310000,0.000000,11.575000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.310000,0.000000,11.080000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<5.755000,0.000000,11.080000>}
box{<0,0,-0.025400><0.445000,0.036000,0.025400> rotate<0,0.000000,0> translate<5.310000,0.000000,11.080000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.810000,0.000000,11.075000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<3.935000,0.000000,11.075000>}
box{<0,0,-0.025400><0.875000,0.036000,0.025400> rotate<0,0.000000,0> translate<3.935000,0.000000,11.075000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.995000,0.000000,9.340000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.680000,0.000000,9.340000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<6.995000,0.000000,9.340000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<10.680000,0.000000,21.140000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<6.995000,0.000000,21.140000>}
box{<0,0,-0.127000><3.685000,0.036000,0.127000> rotate<0,0.000000,0> translate<6.995000,0.000000,21.140000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.320800,0.000000,21.835697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.515697,0.000000,21.640800>}
box{<0,0,-0.050800><0.275626,0.036000,0.050800> rotate<0,44.997030,0> translate<1.320800,0.000000,21.835697> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.515697,0.000000,21.640800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710597,0.000000,21.640800>}
box{<0,0,-0.050800><0.194900,0.036000,0.050800> rotate<0,0.000000,0> translate<1.515697,0.000000,21.640800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710597,0.000000,21.640800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.905497,0.000000,21.835697>}
box{<0,0,-0.050800><0.275628,0.036000,0.050800> rotate<0,-44.996571,0> translate<1.710597,0.000000,21.640800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.905497,0.000000,21.835697>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.905497,0.000000,22.810197>}
box{<0,0,-0.050800><0.974500,0.036000,0.050800> rotate<0,90.000000,0> translate<1.905497,0.000000,22.810197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.710597,0.000000,22.810197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.100397,0.000000,22.810197>}
box{<0,0,-0.050800><0.389800,0.036000,0.050800> rotate<0,0.000000,0> translate<1.710597,0.000000,22.810197> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.490197,0.000000,22.420397>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.879994,0.000000,22.810197>}
box{<0,0,-0.050800><0.551258,0.036000,0.050800> rotate<0,-44.997260,0> translate<2.490197,0.000000,22.420397> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.879994,0.000000,22.810197>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.879994,0.000000,21.640800>}
box{<0,0,-0.050800><1.169397,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.879994,0.000000,21.640800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.490197,0.000000,21.640800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.269794,0.000000,21.640800>}
box{<0,0,-0.050800><0.779597,0.036000,0.050800> rotate<0,0.000000,0> translate<2.490197,0.000000,21.640800> }
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,36.830000>}
box{<0,0,-0.063500><17.780000,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.795000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,36.830000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.445000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,54.610000>}
box{<0,0,-0.063500><6.350000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.445000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,54.610000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.065000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,40.259000>}
box{<0,0,-0.063500><4.699000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.175000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,35.560000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,55.880000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,55.880000>}
box{<0,0,-0.063500><8.890000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,55.880000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,41.148000>}
box{<0,0,-0.063500><4.318000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.445000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.207000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.207000,0.000000,47.752000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,90.000000,0> translate<5.207000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.207000,0.000000,47.752000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.445000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,54.610000>}
box{<0,0,-0.063500><6.858000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.445000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,47.752000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.191000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.207000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,43.688000>}
box{<0,0,-0.063500><0.762000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.445000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,43.688000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.191000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,36.830000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,38.100000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.319000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,38.100000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,35.560000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.065000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,46.355000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.319000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,45.085000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,38.100000>}
box{<0,0,-0.063500><6.985000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.065000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,46.355000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,54.610000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<12.319000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,54.610000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.319000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,53.340000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<12.065000,0.000000,53.340000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,53.340000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.065000,0.000000,46.355000>}
box{<0,0,-0.063500><6.985000,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.065000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,43.688000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.175000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,47.752000>}
box{<0,0,-0.063500><4.064000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.175000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,42.672000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.191000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,43.688000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.445000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,41.148000>}
box{<0,0,-0.063500><0.254000,0.036000,0.063500> rotate<0,0.000000,0> translate<4.191000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.445000,0.000000,42.672000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,90.000000,0> translate<4.445000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,43.180000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,36.867464,0> translate<3.175000,0.000000,43.561000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,40.259000>}
box{<0,0,-0.063500><0.635000,0.036000,0.063500> rotate<0,-36.867464,0> translate<3.175000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,41.148000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.683000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,43.688000>}
box{<0,0,-0.025400><1.016000,0.036000,0.025400> rotate<0,90.000000,0> translate<4.191000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,43.688000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,36.576000>}
box{<0,0,-0.025400><4.572000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.191000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,36.576000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.191000,0.000000,36.576000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,36.576000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,54.864000>}
box{<0,0,-0.025400><18.288000,0.036000,0.025400> rotate<0,90.000000,0> translate<11.049000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<11.049000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,54.864000>}
box{<0,0,-0.025400><6.858000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.191000,0.000000,54.864000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,54.864000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.191000,0.000000,47.752000>}
box{<0,0,-0.025400><7.112000,0.036000,0.025400> rotate<0,-90.000000,0> translate<4.191000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,47.752000>}
box{<0,0,-0.063500><1.016000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,47.752000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,42.672000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.683000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,42.672000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,43.180000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.683000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.191000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,41.148000>}
box{<0,0,-0.063500><0.508000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.683000,0.000000,41.148000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,41.148000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.683000,0.000000,42.672000>}
box{<0,0,-0.063500><1.524000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.683000,0.000000,42.672000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,47.752000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,50.165000>}
box{<0,0,-0.063500><2.413000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.175000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.302000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,50.165000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.302000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.302000,0.000000,51.435000>}
box{<0,0,-0.063500><1.270000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.302000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.302000,0.000000,51.435000>}
box{<0,0,-0.063500><0.127000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.175000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.175000,0.000000,55.880000>}
box{<0,0,-0.063500><4.445000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.175000,0.000000,55.880000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.350000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.350000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.350000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.350000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.350000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.438900,0.000000,56.870828>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.705828,0.000000,56.603900>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,44.997030,0> translate<6.438900,0.000000,56.870828> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.705828,0.000000,56.603900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.972756,0.000000,56.603900>}
box{<0,0,-0.088900><0.266928,0.036000,0.088900> rotate<0,0.000000,0> translate<6.705828,0.000000,56.603900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.972756,0.000000,56.603900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.239684,0.000000,56.870828>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,-44.997030,0> translate<6.972756,0.000000,56.603900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.239684,0.000000,56.870828>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.239684,0.000000,58.205469>}
box{<0,0,-0.088900><1.334641,0.036000,0.088900> rotate<0,90.000000,0> translate<7.239684,0.000000,58.205469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<6.972756,0.000000,58.205469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<7.506613,0.000000,58.205469>}
box{<0,0,-0.088900><0.533856,0.036000,0.088900> rotate<0,0.000000,0> translate<6.972756,0.000000,58.205469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.076056,0.000000,56.603900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.076056,0.000000,58.205469>}
box{<0,0,-0.088900><1.601569,0.036000,0.088900> rotate<0,90.000000,0> translate<8.076056,0.000000,58.205469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.076056,0.000000,58.205469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.876841,0.000000,58.205469>}
box{<0,0,-0.088900><0.800784,0.036000,0.088900> rotate<0,0.000000,0> translate<8.076056,0.000000,58.205469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.876841,0.000000,58.205469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.143769,0.000000,57.938541>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,44.997030,0> translate<8.876841,0.000000,58.205469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.143769,0.000000,57.938541>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.143769,0.000000,57.404684>}
box{<0,0,-0.088900><0.533856,0.036000,0.088900> rotate<0,-90.000000,0> translate<9.143769,0.000000,57.404684> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.143769,0.000000,57.404684>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.876841,0.000000,57.137756>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,-44.997030,0> translate<8.876841,0.000000,57.137756> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.876841,0.000000,57.137756>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<8.076056,0.000000,57.137756>}
box{<0,0,-0.088900><0.800784,0.036000,0.088900> rotate<0,0.000000,0> translate<8.076056,0.000000,57.137756> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.713213,0.000000,57.671613>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.247069,0.000000,58.205469>}
box{<0,0,-0.088900><0.754987,0.036000,0.088900> rotate<0,-44.997030,0> translate<9.713213,0.000000,57.671613> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.247069,0.000000,58.205469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.247069,0.000000,56.603900>}
box{<0,0,-0.088900><1.601569,0.036000,0.088900> rotate<0,-90.000000,0> translate<10.247069,0.000000,56.603900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.713213,0.000000,56.603900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.780925,0.000000,56.603900>}
box{<0,0,-0.088900><1.067712,0.036000,0.088900> rotate<0,0.000000,0> translate<9.713213,0.000000,56.603900> }
//JP2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,55.245000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,55.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,54.610000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,53.975000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,54.610000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,52.705000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,56.515000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,57.150000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,47.625000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,46.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,46.355000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,45.085000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,44.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,48.895000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,43.815000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,42.545000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,54.610000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,55.245000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,55.245000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,52.705000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,53.975000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,53.975000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,54.610000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,53.975000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,57.150000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,57.150000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,57.150000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,56.515000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,55.245000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,56.515000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,56.515000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,47.625000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,47.625000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,45.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,46.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,46.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,48.895000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,47.625000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,48.895000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,48.895000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,42.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,43.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,44.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,40.005000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,41.275000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,41.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,41.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,40.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,37.465000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,36.195000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,34.925000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,39.370000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,33.655000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,32.385000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,28.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,31.750000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,37.465000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,37.465000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,34.925000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,36.195000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,36.830000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,38.735000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,38.735000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,32.385000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,33.655000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,34.290000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,29.845000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,27.305000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,28.575000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,31.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,31.115000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,24.765000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,26.035000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,22.225000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,23.495000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,23.495000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,22.225000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,19.685000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,18.415000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,17.145000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,21.590000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,15.875000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.605000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,13.970000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,12.065000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,10.795000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,9.525000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,13.970000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,8.255000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,6.985000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,19.685000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,17.145000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,18.415000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,19.050000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,20.955000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,20.955000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,14.605000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,15.875000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,16.510000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,12.065000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,9.525000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,10.795000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,11.430000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,13.335000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,13.335000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,8.255000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,8.890000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.350000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,6.350000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,6.985000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,6.985000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,53.340000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,55.880000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,55.880000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,53.340000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,48.260000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,25.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,38.100000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,35.560000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,33.020000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,25.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,22.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,22.860000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,17.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,20.320000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,15.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,10.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,12.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<55.880000,0.000000,7.620000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,20.320000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,17.780000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,15.240000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,12.700000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,10.160000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<58.420000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.943500,0.000000,4.445163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.134163,0.000000,4.254500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<55.943500,0.000000,4.445163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.134163,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.324825,0.000000,4.254500>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<56.134163,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.324825,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.515488,0.000000,4.445163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<56.324825,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.515488,0.000000,4.445163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.515488,0.000000,5.398475>}
box{<0,0,-0.063500><0.953313,0.036000,0.063500> rotate<0,90.000000,0> translate<56.515488,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.324825,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.706150,0.000000,5.398475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<56.324825,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.112897,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.112897,0.000000,5.398475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<57.112897,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.112897,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.684884,0.000000,5.398475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<57.112897,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.684884,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.875547,0.000000,5.207813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<57.684884,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.875547,0.000000,5.207813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.875547,0.000000,4.826487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<57.875547,0.000000,4.826487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.875547,0.000000,4.826487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.684884,0.000000,4.635825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<57.684884,0.000000,4.635825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.684884,0.000000,4.635825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.112897,0.000000,4.635825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<57.112897,0.000000,4.635825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.044944,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.282294,0.000000,4.254500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<58.282294,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.282294,0.000000,4.254500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.044944,0.000000,5.017150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<58.282294,0.000000,4.254500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.044944,0.000000,5.017150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.044944,0.000000,5.207813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<59.044944,0.000000,5.207813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.044944,0.000000,5.207813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.854281,0.000000,5.398475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<58.854281,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.854281,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.472956,0.000000,5.398475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<58.472956,0.000000,5.398475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.472956,0.000000,5.398475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.282294,0.000000,5.207813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<58.282294,0.000000,5.207813> }
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.731000,0.000000,24.130000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<6.350000,0.000000,24.130000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<7.239000,0.000000,25.019000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<7.239000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<13.081000,0.000000,23.241000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<13.081000,0.000000,25.019000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.985000,0.000000,25.019000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.985000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,25.273000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,25.273000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.620000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,22.987000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.239000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.620000,0.000000,22.987000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.620000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,25.273000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.573000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,25.146000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,25.146000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,22.987000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<12.573000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.573000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.747000,0.000000,23.114000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<7.747000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,25.273000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.081000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.700000,0.000000,22.987000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.700000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,23.241000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.335000,0.000000,25.019000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<13.335000,0.000000,25.019000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.589000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,24.130000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.589000,0.000000,24.130000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<6.858000,0.000000,24.130000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<13.462000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.223500,0.000000,25.590500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.223500,0.000000,26.734475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<10.223500,0.000000,26.734475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.223500,0.000000,26.734475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795488,0.000000,26.734475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<10.223500,0.000000,26.734475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795488,0.000000,26.734475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.986150,0.000000,26.543813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<10.795488,0.000000,26.734475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.986150,0.000000,26.543813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.986150,0.000000,26.162488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<10.986150,0.000000,26.162488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.986150,0.000000,26.162488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795488,0.000000,25.971825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<10.795488,0.000000,25.971825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.795488,0.000000,25.971825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.223500,0.000000,25.971825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<10.223500,0.000000,25.971825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.604825,0.000000,25.971825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<10.986150,0.000000,25.590500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<10.604825,0.000000,25.971825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.392897,0.000000,26.353150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.774222,0.000000,26.734475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<11.392897,0.000000,26.353150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.774222,0.000000,26.734475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.774222,0.000000,25.590500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.774222,0.000000,25.590500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.392897,0.000000,25.590500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.155547,0.000000,25.590500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<11.392897,0.000000,25.590500> }
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,27.051000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<6.350000,0.000000,27.051000> }
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<5.461000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<7.239000,0.000000,27.559000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<7.239000,0.000000,33.401000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<5.461000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,27.305000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<5.207000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<5.207000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,27.940000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,90.000000,0> translate<7.493000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,27.940000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<7.366000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<5.207000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.334000,0.000000,28.067000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.334000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,33.020000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<7.366000,0.000000,32.893000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,32.893000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.366000,0.000000,28.067000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.366000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.207000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<5.207000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,33.401000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.493000,0.000000,33.020000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.493000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.239000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.461000,0.000000,33.655000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.461000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,33.909000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<6.350000,0.000000,34.290000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,90.000000,0> translate<6.350000,0.000000,34.290000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,27.178000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-90.000000,0> translate<6.350000,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.804703,0.000000,29.146500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.804703,0.000000,30.290475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<2.804703,0.000000,30.290475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.804703,0.000000,30.290475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.376691,0.000000,30.290475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<2.804703,0.000000,30.290475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.376691,0.000000,30.290475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.567353,0.000000,30.099813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<3.376691,0.000000,30.290475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.567353,0.000000,30.099813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.567353,0.000000,29.718488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.567353,0.000000,29.718488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.567353,0.000000,29.718488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.376691,0.000000,29.527825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.376691,0.000000,29.527825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.376691,0.000000,29.527825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.804703,0.000000,29.527825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<2.804703,0.000000,29.527825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.186028,0.000000,29.527825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.567353,0.000000,29.146500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<3.186028,0.000000,29.527825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.736750,0.000000,29.146500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.974100,0.000000,29.146500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<3.974100,0.000000,29.146500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.974100,0.000000,29.146500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.736750,0.000000,29.909150>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.974100,0.000000,29.146500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.736750,0.000000,29.909150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.736750,0.000000,30.099813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<4.736750,0.000000,30.099813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.736750,0.000000,30.099813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.546088,0.000000,30.290475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<4.546088,0.000000,30.290475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.546088,0.000000,30.290475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.164763,0.000000,30.290475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<4.164763,0.000000,30.290475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<4.164763,0.000000,30.290475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.974100,0.000000,30.099813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<3.974100,0.000000,30.099813> }
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.891000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.510000,0.000000,44.450000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,45.339000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,43.561000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,45.339000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,45.339000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.145000,0.000000,45.339000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.593000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,45.466000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,45.466000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,45.466000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.307000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,43.434000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,43.434000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,43.434000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,45.593000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.307000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,43.561000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,45.339000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,45.339000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.749000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,44.450000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.749000,0.000000,44.450000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.018000,0.000000,44.450000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.622000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,43.370500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,44.514475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<12.763500,0.000000,44.514475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,44.514475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,44.514475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,44.514475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,44.514475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,44.323813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.335488,0.000000,44.514475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,44.323813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,43.942487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.526150,0.000000,43.942487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,43.942487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,43.751825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.335488,0.000000,43.751825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,43.751825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,43.751825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,43.751825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.144825,0.000000,43.751825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,43.370500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<13.144825,0.000000,43.751825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,44.323813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,44.514475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.932897,0.000000,44.323813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,44.514475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,44.514475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.123559,0.000000,44.514475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,44.514475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,44.323813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.504884,0.000000,44.514475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,44.323813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,44.133150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.695547,0.000000,44.133150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,44.133150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,43.942487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.504884,0.000000,43.942487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,43.942487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.314222,0.000000,43.942487>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<14.314222,0.000000,43.942487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,43.942487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,43.751825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.504884,0.000000,43.942487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,43.751825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,43.561163>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.695547,0.000000,43.561163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,43.561163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,43.370500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.504884,0.000000,43.370500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,43.370500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,43.370500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.123559,0.000000,43.370500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,43.370500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,43.561163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.932897,0.000000,43.561163> }
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.891000,0.000000,36.830000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.510000,0.000000,36.830000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,37.719000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,35.941000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,37.719000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,37.719000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.145000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,37.973000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,37.846000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,37.846000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,37.846000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,35.687000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,35.814000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,35.814000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,35.814000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,37.973000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,37.973000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,35.687000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,37.719000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,37.719000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.749000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,36.830000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.749000,0.000000,36.830000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.018000,0.000000,36.830000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.622000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,35.750500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,36.894475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<12.763500,0.000000,36.894475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,36.894475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,36.894475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,36.894475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,36.894475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,36.703813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.335488,0.000000,36.894475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,36.703813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,36.322488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.526150,0.000000,36.322488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,36.322488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,36.131825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.335488,0.000000,36.131825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,36.131825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,36.131825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,36.131825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.144825,0.000000,36.131825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,35.750500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<13.144825,0.000000,36.131825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,35.750500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,36.894475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<14.504884,0.000000,36.894475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,36.894475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,36.322488>}
box{<0,0,-0.063500><0.808912,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.932897,0.000000,36.322488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,36.322488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,36.322488>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<13.932897,0.000000,36.322488> }
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.891000,0.000000,39.370000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.510000,0.000000,39.370000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,40.259000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,38.481000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,38.481000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,40.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,40.259000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.145000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.513000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.513000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,38.227000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,38.227000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.513000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,40.386000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,40.386000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,40.386000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,38.227000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,38.354000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,38.354000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,38.354000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,40.513000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.513000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,40.513000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,38.227000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,38.227000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,38.481000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,40.259000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,40.259000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.749000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,39.370000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.749000,0.000000,39.370000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.018000,0.000000,39.370000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.622000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,38.290500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,39.434475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<12.763500,0.000000,39.434475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,39.434475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,39.434475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,39.434475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,39.434475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,39.243813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.335488,0.000000,39.434475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,39.243813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,38.862488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.526150,0.000000,38.862488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,38.862488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,38.671825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.335488,0.000000,38.671825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,38.671825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,38.671825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,38.671825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.144825,0.000000,38.671825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,38.290500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<13.144825,0.000000,38.671825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,39.434475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,39.434475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<13.932897,0.000000,39.434475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,39.434475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,38.862488>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.932897,0.000000,38.862488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,38.862488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.314222,0.000000,39.053150>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,-26.563298,0> translate<13.932897,0.000000,38.862488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.314222,0.000000,39.053150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,39.053150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,0.000000,0> translate<14.314222,0.000000,39.053150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,39.053150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,38.862488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.504884,0.000000,39.053150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,38.862488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,38.481163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.695547,0.000000,38.481163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,38.481163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,38.290500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.504884,0.000000,38.290500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,38.290500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,38.290500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.123559,0.000000,38.290500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,38.290500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,38.481163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.932897,0.000000,38.481163> }
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.510000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<16.891000,0.000000,41.910000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<16.510000,0.000000,41.910000> }
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<17.399000,0.000000,42.799000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<17.399000,0.000000,41.021000>}
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<23.241000,0.000000,41.021000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<23.241000,0.000000,42.799000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.145000,0.000000,42.799000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.145000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.053000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,43.053000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<17.780000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.767000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.780000,0.000000,40.767000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.780000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.053000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.733000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,42.926000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,42.926000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.767000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<22.733000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.733000,0.000000,40.894000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.907000,0.000000,40.894000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.907000,0.000000,40.894000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,43.053000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,43.053000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,43.053000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,40.767000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.860000,0.000000,40.767000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.860000,0.000000,40.767000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,41.021000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.495000,0.000000,42.799000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.495000,0.000000,42.799000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<23.749000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<24.130000,0.000000,41.910000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<23.749000,0.000000,41.910000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<17.018000,0.000000,41.910000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-0.000000,0> translate<23.622000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,40.830500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,41.974475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<12.763500,0.000000,41.974475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,41.974475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,41.974475>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,41.974475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,41.974475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,41.783813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.335488,0.000000,41.974475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,41.783813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,41.402487>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.526150,0.000000,41.402487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,41.402487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,41.211825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.335488,0.000000,41.211825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.335488,0.000000,41.211825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.763500,0.000000,41.211825>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<12.763500,0.000000,41.211825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.144825,0.000000,41.211825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.526150,0.000000,40.830500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<13.144825,0.000000,41.211825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,41.974475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.314222,0.000000,41.783813>}
box{<0,0,-0.063500><0.426334,0.036000,0.063500> rotate<0,-26.563298,0> translate<14.314222,0.000000,41.783813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.314222,0.000000,41.783813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,41.402487>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<13.932897,0.000000,41.402487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,41.402487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,41.021163>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.932897,0.000000,41.021163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,41.021163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,40.830500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<13.932897,0.000000,41.021163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.123559,0.000000,40.830500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,40.830500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<14.123559,0.000000,40.830500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,40.830500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,41.021163>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<14.504884,0.000000,40.830500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,41.021163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,41.211825>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<14.695547,0.000000,41.211825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.695547,0.000000,41.211825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,41.402487>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<14.504884,0.000000,41.402487> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.504884,0.000000,41.402487>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.932897,0.000000,41.402487>}
box{<0,0,-0.063500><0.571988,0.036000,0.063500> rotate<0,0.000000,0> translate<13.932897,0.000000,41.402487> }
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.209000,0.000000,15.240000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<21.209000,0.000000,15.240000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.701000,0.000000,14.351000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.701000,0.000000,16.129000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.859000,0.000000,16.129000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.859000,0.000000,14.351000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,14.351000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.955000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,14.097000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,14.097000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.193000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,16.383000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,16.383000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.193000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,14.097000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.240000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,14.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,14.224000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,14.224000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,16.383000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.240000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,16.256000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,16.256000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,14.097000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,14.097000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.859000,0.000000,14.097000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,16.383000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.859000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,14.351000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.605000,0.000000,14.351000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.351000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,15.240000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.970000,0.000000,15.240000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<21.082000,0.000000,15.240000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<14.478000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,14.795500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,15.939475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<22.923500,0.000000,15.939475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,15.939475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,15.939475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<22.923500,0.000000,15.939475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,15.939475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,15.748813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.495487,0.000000,15.939475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,15.748813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,15.367488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.686150,0.000000,15.367488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,15.367488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,15.176825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.495487,0.000000,15.176825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,15.176825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,15.176825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<22.923500,0.000000,15.176825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.304825,0.000000,15.176825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,14.795500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<23.304825,0.000000,15.176825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,15.939475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,15.939475>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<24.092897,0.000000,15.939475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,15.939475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,15.748813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.855547,0.000000,15.748813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,15.748813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,14.986163>}
box{<0,0,-0.063500><1.078550,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.092897,0.000000,14.986163> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,14.986163>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,14.795500>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.092897,0.000000,14.795500> }
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.590000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<21.209000,0.000000,12.700000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<21.209000,0.000000,12.700000> }
object{ARC(0.254000,0.152400,270.000000,360.000000,0.036000) translate<20.701000,0.000000,11.811000>}
object{ARC(0.254000,0.152400,0.000000,90.000000,0.036000) translate<20.701000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,90.000000,180.000000,0.036000) translate<14.859000,0.000000,13.589000>}
object{ARC(0.254000,0.152400,180.000000,270.000000,0.036000) translate<14.859000,0.000000,11.811000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,11.811000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.955000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,11.557000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,11.557000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<20.193000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,13.843000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.320000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.320000,0.000000,13.843000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.193000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,11.557000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.240000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,11.684000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,11.684000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,11.684000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.843000>}
box{<0,0,-0.076200><0.179605,0.036000,0.076200> rotate<0,44.997030,0> translate<15.240000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.367000,0.000000,13.716000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.193000,0.000000,13.716000>}
box{<0,0,-0.076200><4.826000,0.036000,0.076200> rotate<0,0.000000,0> translate<15.367000,0.000000,13.716000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,11.557000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,11.557000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.859000,0.000000,11.557000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.859000,0.000000,13.843000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,13.843000>}
box{<0,0,-0.076200><0.381000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.859000,0.000000,13.843000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,13.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,11.811000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.605000,0.000000,11.811000> }
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<14.351000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.304800 translate<13.970000,0.000000,12.700000>}
box{<0,0,-0.304800><0.381000,0.036000,0.304800> rotate<0,0.000000,0> translate<13.970000,0.000000,12.700000> }
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<21.082000,0.000000,12.700000>}
box{<-0.127000,0,-0.304800><0.127000,0.036000,0.304800> rotate<0,-180.000000,0> translate<14.478000,0.000000,12.700000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,12.255500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,13.399475>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,90.000000,0> translate<22.923500,0.000000,13.399475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,13.399475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,13.399475>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<22.923500,0.000000,13.399475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,13.399475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,13.208813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<23.495487,0.000000,13.399475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,13.208813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,12.827488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,-90.000000,0> translate<23.686150,0.000000,12.827488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,12.827488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,12.636825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<23.495487,0.000000,12.636825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.495487,0.000000,12.636825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<22.923500,0.000000,12.636825>}
box{<0,0,-0.063500><0.571987,0.036000,0.063500> rotate<0,0.000000,0> translate<22.923500,0.000000,12.636825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.304825,0.000000,12.636825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<23.686150,0.000000,12.255500>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,44.997030,0> translate<23.304825,0.000000,12.636825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,13.208813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,13.399475>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.092897,0.000000,13.208813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,13.399475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,13.399475>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.283559,0.000000,13.399475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,13.399475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,13.208813>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.664884,0.000000,13.399475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,13.208813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,13.018150>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.855547,0.000000,13.018150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,13.018150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,12.827488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.664884,0.000000,12.827488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,12.827488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,12.636825>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.664884,0.000000,12.827488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,12.636825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,12.446162>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,-90.000000,0> translate<24.855547,0.000000,12.446162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.855547,0.000000,12.446162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,12.255500>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.664884,0.000000,12.255500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,12.255500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,12.255500>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.283559,0.000000,12.255500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,12.255500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,12.446162>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.092897,0.000000,12.446162> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,12.446162>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,12.636825>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<24.092897,0.000000,12.636825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,12.636825>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,12.827488>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,-44.997030,0> translate<24.092897,0.000000,12.636825> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,12.827488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,13.018150>}
box{<0,0,-0.063500><0.269637,0.036000,0.063500> rotate<0,44.997030,0> translate<24.092897,0.000000,13.018150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,13.018150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.092897,0.000000,13.208813>}
box{<0,0,-0.063500><0.190663,0.036000,0.063500> rotate<0,90.000000,0> translate<24.092897,0.000000,13.208813> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.283559,0.000000,12.827488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<24.664884,0.000000,12.827488>}
box{<0,0,-0.063500><0.381325,0.036000,0.063500> rotate<0,0.000000,0> translate<24.283559,0.000000,12.827488> }
//U$1 silk screen
//U$2 silk screen
//U$3 silk screen
//U$4 silk screen
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,59.436000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,59.436000> }
object{ARC(1.270000,0.152400,180.000000,360.000000,0.036000) translate<35.560000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,6.604000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,6.604000>}
box{<0,0,-0.076200><13.208000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.956000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,59.436000>}
box{<0,0,-0.076200><5.334000,0.036000,0.076200> rotate<0,0.000000,0> translate<36.830000,0.000000,59.436000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.164000,0.000000,6.604000>}
box{<0,0,-0.076200><52.832000,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.164000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,59.436000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.956000,0.000000,6.604000>}
box{<0,0,-0.076200><52.832000,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.956000,0.000000,6.604000> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.298900,0.000000,61.380469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.298900,0.000000,60.045828>}
box{<0,0,-0.088900><1.334641,0.036000,0.088900> rotate<0,-90.000000,0> translate<29.298900,0.000000,60.045828> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.298900,0.000000,60.045828>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.565828,0.000000,59.778900>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,44.997030,0> translate<29.298900,0.000000,60.045828> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<29.565828,0.000000,59.778900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.099684,0.000000,59.778900>}
box{<0,0,-0.088900><0.533856,0.036000,0.088900> rotate<0,0.000000,0> translate<29.565828,0.000000,59.778900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.099684,0.000000,59.778900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.366613,0.000000,60.045828>}
box{<0,0,-0.088900><0.377493,0.036000,0.088900> rotate<0,-44.997030,0> translate<30.099684,0.000000,59.778900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.366613,0.000000,60.045828>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.366613,0.000000,61.380469>}
box{<0,0,-0.088900><1.334641,0.036000,0.088900> rotate<0,90.000000,0> translate<30.366613,0.000000,61.380469> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.936056,0.000000,60.846613>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.469913,0.000000,61.380469>}
box{<0,0,-0.088900><0.754987,0.036000,0.088900> rotate<0,-44.997030,0> translate<30.936056,0.000000,60.846613> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.469913,0.000000,61.380469>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<31.469913,0.000000,59.778900>}
box{<0,0,-0.088900><1.601569,0.036000,0.088900> rotate<0,-90.000000,0> translate<31.469913,0.000000,59.778900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<30.936056,0.000000,59.778900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<32.003769,0.000000,59.778900>}
box{<0,0,-0.088900><1.067712,0.036000,0.088900> rotate<0,0.000000,0> translate<30.936056,0.000000,59.778900> }
//X1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.399000,0.000000,16.764000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.241000,0.000000,16.764000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.399000,0.000000,16.764000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<17.399000,0.000000,21.336000>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<23.241000,0.000000,21.336000>}
box{<0,0,-0.203200><5.842000,0.036000,0.203200> rotate<0,0.000000,0> translate<17.399000,0.000000,21.336000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,17.272000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,17.272000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,17.272000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,20.828000>}
box{<0,0,-0.076200><5.842000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,20.828000> }
object{ARC(1.778000,0.152400,270.000000,450.000000,0.036000) translate<23.241000,0.000000,19.050000>}
object{ARC(2.286000,0.406400,270.000000,450.000000,0.036000) translate<23.241000,0.000000,19.050000>}
object{ARC(2.286000,0.406400,90.000000,270.000000,0.036000) translate<17.399000,0.000000,19.050000>}
object{ARC(1.778000,0.152400,90.000000,270.000000,0.036000) translate<17.399000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,19.939000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,18.161000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.574000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.574000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,18.161000>}
box{<0,0,-0.076200><0.508000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.066000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,19.939000>}
box{<0,0,-0.076200><1.778000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.066000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,19.050000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.955000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,18.161000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<20.955000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,19.939000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,19.050000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.685000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,18.161000>}
box{<0,0,-0.076200><0.889000,0.036000,0.076200> rotate<0,-90.000000,0> translate<19.685000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.955000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.590000,0.000000,19.050000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.955000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.685000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.050000,0.000000,19.050000>}
box{<0,0,-0.076200><0.635000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.050000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.668500,0.000000,22.543475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.431150,0.000000,21.399500>}
box{<0,0,-0.063500><1.374887,0.036000,0.063500> rotate<0,56.306216,0> translate<14.668500,0.000000,22.543475> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.431150,0.000000,22.543475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.668500,0.000000,21.399500>}
box{<0,0,-0.063500><1.374887,0.036000,0.063500> rotate<0,-56.306216,0> translate<14.668500,0.000000,21.399500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.837897,0.000000,22.162150>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.219222,0.000000,22.543475>}
box{<0,0,-0.063500><0.539275,0.036000,0.063500> rotate<0,-44.997030,0> translate<15.837897,0.000000,22.162150> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.219222,0.000000,22.543475>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.219222,0.000000,21.399500>}
box{<0,0,-0.063500><1.143975,0.036000,0.063500> rotate<0,-90.000000,0> translate<16.219222,0.000000,21.399500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.837897,0.000000,21.399500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<16.600547,0.000000,21.399500>}
box{<0,0,-0.063500><0.762650,0.036000,0.063500> rotate<0,0.000000,0> translate<15.837897,0.000000,21.399500> }
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  USBSIMINPUT(-32.855000,0,-31.745000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
