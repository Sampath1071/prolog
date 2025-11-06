% 8 Queens Problem in Prolog
% --------------------------

% Main predicate
queens(Queens) :-
    permutation([1,2,3,4,5,6,7,8], Queens),
    safe(Queens).

% Base case
safe([]).
% Recursive check
safe([Queen|Queens]) :-
    safe(Queens),
    not_attack(Queen, Queens, 1).

% Base case for not_attack
not_attack(_, [], _).
% Recursive check for diagonal safety
not_attack(Queen, [Other|Others], Distance) :-
    Queen =\= Other,                        % not same row
    abs(Queen - Other) =\= Distance,        % not same diagonal
    NewDistance is Distance + 1,
    not_attack(Queen, Others, NewDistance).
