//
//  QuestionViewController.swift
//  Question Me Game
//
//  Created by Simon Mc Neil on 2019-01-15.
//  Copyright © 2019 Simon Mc Neil. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var pointLabel: UILabel!
    @IBOutlet weak var questionImageView: UIImageView!
    @IBOutlet weak var questionLabel: UILabel!
    
    var game: QMeeGame = QMeeGame()
    
    //when the View Conrtroller is loaded this method gets called.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pointLabel.text = "--"
        let starterImage = UIImage(named: "2")
        questionImageView.image = starterImage
        questionLabel.text = "Tap the true button to start a new game!"
        
        falseButton.isEnabled = false
        
    }
    
    @IBAction func trueButtonDidTap() {
        if pointLabel.text == "--" {
            //this is a new game. we want to start the game now.
            game.point = 0
            falseButton.isEnabled = true
        } else {
            game.point += 1
        }
        updateGameUI()
    }
    
    @IBAction func falseButtonDidTap() {
        game.point -= 1
        updateGameUI()
    }
    
    func updateGameUI() {
        let nextQuestion = game.getNextQuestion()
        let questionImage = game.getQuestionImageName()
        let image = UIImage(named: questionImage)
        questionImageView.image = image
        questionLabel.text = nextQuestion
        pointLabel.text = "\(game.point)"
    }
}
