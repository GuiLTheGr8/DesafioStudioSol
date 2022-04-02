#  🤘 Jogo de Números CifraClub V1.0! 🤘
##      Por Guilherme Vassallo

## Instruções:

### 1- Acessar o arquivo ContentView.swift
### 2- Dar "play" no live preview ou Product -> Run para rodar no simulador
###         (Recomendo rodar no simulador pois o Xcode pode bugar o teclado numérico.
###         No simulador ele aparece normalmente.)
### 3- Jogar!

## Comentários:

    Trata-se de um jogo de adivinhação de números. O jogo gera um número aleatório entre 1 e 300 e você deve acertar qual é. Digite seu palpite na caixa de texto (que não tenha mais que 3 algarismos) e aperte "Enviar". Um texto na tela mostrará se o número a ser adivinhado é maior ou menor que seu palpite, ou se você acertou. Repita até acertar! No caso de vitória ou de um erro na geração do número, aperte "Novo Jogo" para gerar outro número e recomeçar a partida.
    
    Você também pode customizar o tamanho do painel de LED e a sua cor, utilizando os ícones no canto superior direito!
    
    Este projeto foi desenvolvido inteiramente em SwiftUI nativo e quase sem a utilização de recursos externos, salvo pela view MyColorPicker que foi disponibilizada pelo Frederico do canal Code Palace: https://www.youtube.com/watch?v=cvlNnyDi6o8. A utilizei pois era permitida a utilização de bibliotecas externas para esse recurso, e o color picker nativo do SwiftUI se recusou a funcionar por conta do que pareceu ser algum bug do XCode. Achei a solução dele simples, eficaz e elegante então resolvi incluí-la.
    
    O projeto se utiliza do padrão MVVM (Model View ViewModel) para organização dos arquivos.
    
    Na pasta View, estão todas as views (partes gráficas) do projeto. Elas incluem:
        ContentView - Tela principal de jogo que agrega demais views.
        LEDDisplayNum - Display de 7 segmentos que mostra um algarismo.
        LEDDisplayTriple - Agrega 3 LEDDisplayNum para formar um display LED de 3 algarismos.
        SliderPopUp - Slider que permite mudar o tamanho do display LED.
        MyColorPicker - Picker de cores que permite selecionar uma cor para o painel de LED.
        
    Na pasta e no arquivo Model, temos o formato do arquivo que será retornado ao fazermos uma request no endpoint. Nesse caso, ele é extremamente simples contendo apenas um valor inteiro, já que os códigos de erro serão adquiridos por meio do HTTPURLResponse e não pelo JSON.
    
    E por fim, na pasta e no arquivo ViewModel temos o request em si que receberá o número aleatório do endpoint, o salvamento do mesmo em variáveis dinâmicas, e o tratamento de erros de toda essa operação.
    
    Também há o arquivo Helpers que conta com várias utilidades para facilitar o desenvolvimento.
    
## Considerações finais:

    Esse projeto foi desenvolvido como parte de um desafio do Studio Sol, dona do Cifra Club, Letras.mus e Palco MP3. A vocês, queria dizer que foi bem divertido e uma ótima experiência desenvolvê-lo e aprimorar minhas habilidades em SwiftUI, assim como refletir a respeito do processo.
    
    Como eu também sou músico nas horas vagas, os produtos da Studio Sol fizeram parte integral da minha vida. Coloquei bastante atenção e carinho nesse projeto, então por isso eu espero de verdade que vocês gostem e me considerem para trabalhar na empresa. Seria um sonho realizado para mim.
    
    Também sei que existem aspectos do app que poderiam melhorar:
        - A organização dos arquivos e o encapsulamento não está perfeito, inclusive eu acho que poderia ter utilizado uma camada de serviços para tornar o viewModel mas enxuto.
        - A parte que eu menos me orgulho desse projeto foi a função em loop que verifica os erros. É uma solução... bem menos que elegante, e não muito confiável. Tentei implementar métodos asnyc/await, completion e outras técnicas, mas fiquei sem tempo. O único erro tratado explicitamente também é o erro na hora do parse, os outros só dão prints ou returns. Ainda posso evoluir bastante na área de assincronicidade e tratamento de erros e acho de muita importância dar mais atenção a ela.
        - E muitos outros, provavelmente.

    Mas no mais é isso, desenvolvimento é um aprendizado constante. Agradeço de coração ao Studio Sol pela oportunidade e me disponho para quaisquer esclarecimentos ou futuras conversas. Adoraria ter um feedback, e mais ainda receber uma notícia positiva de vocês! 👀🙏
