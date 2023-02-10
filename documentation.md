Dilemma
    There are two approaches, that we can take basically:
    1. first find the optimal path given the track with the speed and turning radius profile,
    then we can follow this line,
    2. or we can just follow the istructions using the horizon that we have as the final movement
    of the model.
    
    We have to choose what we want to do...


### Version 1.0
- familiarize yourself with Matlab xd :) terrible code
- making the first model
- making the visualization
- using Delauney's to find the midpoint path
    - midpoint is the progress
- linear search: slow -> make it locally linear (sometimes not optimal)
- velocity + steering angle change based
    - not real, we have too big instant change
- keeps to the same options over the whole profile


### Version 2.0
- grid search using precomputed values -- Kosinka's Grid
- acceleration + steering angle change based
- keeps to the same options over the whole profile
    - limiting factor: can only pick decelleration which stops it over the horizon
        - solution: short horizon
             -> not optimal behavior
             -> needs starting velocity, which is not real