# Work it harder, make it better...

## Meeting Notes
- not working with Bahadir anymore
    - describe situation that happened
- super exciting
    - late apex!
    - today I want to discuss
        - implementation of the algorithm - design choices and how to improve them
        - planning of the project
            - poster/short report (4 pages?)
            - potential testing of parameters and choices, benchmarking of design choices
            - implementation in the simulation (just technical)

- implementation
    - using ub/lb
    - warm-starting (speed + position)
        - vector straight ahead
    - not using external functions because of pre-loaded data
    - problem with no feasibility
        - it is normal to fain often
        - fmincon does not like 1/0 function as a constraint -- it wants to optimize
            - we penalize by constraints
            - we make bad cost also variable
        - dropping error "infeasible", staying with initial parameter, even thought it failed
            - using soft constraints instead, even though not optimal, still better
            - making finite difference bigger (more likely not to fail the optimization)

## To-do list
- Kosinka Grid -- linear interpolation
- implement optimization
    
## To implement later
- ARWo inspiration
    - curvilinear coordinates
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