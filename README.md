# Optimal Racing Using Model Predictive Control
## What is this?
In this project, we are trying to utilize model predictive control in order to make a car pick steering commands which make it race optimally on a simulated track.

## What do I need?
- Matlab (developed in 2022b, I am unsure about backwards compatibility),
- Matlab Optimization Toolbox version 9.4.,
- Statistics and Machine Learning Toolbox version 12.5.

## What to run?
Firstly, go to `/utils` and run `precompute_grid.m`, make sure to add `/utils` to the MATLAB path.

Then comeback to the main folder, now you can choose to run any of the three solutions:
- execute `solution_1_simple_grid_search.m` for simplest solution to the MPC that generates valid but suboptimal trajectories,
- execute `solution_2_recursive_search.m` for more complex solution that solves the MPC more optimally, but very slow,
- execute `solution_3_fmincon.m` for continuous optimization using fmincon, which achieves the best results.

## Mentions & Contributions
This is a Second-Year Research Project at Honours College of Rijksuniversiteit Groningen, carried in the academic year 2022/23.

Author: Michal Tešnar ([Personal Website](https://michal-tesnar.vercel.app/))

Supervisor: Bart Besselink ([Personal Website](https://www.math.rug.nl/~besselink/))

Honorable Mentions: Jiri Kosinka ([Personal Website](https://www.rug.nl/staff/j.kosinka/)) for quick consulation and good practical tips.
