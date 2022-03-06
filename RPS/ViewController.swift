//
//  ViewController.swift
//  RPS
//
//  Created by Lucas da Silva Reis on 04/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var rockButton: UIButton!
    @IBOutlet weak var paperButton: UIButton!
    @IBOutlet weak var scissorsButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func selectedRock(_ sender: Any) {
        play(Sign.rock)
    }
    @IBAction func selectedPaper(_ sender: Any) {
        play(Sign.paper)
    }
    @IBAction func selectedScissors(_ sender: Any) {
        play(Sign.scissors)
    }
    @IBAction func selectedPlayAgain(_ sender: Any) {
        reset()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topLabel.text = "🤖"
        statusLabel.text = "Pedra, Papel, Tesoura?"
    }
    
    func reset()
    {
        topLabel.text = "🤖"
        statusLabel.text = "Pedra, Papel, Tesoura?"
        rockButton.isHidden = false
        paperButton.isHidden = false
        scissorsButton.isHidden = false
        rockButton.isEnabled = true
        paperButton.isEnabled = true
        scissorsButton.isEnabled = true
        playAgainButton.isHidden = true
        
    }
    
    func play(_ playRound: Sign){
        rockButton.isEnabled = false
        paperButton.isEnabled = false
        scissorsButton.isEnabled = false
        
        let opponent = randomSign()
        topLabel.text = opponent.emoji
        
        let currentState = playRound.game(opponent)
        
        switch currentState {
        case .lose:
            statusLabel.text = "Você perdeu!!! 😔"
        case .start:
            statusLabel.text = "Pedra, Papel, Tesoura"
        case .win:
            statusLabel.text = "Você ganhou!!! 👏👏👏"
        case .tie:
            statusLabel.text = "Empate"
        }
        
        switch playRound {
        case .rock:
            rockButton.isHidden = false
            paperButton.isHidden = true
            scissorsButton.isHidden = true
        case .paper:
            rockButton.isHidden = true
            paperButton.isHidden = false
            scissorsButton.isHidden = true
        case .scissors:
            rockButton.isHidden = true
            paperButton.isHidden = true
            scissorsButton.isHidden = false
        }
        
        playAgainButton.isHidden = false
        
    }


}

