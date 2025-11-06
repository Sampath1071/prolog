queens(Queens) :-
    permutation([1,2,3,4,5,6,7,8], Queens),
    safe(Queens).
safe([]).
safe([Queen|Queens]) :-
    safe(Queens),
    not_attack(Queen, Queens, 1).
not_attack(_, [], _).
not_attack(Queen, [Other|Others], Distance) :-
    Queen =\= Other,
    abs(Queen - Other) =\= Distance,
    NewDistance is Distance + 1,
    not_attack(Queen, Others, NewDistance).
