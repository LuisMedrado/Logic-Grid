# Tutorial Prolog para Solução do Trabalho

---

## 1. Introdução ao Prolog

Prolog é uma linguagem de programação lógica onde você define fatos e regras que descrevem o problema. A resolução (busca de soluções) é feita através de inferência, ou seja, o Prolog tenta satisfazer todas as restrições definidas para encontrar uma solução.

No exemplo do trabalho passado a você, o objetivo é associar cada posição (representada por uma tupla com 6 atributos) a um conjunto consistente de valores, obedecendo às restrições do problema.

---

## 2. Estrutura do Programa

### 2.1. Predicado `main`

O predicado `main` é o ponto de entrada do programa. Nele, medimos o tempo de execução da busca pela solução:

- **Estatísticas de tempo:** Usa `statistics(cputime, T1)` e `statistics(cputime, T2)` para medir o tempo de CPU antes e depois da execução da busca.

- **Chamada do modelo:** O predicado `modelo/1` é chamado para gerar a lista de soluções, representada por cinco tuplas. Em seguida, a lista é impressa usando `imprime_lista/1`.

- **Backtracking e fail:** O uso do `fail` força o Prolog a buscar todas as soluções possíveis. Após exibir as soluções, o segundo `main` imprime uma mensagem indicando que a busca terminou.

```prolog
main :-
    statistics(cputime, T1),
    modelo(Lista),
    imprime_lista(Lista),
    fail.
main :-
    statistics(cputime, T2),
    write('Busca finalizada. Tempo: '), write(T2), nl.
```

---

### 2.2. Predicado `modelo`

O predicado `modelo/1` define a estrutura da solução e impõe diversas restrições. Veja como ele funciona:

**Estrutura da solução:** A solução é uma lista de 5 tuplas, cada uma contendo 6 variáveis:

```prolog
modelo([
    (Mochila_1, Nome_1, Mes_1, Jogo_1, Materia_1, Suco_1),
    (Mochila_2, Nome_2, Mes_2, Jogo_2, Materia_2, Suco_2),
    (Mochila_3, Nome_3, Mes_3, Jogo_3, Materia_3, Suco_3),
    (Mochila_4, Nome_4, Mes_4, Jogo_4, Materia_4, Suco_4),
    (Mochila_5, Nome_5, Mes_5, Jogo_5, Materia_5, Suco_5)
]) :- ...
```

**Definição de domínios:** Para cada atributo (mochila, nome, mês, jogo, matéria, suco), o predicado chama outro predicado que define os valores possíveis. Por exemplo:

```prolog
mochila(Mochila_1), nome(Nome_1), mes(Mes_1),
jogo(Jogo_1), materia(Materia_1), suco(Suco_1),
```

**Restrição de valores distintos:** O predicado `alldifferent/1` garante que, por exemplo, as mochilas de todas as posições sejam diferentes:

```prolog
alldifferent([Mochila_1, Mochila_2, Mochila_3, Mochila_4, Mochila_5]),
```

**Restrições específicas do problema:**

- **Posição fixa** — fixa o nome `lenin` na quinta posição:

```prolog
Nome_5 == lenin,
```

- **Relações de vizinhança** — "O garoto da mochila Branca está exatamente à esquerda de Will":

```prolog
(
    (Nome_4 == will, Mochila_3 == branca) ;
    (Nome_3 == will, Mochila_2 == branca) ;
    (Nome_2 == will, Mochila_1 == branca)
),
```

Essa restrição testa as posições possíveis onde essa relação pode ocorrer.

---

## 3. Fatos — Domínios dos Atributos

Logo após as regras, temos a definição dos fatos, que especificam os valores possíveis para cada atributo:

**Mochilas:**

```prolog
mochila(amarela).
mochila(azul).
mochila(branca).
mochila(verde).
mochila(vermelha).
```

**Nomes:**

```prolog
nome(denis).
nome(joao).
nome(lenin).
nome(otavio).
nome(will).
```

**Meses, jogos, matérias e sucos** seguem a mesma lógica, definindo os valores que cada variável pode assumir.

---

## 4. Predicados Auxiliares

### 4.1. `alldifferent/1`

O predicado `alldifferent/1` é definido para garantir que todos os elementos de uma lista sejam distintos. Sua definição recursiva é:

```prolog
alldifferent([]).
alldifferent([H|T]) :-
    not(member(H, T)),
    alldifferent(T).
```

Para cada elemento `H`, ele verifica se `H` não está presente no restante da lista `T`.

### 4.2. `imprime_lista/1`

Esse predicado é utilizado para imprimir os elementos da lista de soluções. Ele percorre a lista recursivamente, exibindo cada tupla com uma separação:

```prolog
imprime_lista([]) :-
    write('\n\n FIM do imprime_lista \n').

imprime_lista([H|T]) :-
    write('\n.......................\n'),
    write(H), write(' : '),
    imprime_lista(T).
```

---

## 5. Como Executar o Programa

### 5.1. Carregar o arquivo no interpretador Prolog

Salve o código em um arquivo (por exemplo, `puzzle.pl`) e carregue-o no interpretador (SWI-Prolog ou similar) com:

```prolog
?- [puzzle].
```

### 5.2. Executar o predicado `main`

Basta digitar:

```prolog
?- main.
```

**O Prolog irá:**

- Registrar o tempo inicial.
- Buscar uma solução (ou todas, devido ao `fail`).
- Imprimir cada solução encontrada.
- Exibir o tempo total de execução.
- Por fim, mostrar a mensagem de término.

### Interpretação dos Resultados

Cada saída exibida representa uma solução que satisfaz todas as restrições. O uso do `fail` no final do primeiro `main` força o _backtracking_ para explorar todas as possibilidades, enquanto o segundo `main` é chamado quando não há mais soluções.
