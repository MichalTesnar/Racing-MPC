# Work it harder, make it better...

- steering: balancing constanst / tuning the parameters
    - maximum steering angle at one time
    - maximum rate of change of steering at one step
    - lateral acceleration
    -> if the car is too constrained it drives quite bad, since it speeds into a corner and then we have to wait for a long time

new ideas
    - more interesting search tree / shorter search horizon
        - combination of shorter search horizons?
        - acceleration throughout the search? i.e. picking throttle instead of speed, also more realistic

    - fixating constants for car and developing a metric for performance
        - metric on computation time: feasibility?
        - metric on performance: how far along the track?

    - real time deployment in simulation
        - not very theoretical, more like application
    
    - different representation of the track
        - Kosinka's grid of distance and progress: maybe different constraints can be stated now?
    
    - different specification of the problem
        - not midpoint line: following some optimal racing line?
            - using Kosinka on progress using the optimal line
            - using Kosinka on width using the midpoint line
        - different constraints on the car
            - getting inspired about what other papers optimize

    - using optimized packages

    - using more complicated model

# ... our work is never over.