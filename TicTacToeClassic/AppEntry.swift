//
//  AppEntry.swift
//  TicTacToeClassic
//
//  Created by Kelvin on 01/05/2024.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    var body: some Scene {
        WindowGroup {
            StartView()
                .environmentObject(game)
        }
    }
}
