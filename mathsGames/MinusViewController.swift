//
//  MinusViewController.swift
//  mathsGames
//
//  Created by Ryan Morrison on 03/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class MinusViewController: UIViewController {
    
    @IBOutlet var lblQuestion: UILabel!
    
    @IBOutlet var lblCorrectIncorrect: UILabel!
    
    @IBOutlet var btnA1Style: UIButton!
    @IBOutlet var btnA2Style: UIButton!
    @IBOutlet var btnA3Style: UIButton!
    @IBOutlet var btnA4Style: UIButton!
    @IBOutlet var btnReset: UIButton!
    
    @IBOutlet var lblScore: UILabel!
    
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var answer: Int = 0
    
    var totalCorrect: Int = 0
    var correctIncorrect = ""
    
    var buttonCorrect: Int = 0
    var answerRandom: Int = 0
    
    var wrongAnswer1: Int = 0
    var wrongAnswer2: Int = 0
    var wrongAnswer3: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        btnA1Style.layer.cornerRadius = 6.0
        btnA2Style.layer.cornerRadius = 6.0
        btnA3Style.layer.cornerRadius = 6.0
        btnA4Style.layer.cornerRadius = 6.0
        btnReset.layer.cornerRadius = 10.0
        
        randomNumbers()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func randomNumbers() {
        
        firstNum = 1 * Int(arc4random_uniform(UInt32(20)))
        secondNum = 1 * Int(arc4random_uniform(UInt32(20)))
        
        answer = firstNum - secondNum
        
        
        wrongAnswer1 = 1 * Int(arc4random_uniform(UInt32(15)))
        wrongAnswer2 = 1 * Int(arc4random_uniform(UInt32(17)))
        wrongAnswer3 = 1 * Int(arc4random_uniform(UInt32(10)))
        
        buttonCorrect = Int(arc4random_uniform(4))
        
        
        randomNumberChecks()
        
        printQ()
        printBtnTxt()
        
    }
    
    func randomNumberChecks() {
        
        if answer == wrongAnswer1 || answer == wrongAnswer2 || answer == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer2 == wrongAnswer3 || wrongAnswer1 == wrongAnswer3 {
            
            wrongAnswer1 = 1 * Int(arc4random_uniform(UInt32(18)))
            wrongAnswer2 = 1 * Int(arc4random_uniform(UInt32(10)))
            wrongAnswer3 = 1 * Int(arc4random_uniform(UInt32(16)))
            
            if answer == wrongAnswer1 || answer == wrongAnswer2 || answer == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer2 == wrongAnswer3 || wrongAnswer1 == wrongAnswer3 {
                
                wrongAnswer1 = -2
                wrongAnswer2 = 7
                wrongAnswer3 = -6
                
            }
            
        }
        
    }
    
    
    func printQ() {
        
        lblQuestion.text = "\(firstNum) - \(secondNum) = ?"
        
    }
    
    func printBtnTxt() {
        
        if buttonCorrect == 0 {
            
            btnA1Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer1)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer3)", for: .normal)
            
        }
        if buttonCorrect == 1 {
            
            btnA2Style.setTitle("\(answer)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer1)", for: .normal)
            
        }
        if buttonCorrect == 2 {
            
            btnA3Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer1)", for: .normal)
            
        }
        if buttonCorrect == 3 {
            
            btnA4Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer1)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer2)", for: .normal)
            
        }
    }
    
    func incorrectLogic() {
        
        correctIncorrect = "Incorrect"
        printScore()
        reset()
        
    }
    
    
    func correctLogic() {
        
        totalCorrect += 1
        correctIncorrect = "Correct"
        printScore()
        reset()
        
    }
    
    func reset() {
        
        randomNumbers()
        
    }
    
    func printScore() {
        
        lblScore.text = "Score: \(totalCorrect)"
        
        if correctIncorrect == "Correct" {
            lblCorrectIncorrect.text = "\(correctIncorrect)"
            lblCorrectIncorrect.backgroundColor = UIColor.green
            lblCorrectIncorrect.textColor = UIColor.white
        } else if correctIncorrect == "Incorrect" {
            lblCorrectIncorrect.text = "\(correctIncorrect)"
            lblCorrectIncorrect.backgroundColor = UIColor.red
            lblCorrectIncorrect.textColor = UIColor.white
        }
        
    }
    
    func btn0Correct() {
        
        correctLogic()
        
    }
    func btn1Correct() {
        
        correctLogic()
        
    }
    func btn2Correct() {
        
        correctLogic()
        
    }
    func btn3Correct() {
        
        correctLogic()
        
    }
    
    

    @IBAction func btnA1Action(_ sender: UIButton) {
        
        if buttonCorrect == 0 {
            btn0Correct()
        } else if buttonCorrect != 0 {
            incorrectLogic()
        }
    }
    
    @IBAction func btnA2Action(_ sender: UIButton) {
        
        if buttonCorrect == 1 {
            btn1Correct()
        } else if buttonCorrect != 1 {
            incorrectLogic()
        }
    }
    
    @IBAction func btnA3Action(_ sender: UIButton) {
        
        if buttonCorrect == 2 {
            btn2Correct()
        } else if buttonCorrect != 2 {
            incorrectLogic()
        }
    }
   
    @IBAction func btnA4Action(_ sender: UIButton) {
        
        if buttonCorrect == 3 {
            btn3Correct()
        } else if buttonCorrect != 3 {
            incorrectLogic()
        }
        
    }
    
    @IBAction func btnReset(_ sender: UIButton) {
        
        randomNumbers()
        totalCorrect = 0
        lblScore.text = "Score: 0"
        lblCorrectIncorrect.text = "Select an answer"
        lblCorrectIncorrect.backgroundColor = UIColor.clear
        lblCorrectIncorrect.textColor = UIColor.black
    }
    
    
    

}
