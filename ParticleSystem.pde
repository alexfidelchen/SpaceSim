
//The ParticleSystem class manages particles with an ArrayList.

class ParticleSystem {
  
  //This ArrayList keeps track of all the particles. 
  ArrayList<Particle> particles = new ArrayList<Particle>();
  PVector origin;
 
  ParticleSystem(PVector location) {
    origin = location.copy();
  }
 
  void addParticle() {
    particles.add(new Particle(origin));
  }
  
  /* run() tells each particle in the ArrayList to use their run() method. 
  Also removes dead particles from the ArrayList. 
  */
  void run() {
    for (int i = 0; i < 3; i++){
    addParticle();
    }
    Iterator<Particle> it = particles.iterator();
    while (it.hasNext()) {
      Particle p = it.next();
      p.run();
      if (p.dead()) {
        it.remove();
      }
    }

  }
  
  // When "Z" is released, endStream() removes all particles in the ArrayList.
  void endStream() { 

  Iterator<Particle> it = particles.iterator();
    while(it.hasNext()){
    Particle p = it.next(); 
    p.move();
    p.lifespan = p.lifespan - 20;
    p.display();
    if (p.dead()){
       it.remove(); 
      }
    }
  
  }
}