//wrap the file with the version
#local Temp_version = version;
#version 3.7;
//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.13.29.645
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: https://sites.google.com/site/poseray/
//==================================================
//Files needed to run the POV-Ray scene:
//table_POV_main.ini (initialization file - open this to render)
//table_POV_scene.pov (scene setup of cameras, lights and geometry)
//table_POV_geom.inc (geometry)
//table_POV_mat.inc (materials)
//WoodSeemles1.jpg
//WoodSeemles.jpg
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 96
//Number of vertices............. 64
//Number of normals.............. 6
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 2
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-70,-50,-110)
//                      to x,y,z=(70,52.5175857543945,110)
//                 size dx,dy,dz=(140,102.517585754395,220)
//                  center x,y,z=(0,1.25879287719727,0)
//                       diagonal 280.196101666154
//Surface area................... 97800
//             Smallest face area 50
//              Largest face area 15400
//Memory allocated for geometry: 14 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H240 +FN +AM1 +A0.3 +r3 +Q9 +C -UA +MV3.7
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
 
global_settings {
  //This setting is for alpha transparency to work properly.
  //Increase by a small amount if transparent areas appear dark.
   max_trace_level 15
   adc_bailout 0.01
   assumed_gamma 1
 
}
#include "table_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0,4.44089209850063E-15,560.392203332308>
        look_at <0,4.44089209850063E-15,559.392203332308>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,0> //roll
        rotate <-25,0,0> //pitch
        rotate <0,45,0> //yaw
        translate <0,1.25879287719727,0>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <0,4.44089209850063E-15,560.392203332308> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <0,4.44089209850063E-15,0>
              rotate <0,0,0> //roll
              rotate <-25,0,0> //elevation
              rotate <0,45,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in table_POV_geom.inc with no SSLT components
object{
      table_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
