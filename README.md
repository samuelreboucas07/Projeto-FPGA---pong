# Pong-FPGA

Este repositório contem o projeto requerido para a disciplina de Circuitos Digitais 2, a qual pertence a grade curricular do curso de Engenharia da Computação da Universidade Federal do Recôncavo da Bahia. Dispõe-se o desenvolvimento do jogo pong no FPGA Altera DE2-115, utilizando o Verilog como linguagem de descrição de hardware.

Para síntetização do Pong-FPGA faz-se necessário executar os seguintes comandos:
```sh
$ cd Pong-FPGA/
$ make -C fpga/
$ make -C fpga program
```
# O Jogo

O Pong é um jogo eletrônico de esporte em duas dimensões que simula um tênis de mesa. Nele o jogador controla uma barra vertical presente no lado esquerdo da tela, movendo-a verticalmente. O objetivo do jogo é fazer com que o jogador use a barra para acertar a esfera (bola) e mandá-la para o outro lado.

Após a sintetização do projeto na placa, utiliza-se o **switch 0** para dar inicio ao jogo. O controle da barra é realizado através do **push-button 3**, para movimento vertical superior, e o **push-button 2**, para movimento vertical inferior.

Boa sorte e bom jogo *=P*

# Trabalhos futuros

Seguem as seguintes sugestões como trabalhos futuros

**Adicionar indicadores de placar**

**Novos modos de jogo, 1 vs 1 e 1 vs PC**

**Aumento da dificuldade ao decorrer do jogo. Conforme o aumento da quantidade de acertos por parte do jogador, aumentar a velocidade da esfera (bola)**

# Saiba mais em:

A descrição completa do desenvolvimento encontra-se na página do projeto, localizada através do endereço eletrônico

# https://pong-fpga.github.io/
