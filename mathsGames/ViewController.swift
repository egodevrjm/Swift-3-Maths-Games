//
//  ViewController.swift
//  mathsGames
//
//  Created by Ryan Morrison and Kailen-James Morrison on 03/09/2017.
//  Copyright © 2017 egoDev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var lblQuestion: UILabel!
    
    @IBOutlet var lblTotal: UILabel!
    
    @IBOutlet var lblCorrectIncorrect: UILabel!

    //btn style
    
    @IBOutlet var btnA1Style: UIButton!
    @IBOutlet var btnA2Style: UIButton!
    @IBOutlet var btnA3Style: UIButton!
    @IBOutlet var btnA4Style: UIButton!
    @IBOutlet var btnResetStyle: UIButton!
    
    
    var firstNum: Int = 0
    var secondNum: Int = 0
    var answer: Int = 0
    
    var totalCorrect: Int = 0
    var correctIncorrect = ""
    
    var buttonRandom: Int = 0
    var answerRandom: Int = 0
    
    var wrongAnswer1: Int = 0
    var wrongAnswer2: Int = 0
    var wrongAnswer3: Int = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        randomNumbers()
        btnA1Style.layer.cornerRadius = 6.0
        btnA2Style.layer.cornerRadius = 6.0
        btnA3Style.layer.cornerRadius = 6.0
        btnA4Style.layer.cornerRadius = 6.0
        btnResetStyle.layer.cornerRadius = 10.0
        
        printBtnText()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btnA1Action(_ sender: UIButton) {
        
        if buttonRandom == 0 {
            
            buttonCorrect0()
            randomNumbers()
        }  else if buttonRandom != 0 {
            wrongAnswerVoid()
        }
        
        
        
    }
    
    @IBAction func btnA2Action(_ sender: UIButton) {
       
        if buttonRandom == 1 {
            
            buttonCorrect1()
            randomNumbers()
            
        } else if buttonRandom != 1 {
            
            wrongAnswerVoid()
            
        }
        
    }
    
    @IBAction func btnA3Action(_ sender: UIButton) {
        
        if buttonRandom == 2 {
            
            buttonCorrect2()
            randomNumbers()
            
        }  else if buttonRandom != 2 {
            
            wrongAnswerVoid()
            
        }
    }
    
    @IBAction func btnA4Action(_ sender: UIButton) {
        
        if buttonRandom == 3 {
            
            buttonCorrect3()
            randomNumbers()
            
        }  else if buttonRandom != 3 {
            
            wrongAnswerVoid()
            
        }
    }
    
    @IBAction func btnResetAction(_ sender: UIButton) {
        randomNumbers()
        totalCorrect = 0
        lblTotal.text = "Score: 0"
        lblCorrectIncorrect.text = "Select an answer"
        lblCorrectIncorrect.backgroundColor = UIColor.clear
        lblCorrectIncorrect.textColor = UIColor.black
    }
    
    
    //funcs 
    func randomNumbers() {
        
        firstNum = Int(arc4random_uniform(9))
        secondNum = Int(arc4random_uniform(9))
        answer = firstNum + secondNum
        
        wrongAnswer1 = Int(arc4random_uniform(5))
        wrongAnswer2 = Int(arc4random_uniform(5))
        wrongAnswer3 = Int(arc4random_uniform(5))
        
        buttonRandom = Int(arc4random_uniform(4))
        
        randomNumberChecks()
        
        printQ()
        printBtnText()
        
    }
    
    func randomNumberChecks() {
        
        if answer == wrongAnswer1 || answer == wrongAnswer2 || answer == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer2 == wrongAnswer3 || wrongAnswer1 == wrongAnswer3 {
           
            wrongAnswer1 = Int(arc4random_uniform(20))
            wrongAnswer2 = Int(arc4random_uniform(22))
            wrongAnswer3 = Int(arc4random_uniform(33))
            
             if answer == wrongAnswer1 || answer == wrongAnswer2 || answer == wrongAnswer3 || wrongAnswer1 == wrongAnswer2 || wrongAnswer2 == wrongAnswer3 || wrongAnswer1 == wrongAnswer3 {
                
                wrongAnswer1 = 20
                wrongAnswer2 = 21
                wrongAnswer3 = 28
                
            }
            
        }
        
    }
    
    func printQ() {
        
        lblQuestion.text = "\(firstNum) + \(secondNum) = ?"
        
    }
    
    func printBtnText() {
        
        if buttonRandom == 0 {
            
            btnA1Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer1)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer3)", for: .normal)
            
        }
        if buttonRandom == 1 {
            
            btnA2Style.setTitle("\(answer)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer1)", for: .normal)
            
        }
        if buttonRandom == 2 {
            
            btnA3Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer2)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA4Style.setTitle("\(wrongAnswer1)", for: .normal)
            
        }
        if buttonRandom == 3 {
            
            btnA4Style.setTitle("\(answer)", for: .normal)
            btnA2Style.setTitle("\(wrongAnswer1)", for: .normal)
            btnA3Style.setTitle("\(wrongAnswer3)", for: .normal)
            btnA1Style.setTitle("\(wrongAnswer2)", for: .normal)
            
        }
        
    }
    
    func wrongAnswerVoid() {
        
        correctIncorrect = "Incorrect"
         printStats()
        
    }
    
    
    func buttonCorrect0() {
        
        correctLogic()
        printStats()
        
    }
    
    func buttonCorrect1() {
        
        correctLogic()
        printStats()
        
    }
    
    func buttonCorrect2() {
        
        correctLogic()
        printStats()
        
    }
    
    func buttonCorrect3() {
        
        correctLogic()
        printStats()
        
    }
    
    func correctLogic() {
        
        totalCorrect += 1
        correctIncorrect = "Correct"
        
    }

    func printStats() {
        
        lblTotal.text = "Score: \(totalCorrect)"
        lblCorrectIncorrect.text = "\(correctIncorrect)"
        
        if correctIncorrect == "Correct" {
            lblCorrectIncorrect.backgroundColor = UIColor.green
            lblCorrectIncorrect.textColor = UIColor.white
        } else if correctIncorrect == "Incorrect" {
            lblCorrectIncorrect.backgroundColor = UIColor.red
            lblCorrectIncorrect.textColor = UIColor.white
        } else {
            lblCorrectIncorrect.text = ""
            lblCorrectIncorrect.backgroundColor = UIColor.clear
            lblCorrectIncorrect.textColor = UIColor.black
        }
        
        reset()
        
    }
    
    func reset() {
        
        randomNumbers()
    }
    
    
}

