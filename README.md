# HaloGE2Assignment

# Demo Video
![YouTube](https://img.youtube.com/vi/JPefroIliTg/mqdefault.jpg) 
[Video Link](https://www.youtube.com/watch?v=JPefroIliTg&feature=youtu.be)

# Description of the assignment
The assignment is made with a halo theme and follows my initial storyboard which can be seen below, the only difference was I wasnt able to make the same ending because I simply couldnt find good map objs and with the time I had I couldnt properly figure out how to export map files to obj from the actual games. 

It was made using the Godot engine, I chose it because its what I used for my FYP and with less tutorials around I would be forced to figure out everything on my own.

# Instructions
To launch the assignment simply load the project into godot and click play, the main scene is scene1 and it'll play through all of them in order, when the end screen appears the window will close itself after 10 seconds.

# How it works
I have used primarily colliders and path following in this assignment, most of my detection is done through "Field of view" collision, an area is attached to the an object and if something enters the object it'll trigger some sort of event, be it flying, dodging or shooting. This project could have well been written in a lot less scripts as many share the same code slightly modified but I didnt really play things out as well as I could, however it came out pretty good and I didnt use any tutorials for once

# What I am most proud of in the assignment
Probably the scene with the dodging enemy fire, it was tricky to get it to work properly and still is a bit wonky. I tried to make it as natural looking as I could, but ultimately failed and all the movements look very sudden. But the pelican will know when to dodge left or right from where the enemy projectile is coming from so that came out solid.

# Features
- Ship AI that fires at pelican
- Ship AI to dodge incoming fire
- Ship AI to look for enemies and fire at them until none are left
- Top quality "voice acting" :D
- path following ships

A Halo style space battle simulation
For this assignment I will be using the godot game engine as its one Ive grown to like
The assets and models I will be using are mostly directly rigged from the first halo game, if I can find better or newer models I will be swapping them.
In the final scene I hope to use an entire map file to show the pelican crashing along with a spartan walking out from it but so far I havent been able to get one working properly with textures

# Storyboard
 - The initial scene starts off with a pelican flying towards a new unkown halo ring
 - Soon after the an enemy ship slip spaces right into the stray pelican
 - With no back up the pelican tries to back off as the enemy cruiser begins to fire onto them. The pelican will dodge these shots as they    are relatively slow for the small pelican.
 - The enemies then deploy a fleet of banshees to chase and take down the pelican.
 - The pelican will fight off and destory the banshee fleet but will get shot down trying to find a safe location to land
 - It will crash land on a random location on the newly found ring as they call for help
 
![Image description](https://raw.githubusercontent.com/TrippWasTaken/HaloGE2Assignment/master/Images/storyboard.png)
