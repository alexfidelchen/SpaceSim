
// The Starfield class generates a starfield that lays on top of the background. 

class Starfield{ 
  
  /* Upon initialization, the Starfield object generates the location of 
  each star in the starfield and places it in an ArrayList. The y-coordinate
  of each star is determined by a sin() function offset by a number from 
  the Guassian distribution. The stars form a loose sine wave. 
  */
  
  ArrayList<PVector> stars = new ArrayList<PVector>();
  // The properties below help determine each star's y-coordinate. 
  float angle = 0;
  float aVelocity = 0.003;
  float amp = 50;                         // Amplitude
  float startAngle = 0;                   // Determines first star's y-coordinate.
  // Stars and particles are represented with the same image.  
  PImage star = loadImage("particle.png"); 
  // Twinkle Counter. Keeps track when the stars twinkle. 
  int twinkleC = 0; 
  
  Starfield(){
  star.resize(5,0);
    
  // Fill the starfield's arrayList with locations for each star. 
  for (float x = 0; x <= width; x = x + 0.6) { 
      float y =  amp * sin(angle) + (float) generator.nextGaussian()* 100;
      float z = 200 + (float) generator.nextGaussian()*100;
      stars.add(new PVector(x,y,z));
      angle = angle + aVelocity;
    }
    
    
  }
  
  // Displays the starfield
  void createWave(){
    pushMatrix();
    translate(0,height/2);
    for (PVector v: stars){
      tint(#99ecff,v.z);
      image(star,v.x,v.y);
    }
    popMatrix();
  }
  
  void twinkle(){
    // Every 30 seconds, twinkle 10 stars. 
    if (twinkleC % 30 == 0) {
    for(int t = 0; t < 10; t++){
    pushMatrix();
    translate(0,height/2);
    int random = (int) random(stars.size());
    PVector twinkle = stars.get(random);
      tint(255);
      image(star,twinkle.x,twinkle.y);
    popMatrix();
    }
    }
    twinkleC++;
  }
  
  // run() makes it easy to run all of starfield's methods. 
  void run(){
    createWave();
    twinkle();
  }
}