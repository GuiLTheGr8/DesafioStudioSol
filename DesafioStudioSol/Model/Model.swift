//
//  Model.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 30/03/22.
//
//  Estrutura dos arquivos a serem recuperados no endpoint.

// Número aleatório
struct RandomNumber: Decodable {
    let value: Int
}

//Struct para ler o erro retornado, caso fosse necessário.
//Não é necessária pois o HTTPURLResponse já nos dá o código de erro.

/*struct Error: Decodable {
    let statusCode: Int
    let error: String

    enum CodingKeys: String, CodingKey {
        case statusCode = "StatusCode"
        case error = "Error"
    }
}*/
