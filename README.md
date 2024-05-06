# Paper Airplane Numerical Study
  Final Project: AEM 3103 Spring 2024

  - By: Zachary Elliott and Wesley Girardi

  ## Summary of Findings
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/ef2fd00d-a824-4e0f-a15d-0e9749434b42)

  In this study, we looked at aerospace flight characteristics, specifically taking a look at a paper airplane glider. We utilized matlab to simulate flight trajectories of this glider, with various changes in intial velocites and flight path angles (Fig. 1). We then applied the Monte Carlo Simulation by randomizing 100 simulations of this glider with varying initial conditions (Fig 2.1). Then we displayed these in  their own respective graphs, along with making a line of best fit for both Range and Height vs Time (Fig. 2.2 and 2.3). Finally, we took derivatives of these graphs to interperate the rate of changes of both height and range with respect to time.
  
  An observation we observed in regards to the gliders height versus time, it seems that initally the glider will dip down in height from its starting point, to then approach a second (smaller) peak, before then cotinuining in its downward trajectory. In regards to range versus time, this appears to be much more linear. This can be confirmed when we took the derivative of range with respect to time (Fig. 3), which was mostly flat. The slight bumps can be attributed to noise.

 
  # Code Listing

  [PaperPlane.m](https://github.com/zbismo/FP-AEM-3103/blob/master/PaperPlane.m)
     This is our main code, where main simulations are run, and results are obatained and plotted in.

  [EqMotion.m](https://github.com/zbismo/FP-AEM-3103/blob/master/EqMotion.m)
    This function solves the fourth order equations of motion for an aircraft.
   
  [setup_sim.m](https://github.com/zbismo/FP-AEM-3103/blob/master/setup_sim.m)
    This function is simply used to store intialized variables and other parameters, to tidy up our main code space, and speed up runtime.
   
  # Figures

  ## Fig. 1: Single Parameter Variation
  ![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/4700f6dc-8b11-4e2e-a038-76032b0be496)
  This graph with sublots shows changing initial velocity versus height across three different points (higher, lower, and nominal). The second subplot shows changing in initial flight path angle, with again a higher (green), lower (red), and nominal (black) input. 
  
  ## Fig. 2: Monte Carlo Simulation
Fig 2.1
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/e1c282d7-f82a-4ae3-a6ab-3eb08fe2a21d)
This is a figure of the 100 random simulation runs for height versus range. I say "a" figure as with each time running the code, a new generation would be applied and vary somewhat, as they are random.

Fig 2.2
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/363b3d87-b954-44f5-96c4-1d4bd0a6d5e5)
This is a figure for the average height trajectories of the 100 random samples wrt. We used the polyfit function to the 11th order, as we found it to fit the points the best. The red line represents the line of best fit "polyfit" function, and the blue dots represent the raw data. 

Fig 2.3
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/13d2404c-f17f-499c-806f-aefcd6e61fd8)
This is a figure for the average range tracjectories of the 100 random samples wrt. We used the polyfit function, but this time just to the 1st order, as our range vs time was pretty linear. The red line represents the line of best fit "polyfit" function, and the blue dots represent the raw data. 

 ## Fig. 3: Time Derivatives
   
![image](https://github.com/zbismo/FP-AEM-3103/assets/167819715/f4419d37-985b-4c22-b2e8-24a8be4fa49a)


  In our figures, we take the derivates of our poly functions with respecte to times for our Heights and Ranges vs Time, respectively. In other words, we have graphs of Velocities for Range and Height graphed out. Our second graph represents a linear range vs time derivative, which ideally would be flat. It is close to being flat, but the small areas where it is not flat can be attributed to noise due to the randomness of the trials. If we did say 1000 trials, we might not notice the noise as much. (Note, in our code we were having a problem with using the "diff" function, as it was removing one of our entries, causing arrays to not match up when plotting. This is why we used the "gradient" function, to fix this error, by accounting for the lost zero)


  ## Point-Mass Animation
Animated GIF showing 2D trajectory for nominal and the scenario (V=7.5 m/s, Gam=+0.4 rad)
![nomial_airplane](https://github.com/zbismo/FP-AEM-3103/assets/168034962/cc3f935b-ecc4-4ab1-9a0e-c8297e6250ff)


![High_airplane](https://github.com/zbismo/FP-AEM-3103/assets/167819715/9c669f77-d19b-4c11-a0e0-874e99a38963)

We decided to make two seperate graphs for our point mass animations as we were having difficulties getting them to work on the same figure.
