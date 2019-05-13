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
//Refrigerator_POV_main.ini (initialization file - open this to render)
//Refrigerator_POV_scene.pov (scene setup of cameras, lights and geometry)
//Refrigerator_POV_geom.inc (geometry)
//Refrigerator_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 38004
//Number of vertices............. 19419
//Number of normals.............. 22143
//Number of UV coordinates....... 228
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 8
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(2.78275340548362E-8,0)
//                        to u,v=(1,1)
//Bounding Box....... from x,y,z=(-304.753997802734,0.021721910685269,-314.528717041016)
//                      to x,y,z=(558.990295410156,1735.57751464844,519.906066894531)
//                 size dx,dy,dz=(863.744293212891,1735.55579273775,834.434783935547)
//                  center x,y,z=(127.118148803711,867.799618279561,102.688674926758)
//                       diagonal 2110.56616157963
//Surface area................... 5292407.93167786
//             Smallest face area 0.00263087013924633
//              Largest face area 47025.6666893653
//Memory allocated for geometry: 3 MBytes
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
#include "Refrigerator_POV_geom.inc" //Geometry
 
//CAMERA PoseRayCAMERA
camera {
        perspective
        up <0,1,0>
        right -x*image_width/image_height
        location <5.6843418860808E-14,-4.54747350886464E-13,4221.13232315925>
        look_at <5.6843418860808E-14,-4.54747350886464E-13,4220.13232315925>
        angle 32.9346087425027 // horizontal FOV angle
        rotate <0,0,-0.405828939929628> //roll
        rotate <7.53858000957831,0,0> //pitch
        rotate <0,-176.087421806478,0> //yaw
        translate <127.118148803711,867.799618279561,102.688674926758>
        }
 
//PoseRay default Light attached to the camera
light_source {
              <5.6843418860808E-14,-4.54747350886464E-13,4221.13232315925> //light position
              color rgb <1,1,1>*1.6
              parallel
              point_at <5.6843418860808E-14,-4.54747350886464E-13,0>
              rotate <0,0,-0.405828939929628> //roll
              rotate <7.53858000957831,0,0> //elevation
              rotate <0,-176.087421806478,0> //rotation
             }
 
//Background
background { color srgb <1,1,1>  }
 
//Assembled object that is contained in Refrigerator_POV_geom.inc with no SSLT components
object{
      Refrigerator_
      }
 
//restore the version used outside this file
#version Temp_version;
//==================================================
