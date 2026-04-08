% ==========================================
% FATOS — Domínios dos atributos
% ==========================================

mochila(amarela).
mochila(azul).
mochila(branca).
mochila(verde).
mochila(vermelha).

nome(denis).
nome(joao).
nome(lenin).
nome(otavio).
nome(will).

mes(agosto).
mes(dezembro).
mes(janeiro).
mes(maio).
mes(setembro).

jogo(tres_ou_mais).
jogo(caca_palavras).
jogo(cubo_vermelho).
jogo(jogo_da_forca).
jogo(prob_logica).

materia(biologia).
materia(geografia).
materia(historia).
materia(matematica).
materia(portugues).

suco(laranja).
suco(limao).
suco(maracuja).
suco(morango).
suco(uva).


% ==========================================
% AUXILIARES
% ==========================================

% Garante que todos os elementos da lista são distintos
%%%%% vi um jeito de fazer sem usar o alldifferent em um post de uma universidade, vou testar pq parece que roda mais rapido
% alldifferent([]).
% alldifferent([H|T]) :-
%   \+ member(H, T),
%   alldifferent(T).

% X está ao lado de Y (qualquer ordem)
%%%%%% essas constraints ajudaram muito gui, mandou bem dms

ao_lado(X, Y, Lista) :- nextto(X, Y, Lista).
ao_lado(X, Y, Lista) :- nextto(Y, X, Lista).

% X está em algum lugar à esquerda de Y
a_esquerda_de(X, Y, [X|Resto]) :- member(Y, Resto).
a_esquerda_de(X, Y, [_|Resto]) :- a_esquerda_de(X, Y, Resto).

% X está imediatamente à esquerda de Y
exatamente_a_esquerda(X, Y, Lista) :- nextto(X, Y, Lista).


% ==========================================
% MODELO
% ==========================================

modelo(Lista) :-
    %% estrutura vazia, so com as variáveis
    Lista = [
        (_Mo1, _No1, _Me1, _Jo1, _Ma1, Su1),  % posição 1
        (_Mo2, _No2, _Me2, _Jo2, _Ma2, _Su2), % posição 2
        (_Mo3, _No3, _Me3, Jo3, _Ma3, Su3),   % posição 3
        (_Mo4, _No4, _Me4, _Jo4, _Ma4, _Su4), % posição 4
        (_Mo5, No5, _Me5, Jo5, _Ma5, _Su5)    % posição 5
    ],

  %% mudei a ordem das regras por conta do backtracking, tava demorando muito pra compreender todas as possibilidades na ordem consecutiva

    % Regra 6:  Na terceira posição está quem gosta de suco de Morango.
    Su3 = morango,

    % Regra 17: Na primeira posição está quem gosta de suco de Limão.
    Su1 = limao,

    % Regra 19: Lenin está na quinta posição.
    No5 = lenin,

    % Regra 23: Na terceira posição está o menino que gosta do Jogo da Forca.
    Jo3 = jogo_da_forca,

    % Regra 20: Em uma das pontas está o menino que adora jogar Cubo Vermelho.
    (Lista = [(_, _, _, cubo_vermelho, _, _) | _] ; Lista = [_, _, _, _, (_, _, _, cubo_vermelho, _, _)]),

    % Regra 22: Otávio está em uma das pontas.
    (Lista = [(_, otavio, _, _, _, _) | _] ; Lista = [_, _, _, _, (_, otavio, _, _, _, _)]),

    % Regra 2:  João gosta de história.
    member((_, joao, _, _, historia, _), Lista),

    % Regra 7:  Quem gosta de suco de Uva gosta de Problemas de Lógica.
    member((_, _, _, prob_logica, _, uva), Lista),

    % Regra 10: O garoto que gosta de Biologia gosta de suco de Morango.
    member((_, _, _, _, biologia, morango), Lista),

    % Regra 13: O menino que gosta de Matemática nasceu em dezembro.
    member((_, _, dezembro, _, matematica, _), Lista),

    % Regra 15: O dono da mochila Azul nasceu em janeiro.
    member((azul, _, janeiro, _, _, _), Lista),

    % Regra 18: Quem gosta de Matemática gosta também de suco de Maracujá.
    member((_, _, _, _, matematica, maracuja), Lista),

    % Regra 1:  O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de Laranja.
    ao_lado((_, _, setembro, _, _, _), (_, _, _, _, _, laranja), Lista),

    % Regra 3:  O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
    a_esquerda_de((azul, _, _, _, _, _), (_, _, maio, _, _, _), Lista),

    % Regra 4:  Will está ao lado do menino que gosta de Problemas de Lógica.
    ao_lado((_, will, _, _, _, _), (_, _, _, prob_logica, _, _), Lista),

    % Regra 5:  O garoto da mochila Branca está exatamente à esquerda de Will.
    exatamente_a_esquerda((branca, _, _, _, _, _), (_, will, _, _, _, _), Lista),

    % Regra 8:  O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.
    ao_lado((_, _, _, jogo_da_forca, _, _), (_, _, _, tres_ou_mais, _, _), Lista),

    % Regra 9:  O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
    a_esquerda_de((azul, _, _, _, _, _), (_, _, _, _, _, uva), Lista),

    % Regra 11: O menino que nasceu em janeiro está ao lado de quem nasceu em setembro.
    ao_lado((_, _, janeiro, _, _, _), (_, _, setembro, _, _, _), Lista),

    % Regra 12: Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
    exatamente_a_esquerda((_, _, _, _, _, uva), (_, _, _, _, portugues, _), Lista),

    % Regra 14: Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
    ao_lado((_, _, _, prob_logica, _, _), (amarela, _, _, _, _, _), Lista),

    % Regra 16: O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
    ao_lado((_, _, setembro, _, _, _), (_, _, _, cubo_vermelho, _, _), Lista),

    % Regra 21: Quem gosta do Jogo da Forca está ao lado do dono da mochila Vermelha.
    ao_lado((_, _, _, jogo_da_forca, _, _), (vermelha, _, _, _, _, _), Lista),

    % cor de mochila
    member((amarela, _, _, _, _, _), Lista),
    member((azul, _, _, _, _, _), Lista),
    member((branca, _, _, _, _, _), Lista),
    member((verde, _, _, _, _, _), Lista),
    member((vermelha, _, _, _, _, _), Lista),

    % nomes
    member((_, denis, _, _, _, _), Lista),
    member((_, joao, _, _, _, _), Lista),
    member((_, lenin, _, _, _, _), Lista),
    member((_, otavio, _, _, _, _), Lista),
    member((_, will, _, _, _, _), Lista),

    % meses
    member((_, _, agosto, _, _, _), Lista),
    member((_, _, dezembro, _, _, _), Lista),
    member((_, _, janeiro, _, _, _), Lista),
    member((_, _, maio, _, _, _), Lista),
    member((_, _, setembro, _, _, _), Lista),

    % jogos
    member((_, _, _, tres_ou_mais, _, _), Lista),
    member((_, _, _, caca_palavras, _, _), Lista),
    member((_, _, _, cubo_vermelho, _, _), Lista),
    member((_, _, _, jogo_da_forca, _, _), Lista),
    member((_, _, _, prob_logica, _, _), Lista),

    % materias
    member((_, _, _, _, biologia, _), Lista),
    member((_, _, _, _, geografia, _), Lista),
    member((_, _, _, _, historia, _), Lista),
    member((_, _, _, _, matematica, _), Lista),
    member((_, _, _, _, portugues, _), Lista),

    % sabores de suco
    member((_, _, _, _, _, laranja), Lista),
    member((_, _, _, _, _, limao), Lista),
    member((_, _, _, _, _, maracuja), Lista),
    member((_, _, _, _, _, morango), Lista),
    member((_, _, _, _, _, uva), Lista).

% ==========================================
% MAIN
% ==========================================

%%%%% tive que alterar o nome da regra main pra run, tava entrando em conflito com a regra main da biblioteca interna do prolog

run :-
    statistics(cputime, _T1),
    modelo(Lista),
    imprime_lista(Lista),
    fail.
run :-
    statistics(cputime, T2),
    write('Busca finalizada. Tempo: '), write(T2), nl.

imprime_lista([]) :-
    write('\n\n FIM \n').
imprime_lista([H|T]) :-
    write('\n-----------\n'),
    write(H),
    imprime_lista(T).
