//
//  ContentView.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 30/03/22.
//
//  Tela principal de jogo.

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    // Palpite sendo digitado
    @State private var guess: String = ""
    
    // Número a ser mostrado no display
    @State private var numOnDisplay: Int = 0
    
    // Informa se o jogo está ativo
    @State private var gameActive: Bool = false
    
    // Informa estado do jogo
    @State private var status: Status = .vazio
    
    // Informa se está editando o tamanho do LED
    @State private var isEditingSize: Bool = false
    
    // Informa se está editando a cor do LED
    @State private var isEditingColor: Bool = false
    
    // Tamanho do LED
    @State private var ledSize: Double = 0.8
    
    // Cor do LED
    @State private var ledColor: Color = .orange
    
    var body: some View {
        ZStack {
            
            //Fundo
            Color("DarkBGColor")
                .ignoresSafeArea()
            
            VStack {
                
                // Barra superior
                HStack {
                    
                    Image("Logo_Cifra_Club")
                        .resizable()
                        .frame(width: 200, height: 50)
                    
                    Spacer()
                    
                    // Botão de tamanho do LED
                    Button(
                        action: {
                            isEditingSize.toggle()
                        },
                        label: {
                            Image(systemName: "textformat.size")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        })
                    
                    // Botão de selecionar cor
                    Button(
                        action: {
                            isEditingColor.toggle()
                        },
                        label: {
                            Image(systemName: "paintpalette")
                                .frame(width: 50, height: 50)
                                .foregroundColor(.white)
                        })
                    
                    Spacer()
                }
                
                // Texto de status do jogo (maior, menor, acertou, erro, vazio)
                Text(status.rawValue)
                    .foregroundColor(.white)
                
                
                // Descomentar para ver o número aleatório a ser adivinhado
                // Text(String(viewModel.randNumber))
                    // .foregroundColor(.white)
                
                
                // Display LED com 3 algarismos
                LEDDisplayTriple(number: numOnDisplay, color: ledColor)
                    .scaleEffect(ledSize)
                
                // Botão de novo jogo
                // Só aparece quando jogo está inativo
                if !gameActive {
                    Button(
                        action: {
                            //Inicia novo jogo
                            newGame()
                        },
                        label: {
                            Text("Novo Jogo")
                                .padding(10)
                                .background(Color.orange)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        })
                        .shadow(radius: 2)
                }
                
                Spacer()
                
                // Elementos inferiores
                HStack {
                    
                    // Caixa de texto
                    TextField("Digite o palpite",text: $guess)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .disabled(!gameActive)
                        .keyboardType(.decimalPad)
                    
                    // Botão Enviar
                    Button(
                        action: {
                            // Manda o palpite
                            sendGuess()
                        },
                        label: {
                            Text("ENVIAR")
                                .padding(10)
                                .background(gameActive ?  Color.orange : Color.gray)
                                .cornerRadius(10)
                                .foregroundColor(.white)
                        })
                        .disabled(!gameActive)
                        .shadow(radius: 2)
                }
                .padding()
            }
            
            // Mostrar slider de tamanho do LED
            if isEditingSize {
                SliderPopUp(value: $ledSize)
                    .position(x: 230, y: 80)
            }
            
            // Mostrar picker de cores
            if isEditingColor {
                MyColorPicker(selectedColor: $ledColor)
            }
        }
        
        // Quando abrir o app, tornar jogo ativo e começar a checar erros
        .onAppear {
            newGame()
            checkForErrors()
        }
        
        // Quando houver um toque em qualquer lugar da tela principal
        .onTapGesture {
            let keyWindow = UIApplication.shared.connectedScenes
                               .filter({$0.activationState == .foregroundActive})
                               .map({$0 as? UIWindowScene})
                               .compactMap({$0})
                               .first?.windows
                               .filter({$0.isKeyWindow}).first
            
            // Dispensar teclado
            keyWindow!.endEditing(true)
            
            // Dispensar slider de tamanho do LED
            isEditingSize = false
            
            // Dispensar picker de cores
            isEditingColor = false
        }
    }
    
    // Novo jogo
    func newGame() {
        // Pede um novo número aleatório ao ViewModel
        viewModel.getRandomNumber()
        
        // Limpa a caixa de texto
        guess = ""
        
        // Número no display volta a ser zero
        numOnDisplay = 0
        
        // Torna jogo ativo
        gameActive = true
        
        // Limpa o status
        status = .vazio
    }
    
    // Compara palpite com número aleatório, caso seja válido.
    func sendGuess() {
        
        // Se palpite não é vazio e não tem mais que 3 algarismos...
        if guess == "" || guess.count > 3 {
            return
        }
        // Se palpite é um número...
        for char in guess {
            if !char.isNumber {
                return
            }
        }
        
        // ...então número a ser mostrado no display já pode ser o número digitado
        numOnDisplay = Int(guess)!
        
        // Limpa caixa de texto
        guess = ""
        
        // Mostra status correspondente ao palpite
        if numOnDisplay < viewModel.randNumber {
            status = .maior
        }
        else if numOnDisplay > viewModel.randNumber {
            status = .menor
        }
        else {
            status = .acertou
            
            // Se acertou, torna jogo inativo (vitória!)
            gameActive = false
        }
        
    }
    
    //Verifica erros em um intervalo definido.
    //Essa é uma solução bem ruim, asnyc/await seria bem mais elegante e mais consistente.
    func checkForErrors() {
        if viewModel.statusCode != 200 && gameActive {
            status = .erro
            numOnDisplay = viewModel.statusCode
            gameActive = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            checkForErrors()
        }
    }
    
    // Casos possíveis do status
    enum Status: String {
        case maior = "É maior"
        case menor = "É menor"
        case erro = "Erro"
        case acertou = "Acertou!"
        case vazio = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(ViewModel())
        }
        
    }
}
