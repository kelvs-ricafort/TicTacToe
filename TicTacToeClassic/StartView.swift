//
//  StartView.swift
//  TicTacToeClassic
//
//  Created by Kelvin on 01/05/2024.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undetermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    var body: some View {
        VStack {
            Picker("Select Game", selection: $gameType) {
                Text("Select Game Type").tag(GameType.undetermined)
                Text("Single Player Game").tag(GameType.single)
                Text("Challenge your device").tag(GameType.bot)
                Text("Challenge a friend nearby").tag(GameType.peer)
            }
            .padding()
            .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
            Text(gameType.description)
                .padding()
            VStack {
                switch gameType {
                case .single:
                    VStack {
                        TextField("Your Name", text: $yourName)
                        TextField("Opponent's Name", text: $opponentName)
                    }
                case .bot:
                    TextField("Your Name", text: $yourName)
                case .peer:
                    EmptyView()
                case .undetermined:
                    EmptyView()
                }
            }
            .padding()
            .textFieldStyle(.roundedBorder)
            .focused($focus)
            .frame(width: 350)
            if gameType != .peer {
                Button("Start Game") {
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent)
                .disabled(
                    gameType == .undetermined ||
                    gameType == .bot && yourName.isEmpty ||
                    gameType == .single &&
                    (yourName.isEmpty || opponentName.isEmpty)
                )
                Image("LaunchScreen")
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Tic Tac Toe")
        .fullScreenCover(isPresented: $startGame) {
            GameView()
        }
        .inNavigationStack()
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView()
    }
}
