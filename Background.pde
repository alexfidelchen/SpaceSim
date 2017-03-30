
// The Background class creates nebulas in the background. 

class Background {
  
  /* The Background class creates nebulas using Processing's noise() function,
  which creates Perlin Noise. 
  */
  
  float xSpace = 0; 
  float ySpace = 0;
  
  /* xSpace and ySpace help keep track of the Perlin noise values. The 
  noise values change overtime. 
  */
  
  Background() {
    /* Upon initialization, the object loads the pixels in the display
    window and fills it with Perlin noise. 
    */
    loadPixels();
    for (int x = 0; x < width; x++){
      colorMode(HSB,255,100,100); 
      ySpace = 0; 
      for (int y = 0; y < height; y++){
        float bright = map(noise(xSpace,ySpace),0,1,0,15);
        pixels[(y * width) + x] = color(160,41,bright);
        ySpace = ySpace + 0.01;
      }
      xSpace = xSpace + 0.004;
    }
    colorMode(RGB,255,255,255);
    // Change the color mode back to RGB for other classes. 
    updatePixels();
    
  }

}