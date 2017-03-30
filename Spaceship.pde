
/* The Spaceship class creates a spaceship that user interacts with. 
    The user can rotate the spaceship and thrust it forward. Upon 
    thrust, the spaceship calls the ParticleSystem class to display
    propulsion. 
*/

class Spaceship {

  //Below is the spaceship's location, velocity and acceleration. 
  PVector location = new PVector(width/2,height/2);   
  PVector velocity = new PVector(0,0);
  PVector acceleration = new PVector(0,0);
  float angle = PI/2;           //Angle the ship is facing. 
  
  Spaceship() {
  }

  // The thrust() method moves the spaceship forward. 
  void thrust() { 
    
    /* When thrust() is called and the user presses "Z", thrust()
    converts the spaceship's polar coordinates into cartesian coordinates, 
    then adds the result to the spaceship's acceleration vector. The 
    acceleration is then added to the velocity vector, which is added
    to the location vector. The addition to the location vector moves
    the spaceship in the direction it is facing. The thrust() method 
    also runs a ParticleSystem object to display propulsion. When the user
    releases "Z", drag is applied to the spaceship and the ParticleSystem
    object removes all of its particles. 
  */
  
    if (keyPressed == true){
      if (key == 'z'){ 
      println("z is pressed!");
      float r = 1;                //Polar coordinates' radius.
      float dirX = r * cos(angle);    
      float dirY = r * sin(angle);
      /* Processing cannot read polar coordinates, so the coordinates must convert
      to Cartesian coordinates.
      */
      acceleration = new PVector(dirX, dirY);
      /*  If "Z" is pressed, move the spaceship by adding to the acceleration vector.
        */
      ps1.run();
      } 
      } else {
        PVector drag = drag();
        acceleration.add(drag);
        ps1.endStream();
      }
    velocity.add(acceleration);
    velocity.limit(5);
    //Once the velocity gets really low, set the velocity to 0..
    if (velocity.mag() < 0.3) {
      velocity.setMag(0);
    }
    location.add(velocity);
    acceleration.mult(0);
  }
  
  float rotateShip() {
    if (keyPressed == true){
      if (key == CODED){
        if (keyCode == LEFT){ 
        // Rotate the ship left with the left arrow key. 
        return angle = angle + (-0.05); 
        } else if (keyCode == RIGHT) {
        return angle = angle + (0.05);
        } 
      }
    } else {
      return angle;
    }
    return angle;
  }
  
  // Displays spaceship
  void display() {
  fill(150,125);
  noStroke();
  translate(location.x,location.y);
  angle = rotateShip();           // The direction the ship is facing.
  rotate(angle);
  triangle(40,0,-30,-20,-30,20);
  rect(-35,-20,5,10);
  rect(-35,10,5,10);
  }
  
  // Helps debug the Spaceship class. 
  void debug() {
    println(" ");
    println("Current angle: " + angle);
    println("Current acceleration: " + "(" + acceleration.x + "," + acceleration.y +")");
    println("Current velocity: " + "(" + velocity.x + "," + velocity.y +")");
    println("Current velocity: " + velocity.mag());
    println("Current location: " + "(" + location.x + "," + location.y +")");
  }
  
  // If a ship goes outside the display window, it appears on the opposite side.
  void checkBounds(){
    if (location.x < 0){
      location.x = width;
    } else if (location.x > width){
      location.x = 0;
    }
    if (location.y < 0){
      location.y = height;
    } else if (location.y > height) {
      location.y = 0;
    }
  }
  
  //When the spaceship stops thrusting, it applies drag on itself to slow down. 
  PVector drag() {
    PVector dragForce = velocity.copy();
    float c = 0.005; // Strength of the drag
    float magnitude = dragForce.mag();
    float dragForceMag = c * magnitude * magnitude * -1;
    dragForce.normalize(); // Make it the unit velocity vector
    dragForce.mult(dragForceMag);
    return dragForce;   
  }
  
  //Makes it simple to run all the spaceship's required methods. 
  void run (ParticleSystem ps) {
    ps.origin = ship1.location.copy();
    rotateShip();
    debug();
    checkBounds();
    thrust();
    display();
  }
  
  
}