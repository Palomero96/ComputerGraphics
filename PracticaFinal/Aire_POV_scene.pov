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
//Aire_POV_main.ini (initialization file - open this to render)
//Aire_POV_scene.pov (scene setup of cameras, lights and geometry)
//Aire_POV_geom.inc (geometry)
//Aire_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 12948
//Number of vertices............. 7072
//Number of normals.............. 15636
//Number of UV coordinates....... 7072
//Number of lines................ 0
//Number of materials............ 8
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(-397.581359863281,-172.083312988281)
//                        to u,v=(1.0056734085083,125.079406738281)
//Bounding Box....... from x,y,z=(-397.581359863281,-148.58137512207,0.839588880538938)
//                      to x,y,z=(397.581359863281,148.581359863281,206.994750976563)
//                 size dx,dy,dz=(795.162719726563,297.162734985352,206.155162096024)
//                  center x,y,z=(0,-7.62939453125E-6,103.917169928551)
//                       diagonal 873.549879952917
//Surface area................... 1268081.96598103
//             Smallest face area 9.29576344788074E-7
//              Largest face area 80794.7138882582
//Memory allocated for geometry: 1 MByte
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
#include "Aire_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0,0,1747.09975990583>
        look_at <0,0,1746.09975990583>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,0> //roll
        rotate <-25,0,0> //pitch
        rotate <0,45,0> //yaw
        translate <0,-7.62939453125E-6,103.917169928551>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <0,0,1747.09975990583> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <0,0,0>
              rotate <0,0,0> //roll
              rotate <-25,0,0> //elevation
              rotate <0,45,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in Aire_POV_geom.inc with no SSLT components
object{
      Aire_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
