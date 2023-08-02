:- consult().


% Sleep
patient_sleep_to_actual(Sleep, SleepActual):-
    Sleep > 8,
    SleepActual = [sleep_more_than_8_hours].

patient_sleep_to_actual(Sleep, SleepActual):-
    Sleep =< 8,
    SleepActual = [].

% Exhausted
patient_exhausted_to_actual(Exhausted, ExhaustedActual):-
    Exhausted = yes,
    ExhaustedActual = [exhausted].

patient_exhausted_to_actual(Exhausted, ExhaustedActual):-
    Exhausted = no,
    ExhaustedActual = [].

% Nauseous
patient_nauseous_to_actual(Nauseous, NauseousActual):-
    Nauseous = yes,
    NauseousActual = [feels_nauseous].

patient_nauseous_to_actual(Nauseous, NauseousActual):-
    Nauseous = no,
    NauseousActual = [].

% Surgeries
patient_surgeries_to_actual(Surgeries, SurgeriesActual):-
    Surgeries = yes,
    SurgeriesActual = [previous_surgeries].

patient_surgeries_to_actual(Surgeries, SurgeriesActual):-
    Surgeries = no,
    SurgeriesActual = [].


% Interactive Console 
main:-
    repeat,

   

    write('\nYou Are Welcome\n\n'),
    write('How many hours does the patient sleep daily?\n'),
    read(Sleep), nl,
    patient_sleep_to_actual(Sleep, SleepActual),

    write('Is the patient exhausted?\n'),
    read(Exhausted), nl,
    patient_exhausted_to_actual(Exhausted, ExhaustedActual),

    write('Does the patient feel nauseous?\n'),
    read(Nauseous), nl,
    patient_nauseous_to_actual(Nauseous, NauseousActual),

    write('Has the patient had any previous surgeries?\n'),
    read(Surgeries), nl,
    patient_surgeries_to_actual(Surgeries, SurgeriesActual),

    write('Sleep: '), write(SleepActual), nl,
    write('Exhausted: '), write(ExhaustedActual), nl,
    write('Nauseous: '), write(NauseousActual), nl,
    write('Previous surgeries: '), write(SurgeriesActual), nl,

    sort([SleepActual, ExhaustedActual, NauseousActual, SurgeriesActual], PatientKBWithEmptyClauses),
    delete(PatientKBWithEmptyClauses, [], PatientKB),
    append(PriorKB, PatientKB, KB),
    Questions = [Receive_free_medical_review],
nl,nl,

    write('Will the patient get a free medical review? '), nl, nl,write('Yes'),nl,

    write('\nLook at another patient?\n'),
    read(AnotherPatient),
    AnotherPatient = stop,
    !.