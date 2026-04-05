# Disciplina: Inteligência Artificial

Cinco alunos do ensino fundamental foram ao laboratório de computação de sua escola a fim de jogarem seus favoritos jogos utilizando lógica. Você deve descobrir as características de cada um deles segundo o quadro, utilizando as regras.

**Mochila:** amarela, azul, branca, verde, vermelha.

**Nome:** Denis, João, Lenin, Otávio, Will.

**Mês:** agosto, dezembro, janeiro, maio, setembro.

**Jogo:** 3 ou Mais, Caça Palavras, Cubo Vermelho, Jogo da Forca, Prob. de Lógica.

**Matéria:** biologia, geografia, história, matemática, português.

**Suco:** laranja, limão, maracujá, morango, uva.

---

## Quadro

|         | Menino #1     | Menino #2  | Menino #3 | Menino #4 | Menino #5     |
| ------- | ------------- | ---------- | --------- | --------- | ------------- |
| Mochila | Verde         | Branca     | Azul      | Vermelha  | Amarela       |
| Nome    | Otávio        | Denis      | Will      | João      | Lenin         |
| Mês     | Agosto        | Dezembro   | Janeiro   | Setembro  | Maio          |
| Jogo    | Caça Palavras | 3 ou Mais  | Forca     | Lógica    | Cubo Vermelho |
| Matéria | Geografia     | Matemática | Biologia  | História  | Português     |
| Suco    | Limão         | Maracujá   | Morango   | Uva       | Laranja       |

---

## Regras

1. O menino que nasceu no mês de setembro está ao lado de quem gosta de suco de Laranja.
2. João gosta de história.
3. O garoto da mochila Azul está em algum lugar à esquerda de quem nasceu em maio.
4. Will está ao lado do menino que gosta de Problemas de Lógica.
5. O garoto da mochila Branca está exatamente à esquerda de Will.
6. Na terceira posição está quem gosta de suco de Morango.
7. Quem gosta de suco de Uva gosta de Problemas de Lógica.
8. O garoto que gosta do Jogo da Forca está ao lado do que gosta do 3 ou Mais.
9. O menino que gosta de suco de Uva está em algum lugar à direita do garoto da mochila Azul.
10. O garoto que gosta de Biologia gosta de suco de Morango.
11. O menino que nasceu em janeiro está ao lado de quem nasceu em setembro.
12. Quem gosta de suco de Uva está exatamente à esquerda de quem gosta de Português.
13. O menino que gosta de Matemática nasceu em dezembro.
14. Quem curte Problemas de Lógica está ao lado do menino da mochila Amarela.
15. O dono da mochila Azul nasceu em janeiro.
16. O garoto que nasceu em setembro está ao lado de quem gosta de jogar Cubo Vermelho.
17. Na primeira posição está quem gosta de suco de Limão.
18. Quem gosta de Matemática gosta também de suco de Maracujá.
19. Lenin está na quinta posição.
20. Em uma das pontas está o menino que adora jogar Cubo Vermelho.
21. Quem gosta do Jogo da Forca está ao lado do dono da mochila Vermelha.
22. Otávio está em uma das pontas.
23. Na terceira posição está o menino que gosta do Jogo da Forca.

---

## Dicas para realizar o trabalho de lógica utilizando o Prolog

### 1. Compreender o problema e as restrições

- Leiam atentamente o enunciado e identifiquem todas as restrições e relações entre os elementos (como as posições, atributos únicos, relações de vizinhança etc.).
- É útil desenhar ou tabular as informações para visualizar como os elementos se conectam.

### 2. Modularização e organização do código

- Divida o problema em partes menores, criando predicados para cada grupo de restrições (por exemplo, um para "Mochila", outro para "Nome", etc.).
- Comentem o código para que cada parte fique clara, facilitando a manutenção e a depuração.

### 3. Uso de predicados auxiliares

- Utilizem o predicado `alldifferent` para garantir que os elementos de uma lista sejam distintos. Isso ajuda a reduzir o espaço de busca e evitar soluções inválidas.
- Criem outros predicados auxiliares para validar condições específicas, como "estar ao lado" ou "exatamente à esquerda".

### 4. Planejamento da ordem de avaliação das restrições

- A ordem das restrições pode influenciar a eficiência do programa. Procurem aplicar primeiro aquelas que eliminam mais possibilidades, reduzindo o espaço de busca logo no início.

### 5. Entender o funcionamento do backtracking

- Explorem como o Prolog usa o backtracking para encontrar soluções.
- Experimentem remover temporariamente a cláusula `fail` para ver a primeira solução encontrada e entender como o programa percorre as possibilidades.

### 6. Testes e depuração

- Usem comandos como `write` e `nl` para imprimir valores intermediários e acompanhar a execução.
- Realizem testes parciais, verificando se cada parte do código funciona corretamente antes de integrá-las todas.

### 7. Familiarização com o ambiente SWI-Prolog

- Pratiquem a carga e execução do programa via terminal ou ambiente gráfico, utilizando comandos como `[programa].` ou `consult('programa.pl').` e a execução com `main`.
- Aproveitem as ferramentas de depuração do SWI-Prolog para identificar e corrigir problemas.

### 8. Estudo de exemplos clássicos

- Analisem exemplos de resolução de puzzles lógicos (como o problema de Einstein ou o quebra-cabeça de atributos) para entender diferentes abordagens e técnicas utilizadas.
