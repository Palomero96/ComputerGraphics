
global_settings{ assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
/* Camara*/
#declare Camera_0 = camera { angle 75     
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}

camera{Camera_0}
/* LUZ */
light_source{<1500,2500,-2500>*4 color White fade_distance 1500}

/* CIELO */
plane{ <0,1,0>,1 hollow  
       texture{ pigment { color rgb <0.20, 0.20, 1.0> }
                finish  { ambient 0.25 diffuse 0 } 
              }      
       scale 10000}
  


/* MAR*/
plane{ <0,1,0>, 0 
       texture{ Polished_Chrome
                normal { crackle 0.15 scale <0.35,0.25,0.25> turbulence 0.5 } 
                finish { reflection 0.90}
              }
     }
  
/* NUBES*/  
#declare nube = sphere { 0,2 hollow
  texture { pigment { rgbt 1 } }
  interior {
    media { absorption 1 scattering { 1 .1 }
      density { spherical
        scale <1,.5,1>
        warp { turbulence .3 }
        density_map { [0 rgb 0][.1 rgb 1] }
      }
    }
  }
}
/*RAYOS */    
#declare rayo =  box { <0,0,0>,< 1.5, 1.5, 1.5>   

      pigment { 
          
      julia <0, 1>, 33
      interior 1, 1 
      color_map{
      [0.0   color White filter 1]
      [0.28  color White filter 1]
      [0.9  color White]
      [1.0   color White] } 
       
     scale <1,1,1>*0.46 translate<0.5,1,6>
    }

      scale <1,1,1> rotate<0,0,0> translate<0,0,0> 
    } 

object {nube scale 1.4  translate<0.7,2.2,0> no_shadow}
object {nube scale 1.4 rotate<0,0,25> translate<-1.5,2.4,0> no_shadow}  
//object {nube scale 0.6 rotate<0,0,27> translate<1.25,2,0>}
//object {nube scale 3 translate<-0,6,15>}
//object {nube scale 0.7 translate<-1,2.2,0>}

object {rayo scale 2 translate<0,0.1,3>}
object {rayo scale 2 translate<-2.4,0.1,3>}
object {rayo scale 2 translate<-5,0.1,5>} 
object {rayo scale 2 translate<2.5,.1,3>} 


 

  