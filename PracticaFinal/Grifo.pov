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
//Grifo_settings.ini (initialization file - open this to render)
//Grifo.pov (scene setup of cameras, lights and geometry)
//Grifo_geom.inc (geometry)
//Grifo_mat.inc (materials)
//MGalva01.jpg
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 57914
//Number of vertices............. 35952
//Number of normals.............. 38188
//Number of UV coordinates....... 35952
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(-1.04560005664825,-1.85669994354248)
//                        to u,v=(2.04559993743896,2.80890011787415)
//Bounding Box....... from x,y,z=(-0.0685499981045723,-0.212099999189377,-0.141500011086464)
//                      to x,y,z=(0.0685499981045723,0.212099999189377,0.141499996185303)
//                 size dx,dy,dz=(0.137099996209145,0.424199998378754,0.283000007271767)
//                  center x,y,z=(0,0,-7.45058059692383E-9)
//                       diagonal 0.528044554655099
//Surface area................... 0.101416422812302
//             Smallest face area 4.99942420795207E-9
//              Largest face area 0.000695209735759483
//Memory allocated for geometry: 6 MBytes
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
#include "Grifo_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0,0,1.0560891093102>
        look_at <0,0,0.0560891093102005>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,-1.63581304711018> //roll
        rotate <2.8313744747141,0,0> //pitch
        rotate <0,85.8486770757708,0> //yaw
        translate <0,0,-7.45058059692383E-9>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <0,0,1.0560891093102> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <0,0,0>
              rotate <0,0,-1.63581304711018> //roll
              rotate <2.8313744747141,0,0> //elevation
              rotate <0,85.8486770757708,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in Grifo_geom.inc with no SSLT components
object{
      Faucet_Axor_Citterio_HighArc_Kitchen_N210818_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
