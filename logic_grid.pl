:- use_module(library(clpfd)).

main:-

% FATOS
    mochila = [moch_1, moch_2, moch_3, moch_4, moch_5],
    mochila ins 1..5,
    nome = [nome_1, nome_2, nome_3, nome_4, nome_5],
    nome ins 1..5,
    mes = [mes_1, mes_2, mes_3, mes_4, mes_5],
    mes ins 1..5,
    jogo = [jogo_1, jogo_2, jogo_3, jogo_4, jogo_5],
    jogo ins 1..5,
    materia =  [mat_1, mat_2, mat_3, mat_4, mat_5],
    materia ins 1..5,
    suco = [suco_1, suco_2, suco_3, suco_4, suco_5],
    suco ins 1..5.

% RESTRICAO DE DIFERENCAS

all_different(mochila).
all_different(nome).
all_different(mes).
all_different(jogo).
all_different(materia).
all_different(suco).

% PREDICADO PRA VERIFICAR
is_valid(Categoria, Valor) :-
    item(Categoria, Lista),
    member(Valor, Lista).

% DEFINICAO DE CERTEZAS

nome_5 #= lenin.
suco_1 #= limao.
suco_3 #= morango.
mat_3 #= biologia.
jogo_3 #= forca.
nome_1 #= otavio.

% DEFINICAO DE POSSIBILIDADES

(jogo_1 == cubo_vermelho;
jogo_5 == cubo_vermelho),

((jogo_1 #= cubo_vermelho, mes_2 #= setembro)
;(jogo_5 #= cubo_vermelho, mes_4 #= setembro)
),

((mes_2 #= setembro) #=> (suco_1 #= laranja #\/ suco_3 #= laranja)
;true
).
