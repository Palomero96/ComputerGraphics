

#version 3.7;
global_settings{ 

          
ambient_light rgb<1, 0, 1> 
 radiosity {
      pretrace_start 1.
      pretrace_end   0.01
      count 200

      nearest_count 10
      error_bound 0.8
      recursion_limit 4

      low_error_factor 0.5
      gray_threshold 1
      minimum_reuse 0.015
      brightness 3

      
    }}
#default{ finish{ ambient 0.2 diffuse 0.7}} 

//--------------------------------------------------------------------------
#include "colors.inc"
#include "textures.inc"      
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc" 
#include "shapes3.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
#include "table_POV_geom.inc" //Geometry
#include "chair_POV_geom.inc" //Geometry  
#include "Aire_POV_geom.inc" //Geometry
#declare Distancia = 20;
#declare Altura = 10;
#declare Suelo= 4;
/* Practica Final  
Elementos
- Mesa
- Cuatro sillas
- Ventana
- Reloj
- Mueble/Encimera
- Puerta?
Escena: Noche con luz encendida, Dia con sol entrando por la ventana 
*/



/* Z de alante atras
 X de izquierda y derecha
*/
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {               // front view
                            location  <-(Distancia/2)*0.72, 3, -(Distancia/2)*0.53>
                            right     x*image_width/image_height
                            look_at   <-(Distancia/2)*0.72, 5.0 , (Distancia/2)>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <0, 3 ,-4>
                            right     x*image_width/image_height
                            look_at   <0.0 , 3 , (Distancia/2)>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {        // top view
                            location  <0.0 , 50.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_1}

light_source{< -170,300,-5>  1}

                /* Paredes */
#declare Paredes = union {
    box {    //Pared de enfrente
        < -(Distancia/4), 0, (Distancia/2) >,
        <  (Distancia/4), Altura, (Distancia/2) >
    }
    box {   //Pared de la derecha
        < (Distancia/4), 0, -(Distancia/2) >,
        < (Distancia/4), Altura, (Distancia/2) >
    }
    box {   //Pared de la izquierda
        < -(Distancia/4), 0, -(Distancia/2) >,
        < -(Distancia/4), Altura, (Distancia/2) > 
    }
    pigment { color Blue }    
}   

object{Paredes}
       
       /* TECHO */
#declare Techo=box {
    < -(Distancia/4), Altura, -(Distancia/2) >,
    <  (Distancia/4), Altura + 1,  (Distancia/2) >
    pigment { color White }
}      
//object{Techo}  


                /* Suelo */      
#declare Suelo = box {
    < -(Distancia/4), -1, -(Distancia/2) >,
    <  (Distancia/4),  0,  (Distancia/2) >
    pigment { color Grey }
}
 
object{Suelo}  
    
    
    /*Objetos generados con Poseray */
object{
      table_  scale <0.023,0.020,0.026>  rotate y*90  translate < -1.4, 1, 8.2 >
      }  
      
object{
      chair_  scale 0.12     translate < -2, 1, 6 >
      } 
      
object{
      chair_  scale 0.12     translate < 0.4, 1, 6 >
      }   
        
object{
      chair_  scale 0.12    rotate y*90 translate < -4.7, 1, 7.9 >
      }          
object{
      chair_  scale 0.12    rotate y*-90 translate < 2, 1, 8.6 >
      }      

object{
      Aire_    scale 0.0032    rotate x*180 rotate z*180 translate < 3, 8, 10 >
      } 
 
      
 //object{chair_}           
 

                