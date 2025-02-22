% Member details: member(Name, Age, MembershipType)
member(john, 28, premium).
member(mary, 34, basic).
member(sam, 22, basic).
member(susan, 45, premium).

% Trainer expertise: trainer(Name, Specialty)
trainer(alex, strength_training).
trainer(ella, yoga).
trainer(mark, cardio).

% Class attendance: attends(Member, Class)
attends(john, yoga).
attends(mary, strength_training).
attends(sam, cardio).
attends(susan, yoga).
attends(susan, strength_training).

% Class details: class(ClassName, Type, Duration)
class(yoga, flexibility, 60).
class(strength_training, strength, 90).
class(cardio, endurance, 45).

% Assigned trainers: assigned_trainer(Class, Trainer)
assigned_trainer(yoga, ella).
assigned_trainer(strength_training, alex).
assigned_trainer(cardio, mark).

% Member workout preferences: member_workout(Member, WorkoutType)
member_workout(john, flexibility).
member_workout(mary, strength).
member_workout(sam, endurance).
member_workout(susan, flexibility).

% Membership pricing: membership_price(Type, Price)
membership_price(premium, 100).
membership_price(basic, 50).

% Discount eligibility: eligible_discount(Member, Discount)
eligible_discount(Member, 20) :-
   member(Member, Age, premium),
   Age > 40.  % Premium members over 40 get a $20 discount.

eligible_discount(Member, 10) :-
   member(Member, _, basic).  % All basic members get a $10 discount.

% Workout schedule: workout_schedule(Member, Class)
workout_schedule(Member, Class) :-
   member(Member, _, _),                % Ensure Member is a gym member.
   member_workout(Member, WorkoutType), % Get the members workout preference.
   class(Class, WorkoutType, _).        % Match the class to the workout type.

% Find trainer: find_trainer(Member, Trainer)
find_trainer(Member, Trainer) :-
   attends(Member, Class),             % Find the class attended by the member.
   assigned_trainer(Class, Trainer).   % Find the assigned trainer for the class.
