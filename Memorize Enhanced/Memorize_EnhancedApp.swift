//
//  Memorize_EnhancedApp.swift
//  Memorize Enhanced
//
//  Created by Jesus Mendoza on 7/27/21.
//

import SwiftUI

@main
struct Memorize_EnhancedApp: App {
    let game = MemorizeViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
