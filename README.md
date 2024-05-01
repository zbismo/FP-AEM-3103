# Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Zachary Elliott and Wesley Girardi

  ## Summary of Findings
  <Show the variations studied in a table>


    
  Summarized what was accomplished in this study.  Describe 2-4 observations from simulating the flight path.
  Reference the figures below as needed.

  *If the analysis falls short of the goal, this is your chance to explain what was done or what were the barriers.*
 
  # Code Listing
  A list of each function/script and a single-line description of what it does.  The name of the function/script should link to the file in the repository on GitHub.
   [PaperPlane.m](https://github.com/zbismo/FP-AEM-3103/blob/master/PaperPlane.m)
   This is our main code, where main simulations are run, and results are obatained and plotted in.
   EqMotion.m
   This function solves the fourth order equations of motion for an aircraft.
   setup_sim.m
   This function is simply used to store intialized variables and other parameters, to tidy up our main code space, and speed up runtime.
   
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/4700f6dc-8b11-4e2e-a038-76032b0be496)
  This graph with sublots shows changing initial velocity versus height across three different points (higher, lower, and nominal). The second subplot shows changing in initial flight path angle, with again a higher, lower, and nominal input. 
  
 

  ## Fig. 2: Monte Carlo Simulation
  <2D trajectories simulated using random sampling of parameters, overlay polynomial fit onto plot.>
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/e1c282d7-f82a-4ae3-a6ab-3eb08fe2a21d)
This is a figure of the 100 random simulation runs for height versus range. I say "a" figure as with each time running the code, a new generation would be applied and vary somewhat, as they are random.
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/363b3d87-b954-44f5-96c4-1d4bd0a6d5e5)
This is a figure for the average height trajectories of the 100 random samples wrt. We used the polyfit function to the 11th order, as we found it to fit the points the best.
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/13d2404c-f17f-499c-806f-aefcd6e61fd8)
This is a figure for the average range tracjectories of the 100 random samples wrt. We used the polyfit function, but this time just to the 1st order, as our range vs time was pretty linear.

 ## Fig. 3: Time Derivatives
 <Time-derivative of height and range for the fitted trajectory>
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/f4419d37-985b-4c22-b2e8-24a8be4fa49a)

  In our figures, we take the derivates of our poly functions with respecte to times for our Heights and Ranges vs Time, respectively. In other words, we have graphs of Velocities for Range and Height graphed out. Our second graph represents a linear range vs time derivative, which ideally would be flat. It is close to being flat, but the small areas where it is not flat can be attributed to noise due to the randomness of the trials. If we did say 1000 trials, we might not notice the noise as much.

 

  # Animation
  ## Point-Mass Animation
  <Animated GIF showing 2D trajectory for nominal and the scenario (V=7.5 m/s, Gam=+0.4 rad)>
 
