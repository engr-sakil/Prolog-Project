% Facts: Disease and its associated symptoms
has_symptom(cold,fever).
has_symptom(cold,cough).
has_symptom(cold,sore_throat).

has_symptom(flu,fever).
has_symptom(flu,cough).
has_symptom(flu,headache).
has_symptom(flu,body_ache).

has_symptom(covid19,fever).
has_symptom(covid19,cough).
has_symptom(covid19,shortness_of_breath).
has_symptom(covid19,loss_of_taste).

has_symptom(allergy,sneezing).
has_symptom(allergy,runny_nose).
has_symptom(allergy,itchy_eyes).

% Rule: A disease is diagnosed if all its symptoms are present
diagnose(Disease, Symptoms) :-
    has_symptom(Disease, Symptom),
    member(Symptom, Symptoms),
    fail. % Ensure all symptoms are checked
diagnose(Disease, Symptoms) :-
    forall(has_symptom(Disease, Symptom), member(Symptom, Symptoms)).

% Start diagnosis
start_diagnosis(Symptoms, Disease) :-
    diagnose(Disease, Symptoms), !.

% Example: Define a patient with specific symptoms
patient_diagnosis(Disease) :-
    Symptoms = [fever, cough, headache, body_ache],
    start_diagnosis(Symptoms, Disease).
