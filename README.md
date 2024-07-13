# Recreating Pong  
### As part of the 20 Game Challenge  
https://20_games_challenge.gitlab.io/  
  
Work in progress - Using Godot 4 to try to re-create the classic video game Pong.  
  
  
To Do:  
1. Create Startup Menu  
1. Add scoreboard UI elements  
1. Add functionality to update scoreboard on score, respawn ball or end game when reaching eleven points  
	1. When observing gameplay, I noticed that after the ball respawns after a score, it always moves towards the player that was scored on, not the scoring player  
1. Make ball reflect based on where it hits the paddle (hitting closer to top of paddle means the ball reflects upwards instead of current reflective angle)  
  
  
Known Bugs:  
1. Ball can carry paddles away if it collides at certain angles.
1. Timer on ball is not aligned.