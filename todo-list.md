# Work it harder, make it better...

## Meeting Notes
- discuss news:
    - Kosinka's Grid
    - acceleration based model: problem
- resolving the concept dilemma: path-following?

## To-do list


- more complicated search profile in v and omega
    - combination of shorter search horizons
    
## To implement later
- steering: balancing constants / tuning the parameters
    - maximum steering angle at one time
    - maximum rate of change of steering at one step
    - lateral acceleration
- fixating constants for car and developing a metric for performance
    - fixating the number of steps to measure how far it can go
- real time deployment in simulation: not very theoretical, more like application
- using optimization packages
- using more complicated model (i.e. bycicle model)
- different constraints on the car
    - e.g. elliptic friction budget
    - e.g. different constraints on the track (distance on each step)
- different specification of the problem: not midpoint line: following some optimal racing line?
    - using Kosinka on progress along some precomputed optimal line
    - using Kosinka on width using the midpoint line
    
# ... our work is never over.