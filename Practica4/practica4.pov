

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
      brightness 2.5

      
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
#declare Distancia = 40;
#declare Altura = 35;
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

/*ORDEN
1. Objetos
2. Texturas:   Pared Techo y piscina
3. Iluminacion: Sombras del techo? 

*/

/* Z de alante atras
 X de izquierda y derecha
*/
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {               // front view
                            location  <-(Distancia)*0.72, 3, -(Distancia)*0.53>
                            right     x*image_width/image_height
                            look_at   <-(Distancia)*0.72, 5.0 , (Distancia)>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90  //right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {        // top view
                            location  <0.0 , 150.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
camera{Camera_0}

light_source{< -170,300,-5>  1} 
//light_source { <10000000, 0, -10000000>, 1 media_interaction off }  //-160,300,-25  -90,150,20       -400, 500,0



 

                    /*      PARED */

/* Es posible que las paredes tengan que tener mas grosor
    En especial la del frente porque hay que quitarle algo (dos objetos: una tira y un hueco)
*/ 


#declare TextPared = 
texture{  
     pigment{ brick
              color Black
              color  rgb<249/255, 222/255, 162/255>
              // color mortar, color brick
              brick_size <1, 2, 3 >
              // format in x-,y-,z- direction
              mortar 0.02 // size of the mortar
            }
    // normal { scale 1 turbulence 1.0 }  //revisar que poner a la parte de arriba
     finish { diffuse 0.9 phong 0.4}
     }

     
                 
#declare ParedEnfrente= difference{
box {  //Pared de enfrente  
        < -(Distancia)-2, -Suelo, (Distancia) >,
        <  (Distancia)*2.5, Altura-6, (Distancia)+3 >
} 
box {  //Hueco
        < -(Distancia)*0.72+7, 20, (Distancia)-0.001>,
        <  (Distancia)*2.5, 21, (Distancia)+2>
        texture{ pigment{ color rgb<74/255, 37/255, 0>}} //cambiar color
}     
    
}


#declare Paredes = union {
object{ParedEnfrente}
    box { //Pared de la izquierda
        < -(Distancia)-2, -Suelo, -(Distancia) >
        < -(Distancia)-2, Altura-5.5, (Distancia) > 
        
   
    }
     
} 

object{Paredes finish {  diffuse 1 phong 0.3}  texture {TextPared}
} 

                      /*      SUELO     */
#declare Suelo = union {
box {     //Suelo izquierda
    < -(Distancia)-2, -1-Suelo, -(Distancia) >,
    < -(Distancia)*0.72,  0-Suelo,  (Distancia) >
       
}
box {     //Suelo izquierda linea
    < -(Distancia)*0.721,  -1-Suelo,  -(Distancia)>,
    < -(Distancia)*0.72,  0.01-Suelo,  (Distancia) >
     pigment { color Black}  
} 

box {     //Suelo Derecha
    < -(Distancia)*0.72, -1-Suelo, (Distancia) >,
    < (Distancia)*2.5,  0-Suelo,  (Distancia)*0.8 >
    
} 
box {     //Suelo Derecha  linea
    < -(Distancia)*0.453, -1-Suelo, (Distancia) >,
    < -(Distancia)*0.45,  0.01-Suelo,  (Distancia)*0.8 >
     pigment { color Black}
} 

} 
#declare hueco= box { 
        < -(Distancia)*0.72+12, -1-4, (Distancia)*0.8>,
        < -(Distancia)*0.72+15.5, 0-4, (Distancia)*0.8+0.8>
        pigment { color White  filter 1}
    }

#declare SueloHueco = difference {
  object{Suelo} 
  object{hueco}
  } 
  
  object{SueloHueco texture{ //pigment {color rgb<74/255, 37/255, 0>}
          pigment {
      gradient z       //this is the PATTERN_TYPE
      color_map {
        [0.4 color rgb<74/255, 37/255, 0>]
        [0.5 color rgb<204/255, 153/255, 0> ]    
        [0.55 color Black]
        [0.6 color rgb<204/255, 153/255, 0>]
        [0.8 color rgb<74/255, 37/255, 0>]
      }
      
     scale 0.25
    }
          
  }
    finish{diffuse 1 }
  
  } 
  
  
  
        /* TECHO */
    
 #declare Pigtecho =
      
      
     texture{ 
      
     
    pigment{ 
              color  rgb<204/255, 153/255, 102/255> 
               
          
            } }
                                 
#declare Techo =  box { 
        < -(Distancia)-3, Altura-10, (Distancia)-5 >, 
         //<  (Distancia)*2.5, Altura-6, (Distancia) >
        <  (Distancia)*2.5, Altura-6, (Distancia) >
        texture { Pigtecho}
    } 
    
#declare Techo = difference{
 object{Techo}
  box { 
        < -(Distancia)+-2, Altura-10.0001, (Distancia)+0.1 >,
        <  -(Distancia)+3-2, Altura-5.9999, (Distancia)-5.0001 >
        
    }
} 
  
#for (i,0,36,4) 
#declare Techo = difference{
 object{Techo}
 
    box { 
        < -2-(Distancia)+4+i+i/4+0.01, Altura-10.001, (Distancia)+0.1 >,
        <  -2-(Distancia)+8+i+i/4+0.01, Altura-5.9999, (Distancia)-5.0001 >
       // pigment { color  rgb<204/255, 153/255, 102/255>}
    } 
    }  
#end

box { 
       <  -(Distancia)-2, Altura-6, (Distancia)-5> , 
         <  (Distancia)*2.5, Altura-5, -(Distancia) >
        
        texture { pigment {color Black}}
    } 
    
object{Techo texture { Pigtecho } finish{diffuse 1 emission 0.9}}
    
#declare RectTecho =  box { 
        <  -(Distancia)-2, Altura-10, (Distancia)-5> , 
         //<  (Distancia)*2.5, Altura-6, (Distancia) >
        <  -(Distancia)-2+4+4.5, Altura-6, (Distancia)-5-4>
        texture { pigment{
        gradient x       
          color_map {
        
        [0.5 color rgb<102/255, 51/255, 0> ]    
        
        [1 color rgb<153/255, 77/255, 0>]
       
        }} 
        scale 0.2}
        finish { diffuse 1 phong 1 }
    }  
  
       
//object{RectTecho} 
//object{RectTecho translate<8.55,0,0>}
//object{RectTecho translate<17.2,0,0>}
#for (i,0,51.6,8.56)
object{RectTecho translate<i,0,0>}
object{RectTecho translate<i,0,-4.17>}
object{RectTecho translate<i,0,-4.16*2>}
object{RectTecho translate<i,0,-4.16*3>}
#end 

/*#for (i,0,22.5,6)
box { 
        <  -(Distancia)-2+0.1+i, Altura-10, (Distancia)-5> , 
         //<  (Distancia)*2.5, Altura-6, (Distancia) >
        <  -(Distancia)-2+4+4.5+0.1+i, Altura-6, (Distancia)-5-4>  
        pigment{color Brown} }
 //object{RectTecho translate<0.5+i,0,0>}                          
 //object{RectTecho translate<0,0,0>}
      
#end */ 

                /* PISCINA */
/* Es posible que haya que anadir otra caja para el hueco de la escalera*/                
                
#declare Piscina = box {    
     < -(Distancia)*0.72, -0.4-4, (Distancia)*0.8+0.8 >,
    <  (Distancia)*2.5, -(Distancia)*0.25-4, -(Distancia) >
    pigment { color Blue }
}   


object{Piscina finish { diffuse 0.8 reflection 0.5 phong 0.2}}
 
/* Esfera para utilizar de referencia*/
#declare Referencia = sphere { < -(Distancia)-2, Altura-10, (Distancia)-5>, 3 
                     texture { pigment{ color Red}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  

//object{Referencia}  

               

                /* BANCO */ 
/*Revisar dimensiones cuando coloque la camara*/      
                
#declare GrosorBanco=0.2;
#declare AlturaBanco=0.8;
 
#declare Banco= union{ 
box {     //Pata
    < 0, 0, 0 >,
    < AlturaBanco,  AlturaBanco, GrosorBanco >
   
}  
box {     //Pata
    < 0, 0, 0 >,
    < AlturaBanco,  AlturaBanco, GrosorBanco >
      
    translate<0,0,2>
}    
box {     //Senton
    < 0, AlturaBanco-GrosorBanco*1.2, GrosorBanco >,
    < AlturaBanco,  AlturaBanco,  2 >
    
} 
}

object{Banco pigment{color  rgb<204/255, 153/255, 102/255>} scale 2.7 translate<-39.9-2,0-4,30>}

               /* ESCALERA*/
#declare Radio=0.2; //Parametro principal a modificar parala dimension                      
                       
/* Revisar dimensiones despues de colocar la camara */                       
#declare mediaescalera = union{  
  //Parte suelo
   cylinder { <0,0,0>,<0,3.00,0>, Radio 
          //texture {finish {Metal}}
                    
  }       
  //Parte curva
  object{ Segment_of_Torus ( 1.0, // radius major, 
                           Radio, // radius minor, 
                           -150  
                         ) //-----------------------------------
        //texture {finish {Metal}}  
                 
                 
        scale <1,1,1> rotate<-90,180,0> translate<1,3,0>
      }
   
      
 //Parte agua               /* Cambiar el valor Y del primer punto para alargarlo mas*/
 cylinder { <0,-3,0>,<0,3.68,0>, Radio 
           ///texture {finish {Metal}}
                   
               rotate<0,0,30> translate<3.7,0.32,0>    
                    
  }                      
   
  //Base
cylinder { <0,0.0001,0>,<0,0,0>, 0.50 
        //texture {finish {Metal}}
                    
         

}    
 }       
        
#declare escalera= union{             
object{mediaescalera} 
object{mediaescalera  translate<0,0,-3>}  
}
object{escalera  texture { finish { diffuse 0.4 specular 0.9 metallic } 
pigment{color Gray50}} scale 0.7 rotate<0,90,0> translate<-(Distancia)*0.72+15, 0.01-4, (Distancia)*0.8+3>} 
 
               
               /*PALO*/ 
/* Es posible que haya que poner otro cilindro o hacerlo con un spline porque hay diferente grosor*/               
               
#declare Palo = cylinder { <0,0,0>,<0,8.00,0>, 0.10 
           texture { pigment { color Gray50 }
                   }
                   translate<-(Distancia)*0.72+27, 0.01-4, (Distancia)*0.8+3> 
  }       
object{Palo}               

               