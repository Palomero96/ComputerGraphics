

#version 3.7;

    global_settings{
  radiosity {                  
    brightness 2.5
    pretrace_start 0.08
    pretrace_end   0.005
    count 800  
  
    error_bound 0.1
    recursion_limit 2
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
#declare Distancia = 40;
#declare Altura = 35;
#declare Suelo= 4;


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

light_source{< -170,300,-5>  10} 

                    /*      PARED */


#declare TextParedIZ = 
texture{  
     pigment{ brick
              color Black
     
               color  rgb<255/255, 221/255, 153/255>
              brick_size <1, 3, 7 >
              
              mortar 0.01 
            }   
            normal { brick 0.01 brick_size <1, 3, 7 >
              mortar 0.01 
               }  
     finish { diffuse 0.9 phong 0.4}
     } 
#declare TextParedDER = 
texture{  
     pigment{ brick
              color Black
              color  rgb<255/255, 221/255, 153/255>
              brick_size <7, 3, 1 >
              
              mortar 0.02 
            }   
            normal { brick 0.02 brick_size <7, 3, 1 >
              mortar 0.02 
               }  
     finish { diffuse 0.9 phong 0.4}
     }     

#declare TextPared_bandas=
texture{
 pigment{ gradient <0,1,0>
                color_map {
                  [0.0 color Clear]
                  [0.7 color Clear]
                  [0.7 color rgbt<128/255, 83/255, 0/255,0.95>]
                  [1.0 color rgbt<128/255, 83/255, 0/255,0.95>]
                  }
                scale <1,0.8,1>
              }  
}
     
                 
#declare ParedEnfrente= difference{
box {  //Pared de enfrente  
        < -(Distancia)-2, -Suelo, (Distancia) >,
        <  (Distancia)*2.5, Altura-6, (Distancia)+3 > 
        texture {TextParedDER} texture {TextPared_bandas}
}       
box {  //Hueco
        < -(Distancia)*0.72+7, 20, (Distancia)-0.001>,
        <  (Distancia)*2.5, 21, (Distancia)+2>
        texture{ pigment{color  rgb<255/255, 221/255, 153/255> }}
}     
    
}


#declare Paredes = union {
object{ParedEnfrente}
    box { //Pared de la izquierda
        < -(Distancia)-2, -Suelo, -(Distancia) >
        < -(Distancia)-2, Altura-5.5, (Distancia) > 
         texture {TextParedIZ} texture {TextPared_bandas}
   
    }
     
} 

object{Paredes finish {  diffuse 1 phong 0.3}  
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
    < -(Distancia)*0.451, -1-Suelo, (Distancia) >,
    < -(Distancia)*0.45,  0.01-Suelo,  (Distancia)*0.8 >
     pigment { color Black}
} 

} 
#declare hueco= box { 
        < -(Distancia)*0.72+12, -1-4, (Distancia)*0.8>,
        < -(Distancia)*0.72+15.5, 0-4, (Distancia)*0.8+0.8-0.001>
        pigment { color Clear}
    }

#declare SueloHueco = difference {
  object{Suelo} 
  object{hueco}
  } 
  
  object{SueloHueco texture{ 
          pigment {
      gradient z       
      
     color_map {                               
        [0.0 color rgb<102/255, 53/255, 0>]
        [0.3 color rgb<102/255, 53/255, 0> ]    
        [0.3 color rgb<153/255, 79/255, 0>]
        [0.6 color rgb<153/255, 79/255, 0>]
        [0.6 color rgb<128/255, 66/255, 0>]
        [1.0 color rgb<128/255, 66/255, 0>] 
      }  
     scale 0.5
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
       
    } 
    }  
#end

box { 
       <  -(Distancia)-2, Altura-6, (Distancia)-5> , 
         <  (Distancia)*2.5, Altura-5, -(Distancia) >
        
        texture { pigment {color Black}}
    } 
    
object{Techo texture { Pigtecho } finish{diffuse 0.8 reflection 0.5 phong 0.2}}
    
#declare RectTecho =  box { 
        <  -(Distancia)-2, Altura-10, (Distancia)-5> , 
        <  -(Distancia)-2+4+4.5, Altura-6, (Distancia)-5-4>
        texture { pigment{
        gradient x       
        color_map {
        
        [0.5 color rgb<26/255, 13/255, 0> ]    
        [1 color rgb<51/255, 26/255, 0>]
       
        }} 
        scale 0.2}
        finish { diffuse 1 reflection 0.1 phong 0.2 }
    }  
  
       
#for (i,0,51.6,8.56)
object{RectTecho translate<i,0,0>}
object{RectTecho translate<i,0,-4.17>}
object{RectTecho translate<i,0,-4.16*2>}
object{RectTecho translate<i,0,-4.16*3>}
#end 

 

                /* PISCINA */
               
#declare Piscina = box {    
     < -(Distancia)*0.72, -0.4-4, (Distancia)*0.8+0.8 >,
    <  (Distancia)*2.5, -(Distancia)*0.25-4, -(Distancia) >
    texture{
    pigment { rgb<0/255, 190/255,210/255> }   
     normal{ bumps 0.001 }
    }
}   


object{Piscina finish { reflection 0.5 phong 0.2}}
 
/* Esfera para utilizar de referencia*/
#declare Referencia = sphere { < -(Distancia)-2, Altura-10, (Distancia)-5>, 3 
                     texture { pigment{ color Red}
                  finish { phong 1.0 reflection 0.00}
                } // end of texture

          scale<1,1,1>  rotate<0,0,0>  translate<0,0,0>  
       }  

//object{Referencia}  

               

                /* BANCO */ 
                     
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

object{Banco pigment{color  rgb<249/255, 222/255, 162/255>} scale 2.7 translate<-39.9-2,0-4,30>}

               /* ESCALERA*/
#declare Radio=0.2; //Parametro principal a modificar parala dimension                      
                       
                       
#declare mediaescalera = union{  
  //Parte suelo
   cylinder { <0,0,0>,<0,3.00,0>, Radio 
          
                    
  }       
  //Parte curva
  object{ Segment_of_Torus ( 1.0, // radius major, 
                           Radio, // radius minor, 
                           -150  
                         ) //-----------------------------------
        
                 
                 
        scale <1,1,1> rotate<-90,180,0> translate<1,3,0>
      }
   
      
 //Parte agua               /* Cambiar el valor Y del primer punto para alargarlo mas*/
 cylinder { <0,-3,0>,<0,3.68,0>, Radio 
           
                   
               rotate<0,0,30> translate<3.7,0.32,0>    
                    
  }                      
   
  //Base
cylinder { <0,0.0001,0>,<0,0,0>, 0.50 
        
                    
         

}    
 }       
        
#declare escalera= union{             
object{mediaescalera} 
object{mediaescalera  translate<0,0,-3>}  
}
object{escalera  texture { finish { diffuse 0.6 specular 0.9 metallic phong 1 phong_size 2 } 
pigment{color Gray50}} scale 0.7 rotate<0,90,0> translate<-(Distancia)*0.72+15, 0.01-4, (Distancia)*0.8+3>} 
 
               
               /*PALO*/ 
                             
#declare Palo = cylinder { <0,0,0>,<0,8.00,0>, 0.10 
           texture { pigment { color Gray50 }
                   }
                   translate<-(Distancia)*0.72+27, 0.01-4, (Distancia)*0.8+3> 
  }       
object{Palo}               

               