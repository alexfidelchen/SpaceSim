
// The Particle class visualizes propulsion when the spaceship moves foward.

import java.util.*;
Random generator = new Random();

class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration = new PVector(0,0);
  float lifespan = 255;
  int fColor = 80;            //Flame color.
  float mass  = 1;
  
  Particle(PVector l) {
    location = l.copy();
    float velX = (float) generator.nextGaussian()*0.3;
    float velY = (float) generator.nextGaussian()*0.3;
    velocity = new PVector (velX, velY);
    
  }
  
  void move() {
    /* The particle moves by adding the velocity vector to the particle's location.
    Each particle fades overtime until it becomes completely transparent and "dies".
    */
    velocity.add(acceleration);
    location.add(velocity);
    /* lifespan determines particle's transparency. Overtime, the particle 
    becomes completely transparent. 
    */
    lifespan = lifespan - 1; 
    /* fColor determines the particle's color. Starts white, but becomes bluer
    overtime. 
    */
    fColor = fColor - 1; 
    /* Set the particle's acceleration back to zero, so the acceleration does not
    accumulate and move unreasonably fast. 
    */
    acceleration.mult(0);         
  }
  
  void display() {
  imageMode(CENTER);
  // Set HSB's limits to (360,100,100) so it matches the HSB's typical range . 
  colorMode(HSB,360,100,100); 
  
  tint(188,50,fColor,lifespan);
  image(particle,location.x,location.y);
  // Change the colorMode back to RGB so the other classes' colors are unaffected. 
  colorMode(RGB,255,255,255); 
  } 

  // Checks if  a particle is dead or not. 
  boolean dead(){
    /* A particle is dead when lifespan <= to 0, i.e. the particle is completely
    transparent. Once a particle is dead, it is removed from its particle system.
    */
    if (lifespan < 0) {
      return true;
    } else {
      return false;
    }
  }
  
 //Run() runs all the particle's important methods. 
   void run() {
     move();
     display();
   }
}