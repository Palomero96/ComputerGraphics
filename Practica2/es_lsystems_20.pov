/*
 * @file 		lsystems.pov
 * @desc		A basic L-System parser and printer
 *              Here is a macro which parses L-System language string, useful to generate 
 *              old fashioned but interesting bidimensional fractals
 * @ver 		1.0.1
 * @date 		16/04/2004
 * @auth 		Paolo Gibellini
 * @mailto 		p.gibellini@teinos.com
 * @ref 		An Introduction to Lindenmayer Systems (http://www.cogs.susx.ac.uk/users/gabro/lsys/lsys.html)
 * @ref 		Samples of LSE (http://www.generation5.org)
 * @todo		A better documentation and a better parser... ;-)
 */

#version 3.5;

#include "colors.inc"

#include "textures.inc"
//#include "glass.inc"
#include "metals.inc"
#include "golds.inc"

global_settings {
  assumed_gamma 1.0
}
// ----------------------------------------

// ToDo: adaptive camera ------------------
camera {
  location  <0, 0, -20>
  look_at   <2, 0,  0>
}

light_source {
  <0, 0, 0>
  color rgb <1, 1, 1>
  translate <-5, 10, -20>
}
// ----------------------------------------

// Textures -------------------------------
#declare t_orange = texture {
	pigment{color rgb<1,0.25,0>}
	finish {ambient 0.15 diffuse 0.85 phong 1}
}
#declare t_white = texture { 
	pigment{color rgb<1,1,1>}
	finish {ambient 0.15 diffuse 0.85 phong 1}
}
#declare t_tex_orange=texture{
	checker
		texture{t_orange} 
		texture{t_white}
		scale <0.1, 0.1, 0.1>
}

#declare t_purple = texture {
	pigment{color rgb<85,0,6>/255}
	finish {ambient 0.15 diffuse 0.85 phong 1}
}

#local hm=<0.95,0.95,1>;
#declare t_mirror=texture{
    pigment{color rgb hm}
    finish {  
        //ambient .2  
        //diffuse .6
        //phong 0.275
        //phong_size 50
        //specular 1.0
        //roughness 0.001
        reflection 0.9
    }
    normal{
        //agate 0.05
        //granite 0.051
        //bumps 0.5
        //marble 0.2
        //wrinkles 0.4
        //crackle 0.4
        agate 0.02
        //turbulence 0.5
    }
    //scale 0.01
    scale 0.1
}


#declare t_tex_orange=texture{
	checker
		texture{t_purple} 
		texture{t_mirror}
		scale 0.1
}


#declare t_tex_blue=texture{ 
	pigment{ color rgb<0.2,0.5,0.8>}
}

#local h=<.3,.2,.1>;
#local h=<0.2,0.5,0.8>;
#local h=<1.0,0.9,0.4>;
#declare t_tex_blue=texture{ 
	pigment{
		function {y*(y-z)-x*(x+y)}
		colour_map{
			[.08 rgb h]
			[.1  rgb h*4.6]
			[.12 rgb h*8]
			[.32  rgb h*2.1]
			[.48 rgb h]
			[0.8 rgb 0]
		}
	}
	finish{
		ambient.35
		brilliance 2
		diffuse.3
		specular.8
		reflection.1
	}
	scale 0.1
}

#declare t_tex_green=texture{ 
	pigment{ color rgb<0.2,0.8,0.5>}
}
// Trees leaves texture
#declare t_leaves=texture {      
	pigment {
		agate
		color_map {
			[ 0.0     rgbt <0.3663, 0.5682, 0.0687, 1.0> ]
			[ 0.25    rgbt <0.3663, 0.5682, 0.0687, 0.82> ]
			[ 0.31    rgbt <0.0887, 0.9886, 0.4438, 0.01> ]
			[ 0.39    rgbt <0.1308, 0.9083, 0.5524, 0.2> ]
			[ 0.80    rgbt <0.1755, 0.5095, 0.448, 0.43> ]
			[ 1.0     rgbt <0.1755, 0.5095, 0.448, 1.0> ]
		}
		turbulence 0.6
		ramp_wave
	}
	normal {
		agate
		turbulence 0.6
		ramp_wave
	}      
	finish {
		ambient 0.1
		diffuse 0.5
		phong_size 81.0
		roughness 0.0
	}
	//scale 2.1 // mmm... to be tested
	scale 0.3
}
#declare t_tex_green=texture{t_leaves} 

#declare t_tex_asteroid=texture {      
     pigment {
        bozo
        color_map {
           [ 0.0     rgbft <0.51, 0.51, 0.51, 0.0, 0.0> ]
           [ 1.0     rgbft <1.0, 1.0, 1.0, 0.0, 0.0> ]
        }
        turbulence 0.6
        omega 0.8
        lambda 3.0
        ramp_wave
     }      
     normal {
        bumps , 1.0
        scale  <0.75, 0.75, 1.0>
        turbulence 0.6
        octaves 5
        omega 0.65
        lambda 3.0
        frequency 0.0
        ramp_wave
     }      
     finish {
        ambient 0.15
        specular 0.2
     }
}
#declare t_tex_aster_cloud=texture {      
     pigment {
        bozo
        color_map {
           [ 0.0     rgbft <0.51, 0.51, 0.51, 0.0, 0.0> ]
           [ 1.0     rgbft <1.0, 1.0, 1.0, 0.0, 0.0> ]
        }
        turbulence 0.6
        omega 0.8
        lambda 3.0
        ramp_wave
     }      
     normal {
        bumps , 1.0
        scale  <0.75, 0.75, 1.0>
        turbulence 0.6
        octaves 5
        omega 0.65
        lambda 3.0
        frequency 0.0
        ramp_wave
     }      
     finish {
        ambient 0.15
        specular 0.2
     }  
}
#declare t_bg=texture{
	pigment { color rgb <1,0.65,0.0> }
}

#local h2=<1,0.98,0.76>;
#declare t_moon_light=texture{
	pigment {
		agate
		color_map{
			[ 0 rgb h2*.98]
			[.3 rgb h2*.76]
			[.5 rgb h2*.65]
			[.7 rgb h2*.76]
			[ 1 rgb h2*.98]
		}
		turbulence .61
		scale 2.3
	}
	normal {
		agate
		turbulence .61
		scale 2.3
	}
}
#local h2=<0.2,0.5,0.8>;
#declare t_blue_moon_light=texture{
	pigment {
		agate
		color_map{
			[ 0 rgb h2*.98]
			[.3 rgb h2*.76]
			[.5 rgb h2*.65]
			[.7 rgb h2*.76]
			[ 1 rgb h2*.98]
		}
		turbulence .61
		scale 2.3
	}
	normal {
		agate
		turbulence .61
		scale 2.3
	}
}
#declare t_bg=texture{t_blue_moon_light}

#declare t_golden_thing=texture{
 	T_Gold_2A
    normal {granite .75 scale 0.15 }
}

// ----------------------------------------

// Defaults -------------------------------
#declare t_coord=<0,0,0>; 	// Current coordinates
#declare t_angle=0;			// Current angle
#declare t_lpath=1;       	// Path length
#declare t_dir=6;			// Rotation=360/directions
#declare t_level=0;			// current level
#declare l_dim=0.05;		// Line diameter
#declare r_init="=";		// Rule init
#declare r_end=";";			// Rule end
#declare n_rules=0;			// Num rules
#declare n_max_rules=100;	// Max num rules
#declare n_max_stacks=200;	// Max stacks number
#declare a_coord_stack=array[n_max_stacks];		// Coordinates Stack
#declare a_angle_stack=array[n_max_stacks];		// Angles stack
#declare n_curr_stack=0;
#declare t_rules="";		// Final rule
// ----------------------------------------

// Drawing functions ----------------------

// Line from... to..., diameter, texture, translation, rotation
#macro lineto(from, to, dim, tex, trasla, ruota)
    union {
    	cylinder {from, to, dim}
    	sphere {from, dim}
    	sphere {to, dim}
	    texture{tex}
	    translate trasla
	    rotate ruota
	}
#end

// Moves turtle
#macro turtle_move(regola, tex, trasla, ruota)
	#local n_rules=strlen(regola);
	#local n_currule=0;
	#while(n_currule<n_rules)
		#local n_currule=n_currule+1;
		#switch (asc(substr(regola,n_currule,1)))
			#case (asc("F"))	// Forward and line
				#local old_t_coord=t_coord;
				#declare t_coord=z*t_coord+x*(t_coord+t_lpath*cos(t_angle*pi/180))+y*(t_coord-t_lpath*sin(t_angle*pi/180));
				lineto(old_t_coord,t_coord,l_dim, tex, trasla, ruota)
			#break
			#case (asc("f"))	// Forward
				#declare t_coord=z*t_coord+x*(t_coord+t_lpath*cos(t_angle*pi/180))+y*(t_coord+t_lpath*sin(t_angle*pi/180));
			#break
			#case (asc("+"))	// Angle increment
				#declare t_angle=t_angle+360/t_dir;
			#break
			#case (asc("-"))	// Angle decrement
				#declare t_angle=t_angle-360/t_dir;
			#break
			#case (asc("|"))	// Angle increment of 180°
				#declare t_angle=t_angle+180;
			#break
			#case (asc("*"))	// Increase step size by 10%
				#declare t_lpath=t_lpath*1.1;
			#break
			#case (asc("/"))	// Decrease step size by 10%
				#declare t_lpath=t_lpath/1.1;
			#break
			#case (asc(","))	// Increase step size randomly - ToDo
				#declare t_lpath=t_lpath;
			#break
			#case (asc("["))	// Stack push - only n_max_stacks levels
				#declare a_coord_stack[n_curr_stack]=t_coord;
				#declare a_angle_stack[n_curr_stack]=t_angle;
				#declare n_curr_stack=n_curr_stack+1;
			#break
			#case (asc("]"))	// Stack pop - only n_max_stacks levels
				#declare n_curr_stack=n_curr_stack-1;
				#declare t_coord=a_coord_stack[n_curr_stack];
				#declare t_angle=a_angle_stack[n_curr_stack];
			#break
		#end
	#end
#end
// ----------------------------------------

// String rewriting system ----------------

// for now 'carattere' is just a char, not a string
#macro str_replace(stringa,carattere,con)
	#local n=0;
	#local n_tmp=strlen(stringa);
	#declare str_replaced="";
	#while(n<n_tmp)
		#local n=n+1;
		#if(asc(substr(stringa,n,1))=asc(carattere))
			#declare str_replaced=concat(str_replaced,con);
		#else
			#declare str_replaced=concat(str_replaced,substr(stringa,n,1));
		#end
	#end
#end

// for now 'carattere' is just a char, not a string
#macro str_pos(stringa,carattere)
	#local n=0;
	#local n_tmp=strlen(stringa);
	#declare str_position=0;
	#while(n<n_tmp)
		#local n=n+1;
		#if(asc(substr(stringa,n,1))=asc(carattere))
		    #declare str_position=n;
		    #local n=n_tmp;
		#end
	#end
#end


// Declares and fills array with rules, a_rules_k ed a_rules_v
// (e.g. a_rules_k[0]="F", a_rules_v[0]="F-F++F-F")
// Rules are defined by "char=rule;", e.g. "F=FXF;X=[-F+F+F]+F-F-F+;" or "F=F-F++F-F;"
// No formal controls, max n_max_rules rules
#macro fill_array_rules(rules)
	// Generate temporary array
	#declare n_rules=0;
	#local n_tmp=strlen(rules);
	#local n=0;
	#local k_tmp="";
	#local v_tmp="";
	#local is_k=1;
	#local is_v=0;
	#local a_tmp_k=array[n_max_rules];
	#local a_tmp_v=array[n_max_rules];
	// Count rules to dimensionate array
	#while(n<n_tmp)
		#local n=n+1;
		#switch (asc(substr(rules,n,1)))
			#case(asc(r_init))	// Init a rule
				#local is_k=0;
				#local is_v=1;
			#break
			#case(asc(r_end))	// End a rule: store the data
				#declare n_rules=n_rules+1;
				#local is_k=1;
				#local is_v=0;
				#local a_tmp_k[n_rules-1]=k_tmp;
				#local a_tmp_v[n_rules-1]=v_tmp;
				#local k_tmp="";
				#local v_tmp="";
			#break
			#case(asc(" "))		// Avoid garbage
			#break
			#else				// Concat data
				#if(is_k=1)
					#local k_tmp=concat(k_tmp,substr(rules,n,1));
				#end
				#if(is_v=1)
					#local v_tmp=concat(v_tmp,substr(rules,n,1));
				#end
		#end           
	#end

	// Declares rules array
	#declare a_rules_k=array[n_rules];
	#declare a_rules_v=array[n_rules];
	// Fills array
	#local i=0;
	#while(i<n_rules)
		#declare a_rules_k[i]=a_tmp_k[i];
		#declare a_rules_v[i]=a_tmp_v[i];
		#local i=i+1;
	#end
#end

// Rewriting system (a bit invented..)
#macro parse_string(axiom, a_rules_k, a_rules_v, n_step)
	#local axiom_applicato=axiom;
	// Sobstitution of rules to axiom
	#local i_s=0;
	#while(i_s<n_step)
		#local i=0;
		#local init_axiom=axiom_applicato;
		#while(i<n_rules)
		    str_pos(init_axiom,a_rules_k[i])
		    #if(str_position>0)
			    str_replace(axiom_applicato,a_rules_k[i],a_rules_v[i])
			    #local axiom_applicato=str_replaced;
			#end
			#local i=i+1;
		#end
		#local i_s=i_s+1;
	#end
	// Updates final rules
	#declare t_rules=axiom_applicato;
#end 
// ----------------------------------------

// Tools ----------------------------------

// Init the turtle
#macro init_turtle(axiom, rules, directions, n_step, tex, trasla, ruota)
	#declare t_dir=directions;
	// By now...
	#declare t_lpath=t_lpath/n_step;
	fill_array_rules(rules)
	parse_string(axiom, a_rules_k, a_rules_v, n_step)
	turtle_move(t_rules, tex, trasla, ruota)
#end
// ----------------------------------------

// Background -----------------------------
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}


plane {
  z, 400
  texture{t_bg}
}
// ----------------------------------------

// Sample Output --------------------------      
/*
#declare the_sun=union{
	init_turtle("X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X+X", "X=[F+F+F+F[---X-Y]+++++F++++++++F-F-F-F];Y=[F+F+F+F[---Y]+++++F++++++++F-F-F-F];", 24, 2, t_tex_blue, 0, 0)
}
#declare l_dim=0.02;
#declare candy_cane=union {
	init_turtle("F+F+F", "F=F-F++F-F;", 5, 4, t_tex_orange, <-1.2,-1,-19>, 0)
}
#declare l_dim=0.2;
#declare the_cloud=union{
	init_turtle("F+F+F", "F=F-F++F-F;", 5, 4, t_tex_aster_cloud, 0, 0)
}

#declare t_coord=<0,0,0>;
#declare t_angle=0;
#declare t_lpath=2;
#declare l_dim=0.2;
#declare the_thing=union{
	init_turtle("F++F++F++F++F", "F=F++F++F|F-F++F;", 10, 2, t_golden_thing, 0, 0)
}   
*/
#declare t_coord=<0,0,0>;
#declare t_angle=0;
#declare t_lpath=1;
#declare l_dim=0.1;
#declare the_tree=union{
	init_turtle("X", "X=F[+X]F[-X]+X;F=FF;", 20, 7, 
	//texture{t_tex_green /*scale 5*/ }
	texture{pigment {color rgb <1,1,0>}}
    , 0, 0)
}

// Scene
//object{the_sun scale 8 translate <6,60,100> no_shadow}

//object{the_cloud scale 20 translate <14,15,30> rotate -15*z scale 0.8*y  no_shadow}

object{the_tree rotate 70*z translate <-14,-20,0>}
//object{the_tree rotate 70*z translate <0,-21,0> scale <-0.7,1.3,1> translate <20,-5,2>}

//object{the_thing scale 1  rotate 36*z translate <-3,-8,0> no_shadow}

//object{candy_cane}

// ----------------------------------------

