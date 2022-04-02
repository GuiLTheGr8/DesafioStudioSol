//
//  ViewModel.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 31/03/22.
//
//  Comunicação de rede e com o Model.

import Foundation

final class ViewModel: ObservableObject {
    
    // Número aleatório recuperado
    @Published var randNumber: Int = 0
    
    // Código de status
    // Se for 200, está tudo ok.
    // Se for diferente, algum erro ocorreu na hora do parse.
    @Published var statusCode: Int = 200
    
    // Realiza a call para o endpoint.
    // Função poderia ser melhorada com asnyc/await, closure, delegate?
    func getRandomNumber() {
        
        guard let url = URL(string: "https://us-central1-ss-devops.cloudfunctions.net/rand?min=1&max=300") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)

            let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                if let error = error {
                    print("Request error: ", error)
                    return
                }
        
        //Utilizar HTTPURLResponse para identificar erros no parse.
        guard let response = response as? HTTPURLResponse else { return }
                
                guard let data = data else {
                    return
                }
                
                // Se não houveram erros...
                if response.statusCode == 200 {
                    DispatchQueue.main.async {
                        if let parsedNumber = try? JSONDecoder().decode(RandomNumber.self, from: data) {
                            print(parsedNumber)
                            //Salvar número aleatório
                            self.statusCode = response.statusCode
                            self.randNumber = parsedNumber.value
                        }
                    }
                }
                else {
                    DispatchQueue.main.async {
                        //Salvar código de erro e resetar número aleatório
                        self.statusCode = response.statusCode
                        self.randNumber = 0
                    }
                }
            }

            dataTask.resume()
    }
    
}

// Poderia ser implementado um arquivo de serviços? Este viewModel está bem bagunçado.
