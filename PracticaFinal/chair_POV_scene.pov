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
//chair_POV_main.ini (initialization file - open this to render)
//chair_POV_scene.pov (scene setup of cameras, lights and geometry)
//chair_POV_geom.inc (geometry)
//chair_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 682
//Number of vertices............. 418
//Number of normals.............. 1376
//Number of UV coordinates....... 569
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.0017,0.0017)
//                        to u,v=(0.9968,0.9986)
//Bounding Box....... from x,y,z=(-9.6352,-10.6158,-1.3641)
//                      to x,y,z=(1.5681,10.6066,9.4796)
//                 size dx,dy,dz=(11.2033,21.2224,10.8437)
//                  center x,y,z=(-4.03355,-0.00459999999999994,4.05775)
//                       diagonal 26.3341987221939
//Surface area................... 654.100386744853
//             Smallest face area 0.0183978648911158
//              Largest face area 12.82809903
//Memory allocated for geometry: 109 KBytes
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
#include "chair_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <0,-2.60208521396521E-18,52.6683974443878>
        look_at <0,-2.60208521396521E-18,51.6683974443878>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,-6.55328444442253> //roll
        rotate <-1.7031921247606,0,0> //pitch
        rotate <0,14.206917478273,0> //yaw
        translate <-4.03355,-0.00459999999999994,4.05775>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <0,-2.60208521396521E-18,52.6683974443878> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <0,-2.60208521396521E-18,0>
              rotate <0,0,-6.55328444442253> //roll
              rotate <-1.7031921247606,0,0> //elevation
              rotate <0,14.206917478273,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in chair_POV_geom.inc with no SSLT components
object{
      chair_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
