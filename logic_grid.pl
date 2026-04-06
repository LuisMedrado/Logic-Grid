% :- use_module(library(clpfd)).

% main:-

% % FATOS
%     mochila = [moch_1, moch_2, moch_3, moch_4, moch_5],
%     mochila ins 1..5,
%     nome = [nome_1, nome_2, nome_3, nome_4, nome_5],
%     nome ins 1..5,
%     mes = [mes_1, mes_2, mes_3, mes_4, mes_5],
%     mes ins 1..5,
%     jogo = [jogo_1, jogo_2, jogo_3, jogo_4, jogo_5],
%     jogo ins 1..5,
%     materia =  [mat_1, mat_2, mat_3, mat_4, mat_5],
%     materia ins 1..5,
%     suco = [suco_1, suco_2, suco_3, suco_4, suco_5],
%     suco ins 1..5.

% % RESTRICAO DE DIFERENCAS

% all_different(mochila).
% all_different(nome).
% all_different(mes).
% all_different(jogo).
% all_different(materia).
% all_different(suco).

% % PREDICADO PRA VERIFICAR
% is_valid(Categoria, Valor) :-
%     item(Categoria, Lista),
%     member(Valor, Lista).

% % DEFINICAO DE CERTEZAS

% nome_5 #= lenin.
% suco_1 #= limao.
% suco_3 #= morango.
% mat_3 #= biologia.
% jogo_3 #= forca.
% nome_1 #= otavio.

% % DEFINICAO DE POSSIBILIDADES

% (jogo_1 == cubo_vermelho;
% jogo_5 == cubo_vermelho),

% ((jogo_1 #= cubo_vermelho, mes_2 #= setembro)
% ;(jogo_5 #= cubo_vermelho, mes_4 #= setembro)
% ),

% ((mes_2 #= setembro) #=> (suco_1 #= laranja #\/ suco_3 #= laranja)
% ;true
% ).


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
alldifferent([]).
alldifferent([H|T]) :-
    \+ member(H, T),
    alldifferent(T).

% X está ao lado de Y (qualquer ordem)
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
% Cada posição é uma tupla: (Mochila, Nome, Mes, Jogo, Materia, Suco)

modelo([
    (Mo1, No1, Me1, Jo1, Ma1, Su1),   % posição 1
    (Mo2, No2, Me2, Jo2, Ma2, Su2),   % posição 2
    (Mo3, No3, Me3, Jo3, Ma3, Su3),   % posição 3
    (Mo4, No4, Me4, Jo4, Ma4, Su4),   % posição 4
    (Mo5, No5, Me5, Jo5, Ma5, Su5)    % posição 5
]) :-

    % Cada variável recebe um valor do domínio
    mochila(Mo1), mochila(Mo2), mochila(Mo3), mochila(Mo4), mochila(Mo5),
    nome(No1),    nome(No2),    nome(No3),    nome(No4),    nome(No5),
    mes(Me1),     mes(Me2),     mes(Me3),     mes(Me4),     mes(Me5),
    jogo(Jo1),    jogo(Jo2),    jogo(Jo3),    jogo(Jo4),    jogo(Jo5),
    materia(Ma1), materia(Ma2), materia(Ma3), materia(Ma4), materia(Ma5),
    suco(Su1),    suco(Su2),    suco(Su3),    suco(Su4),    suco(Su5),

    % Todos os valores de cada categoria são distintos
    alldifferent([Mo1, Mo2, Mo3, Mo4, Mo5]),
    alldifferent([No1, No2, No3, No4, No5]),
    alldifferent([Me1, Me2, Me3, Me4, Me5]),
    alldifferent([Jo1, Jo2, Jo3, Jo4, Jo5]),
    alldifferent([Ma1, Ma2, Ma3, Ma4, Ma5]),
    alldifferent([Su1, Su2, Su3, Su4, Su5]),
    

  % A Lista unifica as variáveis das tuplas com uma lista nomeada,
  % permitindo usar predicados como member/2, ao_lado/3, etc.

    Lista = [(Mo1, No1, Me1, Jo1, Ma1, Su1),
    (Mo2, No2, Me2, Jo2, Ma2, Su2),
    (Mo3, No3, Me3, Jo3, Ma3, Su3),
    (Mo4, No4, Me4, Jo4, Ma4, Su4),
    (Mo5, No5, Me5, Jo5, Ma5, Su5)],




  % member((_, joao, _, _, historia, _), Lista) significa:
  % "existe uma posição na Lista onde o nome é joao E a matéria é historia"
  % Os underscores (_) ignoram os atributos que não importam pra regra.



    % Regra 1:  O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de Laranja.

    % Regra 2:  João gosta de história.
    member((_, joao, _, _, historia, _), Lista),
    % Regra 3:  O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
    % Regra 4:  Will está ao lado do menino que gosta de Problemas de Lógica.
    % Regra 5:  O garoto da mochila Branca está exatamente à esquerda de Will.
    % Regra 6:  Na terceira posição está quem gosta de suco de Morango.
    Su3 == morango,

    % Regra 7:  Quem gosta de suco de Uva gosta de Problemas de Lógica.
    member((_, _, _, prob_logica, _, uva), Lista),
    % Regra 8:  O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.
    % Regra 9:  O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.

    % Regra 10: O garoto que gosta de Biologia gosta de suco de Morango.
    member((_, _, _, _, biologia, morango), Lista),

    % Regra 11: O menino que nasceu em janeiro está ao lado de quem nasceu em setembro.
    % Regra 12: Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.

    % Regra 13: O menino que gosta de Matemática nasceu em dezembro.
    member((_, _, dezembro, _, matematica, _), Lista),


    % Regra 14: Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.

    % Regra 15: O dono da mochila Azul nasceu em janeiro.
    member((azul, _, janeiro, _, _, _), Lista),


    % Regra 16: O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
    % Regra 17: Na primeira posição está quem gosta de suco de Limão.
    Su1 == limao, 

    % Regra 18: Quem gosta de Matemática gosta também de suco de Maracujá.
    member((_, _, _, _, matematica, maracuja), Lista),


    % Regra 19: Lenin está na quinta posição.
    No5 == lenin,

    % Regra 20: Em uma das pontas está o menino que adora jogar Cubo Vermelho.
    (Jo1 == cubo_vermelho ; Jo5 == cubo_vermelho),

    % Regra 21: Quem gosta do Jogo da Forca está ao lado do dono da mochila Vermelha.

    % Regra 22: Otávio está em uma das pontas.
    (No1 == otavio ; No5 == otavio),

    % Regra 23: Na terceira posição está o menino que gosta do Jogo da Forca.
    Jo3 == jogo_da_forca,
    true. % remover quando adicionar as regras


% ==========================================
% MAIN
% ==========================================
main :-
    statistics(cputime, T1),
    modelo(Lista),
    imprime_lista(Lista),
    fail.
main :-
    statistics(cputime, T2),
    write('Busca finalizada. Tempo: '), write(T2), nl.

imprime_lista([]) :-
    write('\n\n FIM \n').
imprime_lista([H|T]) :-
    write('\n-----------\n'),
    write(H),
    imprime_lista(T).