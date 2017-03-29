![Title Image](https://github.com/alexfidelchen/SpaceSim/blob/master/title.png)
---
__SpaceSim is an interactive spaceship simulator created in Processing.__ The simulation's background was generated with Perlin Noise and a sine wave. The spaceship's propulsion was created with a basic particle system. 

[The Nature of Code](http://natureofcode.com/book/) inspired this simulation. 

# Controls 
Left and Right Arrow Keys - Rotate the ship. 

"Z" - Move the ship forward.

# Notes/Bugs
The user cannot rotate and move the spaceship forward at the same time. 

When the user presses "Z" for the first time, the background shifts slightly to the left. 

Rotating the spaceship causes the spaceship's associated ParticleSystem object to stop removing particles from its ArrayList. This can cause propulsion to appear in a location away from the spaceship.
