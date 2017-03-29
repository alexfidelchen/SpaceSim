
/* SpaceSim, An interactive spaceship simulator. 
   Created by Alex Chen 
   Inspired by Shiffman's The Nature of Code. 
*/
  
Spaceship ship1;
ParticleSystem ps1;
Starfield sf1;
Background bg;
PImage particle; 


void setup(){
  
  /* There are two main components to this simulation: the spaceship 
  and the background. The spaceship and its propulsion are created
  by the Spaceship, Particle and ParticleSystem classes. The background 
  is generated with the Background class and the Starfield class. 
  */
  size(1500,500);
  background(0);
  sf1 = new Starfield();
  ship1 = new Spaceship();
  ps1 = new ParticleSystem(ship1.location.copy());
  bg = new Background();
  particle = loadImage("particle.png");
}
void draw(){
  blendMode(ADD);    
  // "ADD" brightens the spaceship's propulsion.
  updatePixels();
  // Loads the nebulas created by bg. 
  sf1.run();
  ship1.run(ps1);
  
}