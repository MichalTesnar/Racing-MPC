# Work it harder, make it better...

## Meeting Notes
- not working with Bahadir anymore
    - describe situation that happened
- focus on non-linear stuff

## To-do list
- Kosinka Grid -- linear interpolation
- implement optimization
    
## To implement later
- ARWo inspiration
    - curvilinear coordinates
    - warm-starting
    - using soft constraints
    - faster solvers: Embotech Forces Pro
    - offline optimization for curvature: then following optimal line
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