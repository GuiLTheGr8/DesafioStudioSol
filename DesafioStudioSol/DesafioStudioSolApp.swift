//
//  DesafioStudioSolApp.swift
//  DesafioStudioSol
//
//  Created by Guilherme Vassallo on 30/03/22.
//

import SwiftUI

@main
struct DesafioStudioSolApp: App {
    
    var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
