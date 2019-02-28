#include "shapes.inc"
#include "shapes2.inc" 
#include "shapes3.inc"
#include "textures.inc"
#include "colors.inc"
 #include "glass.inc"
    /* PLANO DE LA PARED*/
plane { <-1,0,1>,  1
                    pigment{ color rgb< 0.96, 0.96, 0.96> } //  color White
                    rotate <0, -2, 0>
                    translate <-10,1,10>
   
 
      }
      
    /* PLANO DE LA MESA*/      
plane { <0,-1,0>, 15 
                  pigment{ color rgb< 1, 1, 1> }
      }      
      
    /* CAMARAS*/   
#declare Camera_0 = camera {location  <50, -3,-60>   // Localizacion defecto 50, -3,-60
                            look_at   <0.0, 1.0,  0.0>   // point center of view at this point <X,Y,Z>
                            right x*image_width/image_height}
#declare Camera_1 = camera {// diagonal view
                            location  <25,10,-95>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
                            
#declare Camera_2 = camera {        // top view
                            location  <20 , 15 ,-30>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {        // pruebas  <0, 20 ,-5>
                            location  <19 , 0 ,2>
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>} 
                            
                            
#declare Camera_4 = camera {        // top view
                            location  <-2, 20 ,-6>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}                                                       
                            
                            

    /* LUZ*/
light_source { <1000,1000,-2000> 
               color 1
               } 
    
        /* JARRON ROJO*/                              

#declare jarronrelleno = lathe{ cubic_spline 6,
    <0, 0>, <1.2, 0>,<3.4, 6.3>,<1.2, 11.5>,<0.7,17>,<0.6, 17>   
   texture {
      pigment {
    color Red   transmit 0.1
 }
    } 
    interior{ior 1}
     sturm
    no_shadow
     
    scale<1,1,1>*2.3
    translate <21,-16,-6>
 }  

#declare jarron = difference{
object{jarronrelleno}
object{jarronrelleno scale 0.9}
}

object{jarron}
   
      /*VASO DE CRISTAL*/

/*base del vaso de cristal*/   
#declare basevaso = lathe{ cubic_spline 10,
  <0,0>,<3.2, 1> ,<3.7, 2>, <3.7, 4>, <3.7, 5>, <3.45, 6>,<3.2, 7>,<3.05, 8>,<2.95, 9>, <2.95, 10> 
    scale<1,1,1>*1
    translate <0,0,-0>
 }  
 
 /* Toroide para el borde de arriba del vaso */
#declare bordevaso = torus { 2.8,0.25  rotate<0,0,0>
          
        scale <1,1,1> translate<0,9,0>
      }               
//Vaso
#declare vaso = merge{ 
object{basevaso} 
object{bordevaso}
 }


        /* LAPIZ*/

#declare partenegra = object{ Hexagon  
        scale <12,0.7,0.7>*1.00
        texture{ pigment{ color rgb<0,0,0> }}
         rotate<0,0,90> translate<0,0,0>
      } 

#declare partepequenia = object{ Hexagon  
        scale <0.3,0.71,0.71>*1.00
        texture{ pigment{ color rgb<1,0,0> }}
        rotate<0,0,90> translate<0,-10,0>
      }   
 
#declare puntagrande = cone { <0,0,0>,0.71,<0,2.7,0>,0 
       texture { pigment{ color rgb<1,0.80,0.60>}}
       scale <1,1,1> rotate<0,0,0> translate<0,12,0>         
     }
    
#declare puntasmall = cone { <0,0,0>,0.27,<0,1,0>,0 
       texture { pigment{ color rgb<0,0.0,0.0>}} 
       scale <1,1,1> rotate<0,0,0> translate<0,13.7,0>         
     }      

#declare lapiza = merge{
object{partepequenia}
object{partenegra}           
object{puntagrande} 
object{puntasmall}
}     
 #declare lapiz =object{lapiza scale<0.95,1.1,0.95>}            

    /*CAJITA*/
    
  #declare formacaja = superellipsoid {<0.5, 0.00001>  

    scale<8.0,4,1.2>
    rotate<90,90,0>
    translate<-2.5,1,0>
    }   
#declare caja = union{
object{formacaja}
 object{formacaja scale<1,0.7,1> translate<0,2.5,0>}

}  



/* CANICAS*/  
#declare canica=sphere { <0,0,0>, 0.9
        texture { 
                }
          scale<1,1,1>   translate<0,0,0>  
       } 
    
#declare cajacanicas = union{ 
object{caja texture{pigment { color White filter 0.6} }}                 
object{canica texture { pigment{ color Blue}} translate<-0.1,1,-5.8>}//1
object{canica texture { pigment{ color Blue}} translate<-1.7,1,-6.7>}//2
object{canica texture { pigment{ color Orange}}translate<-3.6,1,-6.6>}
object{canica texture { pigment{ color Green}}translate<-5,1,-5.4>}
object{canica texture { pigment{ color Brown}}translate<-3.1,1,-4.8>}
object{canica texture { pigment{ color Blue}} translate<-1.8,1,-3.4>}
object{canica translate<-0,1,-4>}
object{canica texture { pigment{ color Orange}} translate<-0.3,1,-2.2>}
object{canica texture { pigment{ color rgb<102/256, 102/256, 51/256>}} translate<-4.4,1,-3.4>}
object{canica texture { pigment{ color rgb<102/256, 102/256, 51/256> }} translate<-3,1,-2.1>}
object{canica texture { pigment{ color Orange}}translate<-4.7,1,-1.5>}
 
}
object{cajacanicas rotate<0,15,0> translate<22,-15 ,-28>} 

#declare vasolapices = union{
object {vaso texture {pigment { color White filter 0.6} }  interior{ior 1} no_shadow scale 0.9}
object{lapiz no_shadow rotate<6,0,-30> translate<2.3,13.6,2> scale 0.65}
object{lapiz no_shadow rotate<2,0,-27> translate<1.3,13.6,2.2> scale 0.65}
object{lapiz no_shadow rotate<20,-10,15> translate<-2,13.6,3.5> scale 0.65} 
object{lapiz no_shadow rotate<-20,5,-27> translate<0.5,14,-2> scale <0.75,0.65,0.65>}

object{lapiz no_shadow rotate<-40,-15,5> translate<0,13,-3.2> scale 0.65}
object{lapiz no_shadow rotate<-30,-15,5> translate<-1,13,-2.5> scale 0.65}
object{lapiz no_shadow rotate<-31,80,0> translate<-3,13,-1.7> scale 0.65}
object{lapiz no_shadow rotate<-29,20,0> translate<-1,13.5,-1> scale 0.60}
}
 camera{Camera_0}

object{vasolapices translate <19.5,-12 ,-26>}      
 