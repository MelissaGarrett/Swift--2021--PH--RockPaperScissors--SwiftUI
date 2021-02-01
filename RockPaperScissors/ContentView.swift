//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Melissa  Garrett on 1/31/21.
//

import SwiftUI

struct ContentView: View {
    let choices = ["ROCK", "PAPER", "SCISSORS"]
    let outcomes = ["LOSE", "WIN"]
    
    enum Choices: String, CaseIterable {
        case ROCK = "ROCK"
        case PAPER = "PAPER"
        case SCISSORS = "SCISSORS"
    }

    enum Outcomes: String {
        case LOSE = "LOSE"
        case WIN = "WIN"
    }
        
    @State private var appChoice = Int.random(in: 0 ..< 3)
    @State private var appOutcome = Int.random(in: 0 ..< 2)
    
    @State private var isGameOver = false
    @State private var playerWonRound = false
    @State private var gameHasStarted = false
    @State private var numRound = 1
    @State private var playerScore = 0
    
    let TOTAL_ROUNDS = 10
    
    var body: some View {
        NavigationView {
            VStack {
                if !isGameOver {
                    Text("Round \(numRound)")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding(50)
                } else {
                    Text("Player's Score: \(playerScore)")
                        .font(.title)
                        .foregroundColor(.green)
                        .padding(50)
                }
                
                HStack(spacing: 0) {
                    Text("Choice: \(choices[appChoice])")
                        .frame(minWidth: 0, maxWidth: .infinity) // equal widths for texts
                        .font(.title3)
                    
                    Text("Outcome: \(outcomes[appOutcome])")
                        .frame(minWidth: 0, maxWidth: .infinity) // equal widths for texts
                        .font(.title3)
                }
                .padding(.bottom, 100)
                
                HStack(spacing: 0) {
                    Button(action: {
                        self.checkTappedButton(userChoice: Choices.ROCK)
                    }) {
                        Text("\(Choices.ROCK.rawValue)")
                            .frame(minWidth: 0, maxWidth: .infinity) // equal widths for buttons
                            .padding() // inside button
                            .foregroundColor(.black)
                            .background(Color.yellow)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(10) // between buttons
                    }
                    
                    Button(action: {
                        self.checkTappedButton(userChoice: Choices.PAPER)
                    }) {
                        Text("\(Choices.PAPER.rawValue)")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.yellow)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(10)
                    }
                    
                    Button(action: {
                        self.checkTappedButton(userChoice: Choices.SCISSORS)
                    }) {
                        Text("\(Choices.SCISSORS.rawValue)")
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .padding()
                            .foregroundColor(.black)
                            .background(Color.yellow)
                            .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2)
                            .padding(10)
                    }
                }
                .padding(.bottom, 50)
                
                if gameHasStarted && isGameOver == false {
                    if playerWonRound {
                        Text("You won this round!")
                            .font(.title)
                    } else {
                        Text("Sorry, you lost this round.")
                            .font(.title)
                    }
                } else if isGameOver == true {
                    Text("GAME OVER!")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
                Spacer() // to move everything up
                
                }
                .navigationTitle("Rock Paper Scissors")
        }
    }
    
    func checkTappedButton(userChoice: Choices) {
        gameHasStarted = true
        
        switch (choices[appChoice]) {
        case Choices.ROCK.rawValue:
            if outcomes[appOutcome] == Outcomes.LOSE.rawValue && userChoice == .SCISSORS {
                playerWonRound = true
            } else if outcomes[appOutcome] == Outcomes.WIN.rawValue && userChoice == .PAPER {
                playerWonRound = true
            } else {
                playerWonRound = false
            }
        case Choices.PAPER.rawValue:
            if outcomes[appOutcome] == Outcomes.LOSE.rawValue && userChoice == .ROCK {
                playerWonRound = true
            } else if outcomes[appOutcome] == Outcomes.WIN.rawValue && userChoice == .SCISSORS {
                playerWonRound = true
            } else {
                playerWonRound = false
            }
        case Choices.SCISSORS.rawValue:
            if outcomes[appOutcome] == Outcomes.LOSE.rawValue && userChoice == .PAPER {
                playerWonRound = true
            } else if outcomes[appOutcome] == Outcomes.WIN.rawValue && userChoice == .ROCK {
                playerWonRound = true
            } else {
                playerWonRound = false
            }
        default:
            playerWonRound = false
        }
        
        if playerWonRound {
            playerScore += 1
        } else {
            playerScore -= 1
        }
        
        checkForEndOfGame()
    }
    
    func checkForEndOfGame() {
        if numRound >= TOTAL_ROUNDS {
            isGameOver = true
        } else {
            numRound += 1
            
            appChoice = Int.random(in: 0 ..< 3)
            appOutcome = Int.random(in: 0 ..< 2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
