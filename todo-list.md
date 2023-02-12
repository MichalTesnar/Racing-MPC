# Work it harder, make it better...

## Meeting Notes
- Kosinka's Grid
- acceleration based model: problem with decelleration, crashing all the time
    - solution: letting accelerate more and less and ceiling the model with maximum and minimum
- idea: we could not fit one (acc, omega) to the track in long lookaheads -> combination of shorter search horizons
    - recursive call function, fun to implement -> still inefficient needs optimization
    - crazy time complexity: O(steps in one horizon*((sample rate of acc * sample rate of omega)^horizons))
        - steps is fine, but to get 4 horizons, I have to have intervals < 3
        - for 3 horizons, intervals = 5 is feasible
    - increasing tau to increase lookahead for each horizon
        - AMZ uses 0.05*40 = 2 seconds ahead
- resolving the concept dilemma: path-following or going on the fly?


## To-do list
- ...
    
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