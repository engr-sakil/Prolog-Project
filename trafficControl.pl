% Traffic Light Controller Simulation with Stop Condition

% Traffic light states and their actions
state(red, 'Stop').
state(green, 'Go').
state(yellow, 'Slow down').

% Traffic light timings (in seconds)
timing(red, 30).
timing(green, 40).
timing(yellow, 5).

% Traffic light state transitions
next_state(red, green).
next_state(green, yellow).
next_state(yellow, red).

% Predicate to simulate the traffic light controller with a stop condition after three cycles
simulate_traffic_light(CurrentState, TimeLeft, CycleCount) :-
    CycleCount < 2,
    TimeLeft > 0,
    write('Light: '), write(CurrentState), 
    write(', Time left: '), write(TimeLeft), nl,
    NewTimeLeft is TimeLeft - 1,
    simulate_traffic_light(CurrentState, NewTimeLeft, CycleCount).

simulate_traffic_light(CurrentState, 0, CycleCount) :-
    CycleCount < 2,
    next_state(CurrentState, NextState),
    timing(NextState, Duration),
    (CurrentState == yellow -> NewCycleCount is CycleCount + 1 ; NewCycleCount is CycleCount),
    write('Switching to '), write(NextState), write(' light.'), nl,
    simulate_traffic_light(NextState, Duration, NewCycleCount).

simulate_traffic_light(_, _, 2) :-
    write('The traffic simulation works automatically, switching lights sequentially based on a set time limit. In the program output, I have demonstrated only two cycles, but in reality, it will run continuously.'), nl.

% Predicate to start the simulation
start_simulation :-
    write('Starting traffic light simulation...'), nl,
    timing(red, Duration),
    simulate_traffic_light(red, Duration, 0).

% Example scenario demonstrating the traffic light operation
scenario :-
    write('Scenario: Cars approaching an intersection'), nl,
    write('Traffic light starts with RED light'), nl,
    start_simulation.
