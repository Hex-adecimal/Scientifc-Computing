
A = [1, -1, 3; 3, -3, 1; 1, 1, 0];
b = [2, -1, 3]';

% Problema del pivot nullo
[A, info] = myluOpt(A);
if info == 0
    x = myfw(A, mybw(A, b));
end

% //------------//

A = [2, -1, 1, -2; 0, 2, 0, -1; 1, 0, -2, 1; 0, 2, 1, 1];
B = [0, 2; 1, 0; 0, 1; 4, 0];
b1 = B(:, 1);
b2 = B(:, 2);

% Risultati diversi dal backlash A\B
[A, info] = myluOpt(A);
if info == 0
    x = myfw(A, mybw(A, b1));
    x = myfw(A, mybw(A, b2));
end

% //------------//

A = [4, 6, -1, 1; 2, 3, 8, 1; 1, 3, 9, 7; 0, 1, 1, 1];
b = [2; 4; 1; 0];

% Qui invece ha deciso che deve esplodere
% Ad un certo punto sumL = 1.5 e la matrice diventa
%    4.0000    6.0000   -1.0000    1.0000
%    0.5000         0    8.5000    0.5000
%    0.2500       Inf    9.0000    7.0000
%         0    1.0000    1.0000    1.0000

[A, info] = myluOpt(A)
if info == 0
    x = myfw(A, mybw(A, b))
end
