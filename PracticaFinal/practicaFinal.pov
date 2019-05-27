

#version 3.7;
global_settings{ 
 /* radiosity {                  
    brightness 3
    pretrace_start 0.08
    pretrace_end   0.005
    count 800  
  
    error_bound 0.1
    recursion_limit 2 500 0.7
  } */
           
 radiosity {
      pretrace_start 0.08
      pretrace_end   0.005
      count 500

      nearest_count 10
      error_bound 0.7
      recursion_limit 4

      low_error_factor 0.5
      gray_threshold 1
      minimum_reuse 0.015
      brightness 3

      
    }
    }
#default{ finish{ ambient 0.2 diffuse 0.6}} 

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
#include "Refrigerator_POV_geom.inc" //Geometry  
#include "Grifo_geom.inc" //Geometry

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

light_source{< -20,25,50>  5}

plane{ <0,0,1>, 200 pigment{color rgb<51/255,255/255,255/255> }}
                /* Paredes */
/* Pared de enfrente */          
#declare ParedText=  texture{
       	pigment { color rgb<0/255,102/255,204/255> } 
      	//normal {bozo 10 scale 0.05}
       } 
       
 //Para hacer el marco de la ventana               
#declare paredEnfrente= difference{
	  box {    //Pared de enfrente
        < -(Distancia/4), 0, (Distancia/2) >,
        <  (Distancia/4), Altura, (Distancia/2)>
       texture{ ParedText}
    }
    box {    //Marco ventana
        < -(Distancia/4)+1.5, Altura-6.5, (Distancia/2)+0.0001 >,
        <  -(Distancia/4)+5.5, Altura-2.5, (Distancia/2)-0.0001>
        
    }
}      
 
       
#declare paredEnfrente=union{
	object{paredEnfrente}
	   box {    //marco ventana
        < -(Distancia/4)+1.5, Altura-6.5, (Distancia/2) >,
        <  -(Distancia/4)+5.5, Altura-2.5, (Distancia/2)>
       texture{
        pigment{color rgb<204/255,153/255,0/255>}
        finish{diffuse 0.8 specular 0.4}
       }
    }
}

//Para hacer los huecos de los dos cristales
#declare paredEnfrente=difference{
	object{paredEnfrente}	
	   box {    //Hueco cristal
        < -(Distancia/4)+1.7, Altura-6.3, (Distancia/2)+0.0001 >,
        <  -(Distancia/4)+3.4, Altura-2.7, (Distancia/2)-0.0001>
    }
     box {    //Hueco cristal
        < -(Distancia/4)+5.3, Altura-6.3, (Distancia/2)+0.0001 >,
        <  -(Distancia/4)+3.6, Altura-2.7, (Distancia/2)-0.0001>
    }
}
#declare textureCristal=texture{
  pigment{ rgbf<0.98,0.98,0.98,0.8>}
  finish { diffuse 0.1
           reflection 0.05
           specular 0.8
           roughness 0.0003
           phong 1
           phong_size 400}
  }
#declare paredEnfrente=union{
	object{paredEnfrente}	
	   box {    //Hueco cristal
        < -(Distancia/4)+1.7, Altura-6.3, (Distancia/2)>,
        <  -(Distancia/4)+3.4, Altura-2.7, (Distancia/2)>
        texture{textureCristal}
    }
     box {    //Hueco cristal
        < -(Distancia/4)+5.3, Altura-6.3, (Distancia/2)>,
        <  -(Distancia/4)+3.6, Altura-2.7, (Distancia/2)>
         texture{textureCristal}
    }
}	     
   
/*Pared de la derecha*/
#declare paredDer=difference{
	    box {   //Pared de la derecha
        < (Distancia/4), 0, -(Distancia/2) >,
        < (Distancia/4), Altura, (Distancia/2) >
     texture{ ParedText}
    }
	    box {  
        < (Distancia/4)+0.0001, 0, (Distancia/2)-3.5>,
        < (Distancia/4)-0.0001, Altura-3.5, (Distancia/2)-0.5 >  
    }	
}
#declare paredDer=union{
	object{paredDer}
	//Puerta 
	box {  
        < (Distancia/4), 0, (Distancia/2)-3.5>,
        < (Distancia/4), Altura-3.5, (Distancia/2)-0.5 >
        texture{
         pigment{color White}
         finish{diffuse 0.8 specular 0.5 reflection 0.1}
        }
    }	

	
}
                
#declare Paredes = union {
	object{paredEnfrente}
       box {   //Pared de la izquierda
        < -(Distancia/4), 0, -(Distancia/2)>,
        < -(Distancia/4), Altura, (Distancia/2) > 
         texture{ ParedText}
    }	
 	object{paredDer}
}   

object{Paredes}
 
 
/* ENCIMERA*/
#declare encimera= union{
 	box {  
        < (Distancia/4), 0, (Distancia/2)-4>,
        < (Distancia/4)-2.8, 2.3, -(Distancia/2) > 
         texture{T_Wood12}
         //pigment{color Brown}
    }	
  	box {  //Piedra de marmol de la encimera
        < (Distancia/4), 2.5, (Distancia/2)-3.8>,
        < (Distancia/4)-2.9, 2.3, -(Distancia/2) > 
        texture{
         pigment{color rgb <200/255,200/255,200/255>}
         normal{marble 1.3 scale 0.5 turbulence 1.2}
         finish{diffuse 0.9}
        }
    }	  
 
}
#declare encimera=difference{
object{encimera}
	  	box {  //Hueco de lavadero Habra que cambiarle el color
        < (Distancia/4)-0.6, 2, (Distancia/2)-4.4>,
        < (Distancia/4)-2.6, 2.5+0.0001, (Distancia/2)-8 > 
         pigment{color rgb<140/255,140/255,140/255>}
    }	 
}


object{encimera}
//Creamos separadores para simular los cajones
#declare separador1 = box {  
        < (Distancia/4)-2.8, 1, (Distancia/2)-4>,
        < (Distancia/4)-2.8002, 1.015 , (Distancia/2)-7.7 > 
         pigment{color Black}
    }
object{separador1}
#declare separador2 = box {  
        < (Distancia/4)-2.8, 0, (Distancia/2)-7.72>,
        < (Distancia/4)-2.8002, 2.3 , (Distancia/2)-7.7 > 
         pigment{color Black}
    }
 object{separador2} 
 
 #declare separador3 = box {  
        < (Distancia/4)-2.8, 0, (Distancia/2)-10.51>,
        < (Distancia/4)-2.8002, 2.3 , (Distancia/2)-10.5> 
         pigment{color Black}
    }
 object{separador3} 
 #declare separador4 = box {  
        < (Distancia/4)-2.8, 0.812, (Distancia/2)-14>,
        < (Distancia/4)-2.8002, 0.8 , (Distancia/2)-10.51 > 
         pigment{color Black}
    }
  object{separador4}     
 #declare separador5 = box {  
        < (Distancia/4)-2.8, 1.612, (Distancia/2)-14>,
        < (Distancia/4)-2.8002, 1.6 , (Distancia/2)-10.51 > 
         pigment{color Black}
    }
  object{separador5}   
/*TIRADORES ENCIMERA*/   
#declare tirador=union{
cylinder {
	<0.0, 0, 0.0>, <0.0, 0.25, 0.0>, 0.008	
}
cylinder {
	<0.0, 0.05, 0.0>, <0.05, 0.05, 0>, 0.008
}
cylinder {
	<0.0, 0.2, 0>, <0.05, 0.2, 0>, 0.007		
}
texture{
pigment{color rgb<155/255,155/255,155/255>}
finish{diffuse 0.8 specular 0.7}
}
scale 2.7
rotate x*90	
}	
object{tirador translate<(Distancia/4)-2.9, 0.7, (Distancia/2)-6.25> }
object{tirador translate<(Distancia/4)-2.9, 2, (Distancia/2)-6.25> }
object{tirador translate<(Distancia/4)-2.9, 2, (Distancia/2)-9.5> }
object{tirador translate<(Distancia/4)-2.9, 2, (Distancia/2)-12> } 
object{tirador translate<(Distancia/4)-2.9, 1.3, (Distancia/2)-12>}

#declare vitro=
	box {  //Vitro
        < (Distancia/4)-0.6, 2.53, (Distancia/2)-11>,
        < (Distancia/4)-2.6, 2.5, (Distancia/2)-20 > 
        texture {
        	   pigment{color Black}
        	finish{diffuse 0.8 specular 0.4}
        }
    }
	
object{vitro }

#declare cajones= 
  	box {  
        < (Distancia/4), 4.5, (Distancia/2)-3.8>,
        < (Distancia/4)-2, 7, -(Distancia/2) > 
              texture{
         pigment{color rgb <240/255,240/255,240/255>}
                 }
    }	   

object{cajones}
#declare relieve= union{
  	box {  
        < (Distancia/4), 4.8, (Distancia/2)-4.3>,
        < (Distancia/4)-2.02, 6.7, (Distancia/2)-7.7> 
         pigment{
     	gradient z
     	color_map{
     	[0.0  color White]
     	[0.95  color White]
     	[1  color Black]	
     	}
     	scale 0.5
     	}
    }	  
    	box {  
        < (Distancia/4), 4.8, (Distancia/2)-8.3>,
        < (Distancia/4)-2.02, 6.7, -(Distancia/2)> 
         pigment{
     	gradient z
     	color_map{
     	[0.0  color White]
     	[0.95  color White]
     	[1  color Black]	
     	}
     	scale 0.5
     	}
    }	
     
    
}   
object{relieve}
#declare separadorc = box {  
      < (Distancia/4), 4.5, (Distancia/2)-8>,
        < (Distancia/4)-2.01, 7, (Distancia/2)-8.01 > 
         pigment{color Black}
    }
object{separadorc}
#declare tiradorvertical=union{
cylinder {
	<0.0, 0, 0.0>, <0.0, 0.25, 0.0>, 0.008	
}
cylinder {
	<0.0, 0.05, 0.0>, <0.05, 0.05, 0>, 0.008
}
cylinder {
	<0.0, 0.2, 0>, <0.05, 0.2, 0>, 0.007		
}
texture{
pigment{color rgb<155/255,155/255,155/255>}
finish{diffuse 0.8 specular 0.7}
}
scale 2.7

}
object{tiradorvertical translate<(Distancia/4)-2.1, 5.25, (Distancia/2)-7.9> }
//object{tiradorvertical translate<(Distancia/4)-2.1, 5.25, (Distancia/2)-8.2> }

       /* TECHO */
#declare Techo=box {
    < -(Distancia/4), Altura, -(Distancia/2) >,
    <  (Distancia/4), Altura + 1,  (Distancia/2) >
    pigment { color White }
}      
object{Techo}  


                /* Suelo */      
#declare Suelo = box {
    < -(Distancia/4), -1, -(Distancia/2) >,
    <  (Distancia/4),  0,  (Distancia/2) >
    texture{
    	pigment{ brick
              color Black
              	color rgb<102/255, 51/255, 0/255>
              // color mortar, color brick
              brick_size <0.5, 0.0525, 0.125 >
              // format in x-,y-,z- direction
              mortar 0.002 // size of the mortar
            }
            finish{diffuse 0.7}
        }
 
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
 
object{
      Refrigerator_   finish{diffuse 0.7 reflection 0.1} scale 0.0030      rotate y*-90  translate < -4, 0, 1.85 >
      } 
object{
      Faucet_Axor_Citterio_HighArc_Kitchen_N210818_  finish{diffuse 0.8 specular 0.7}  scale 2.2 rotate y*-90  translate < (Distancia/4)-1, 3, (Distancia/2)-6.5>
      }      
           
           
 

                