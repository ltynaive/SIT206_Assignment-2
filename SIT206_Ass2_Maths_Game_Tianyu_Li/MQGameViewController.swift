//
//  MQGameViewController.swift
//  SIT206_Ass2_Maths_Game_Tianyu_Li
//
//  Created by 李天宇 on 2017/5/16.
//  Copyright © 2017年 Deakin. All rights reserved.
//

import UIKit
import AVFoundation

class MQGameViewController: UIViewController {
    
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var ansButton1: UIButton!
    @IBOutlet weak var ansButton2: UIButton!
    @IBOutlet weak var ansButton3: UIButton!
    @IBOutlet weak var ansButton4: UIButton!
    @IBOutlet weak var ResultLabel: UILabel!
    @IBOutlet weak var NextQuizButton: UIButton!
    @IBOutlet weak var NextQuizButtonImage: UIImageView!
    @IBOutlet weak var MusicPauseButton: UIButton!
    @IBOutlet weak var MusicPlayButton: UIButton!
    @IBOutlet weak var ScoreTextView: UITextView!
    
    
    var num1 = Int()
    var num2 = Int()
    var signnum = Int()
    var sign = String()
    var score = Int(0)
    var answer = Int()
    var ansmixnum = Int()
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gamestart()
        //Background Music
        let path =
            Bundle.main.path(forResource: "MQGameBGM", ofType:"mp3")
        
        let url = URL(fileURLWithPath: path!)
        
        do {
            try soundPlayer = AVAudioPlayer(contentsOf: url)
        }
            
        catch { print ("file not available")}
        
        
        // when game running, the BGM will play.
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // gamestart function is maths quizs game, when game start, this funciton will running, question and answer buttons will be displayed. There are 3 case, +, -, *.
    func gamestart() {
        QuestionLabel.isHidden = false
        ansButton1.isHidden = false
        ansButton2.isHidden = false
        ansButton3.isHidden = false
        ansButton4.isHidden = false
        ResultLabel.isHidden = true
        NextQuizButtonImage.isHidden = true
        NextQuizButton.isHidden = true
        ScoreLabel.text = "Score:\(score)"
        MusicPlayButton.isHidden = true
        MusicPauseButton.isHidden = false
        ScoreTextView.isHidden = true
        num1 = Int(arc4random_uniform(500))
        num2 = Int(arc4random_uniform(500))
        signnum = Int(arc4random_uniform(3))
        switch signnum {
        //case 0 is plus.
        case 0:
            sign = "+"
            answer = num1 + num2
            QuestionLabel.text = "\(num1)\(sign)\(num2) = "
            ansmixnum = Int(arc4random_uniform(4))
            switch ansmixnum {
            case 0:
                ansButton1.setTitle("\(answer-2)", for: .normal)
                ansButton2.setTitle("\(answer-1)", for: .normal)
                ansButton3.setTitle("\(answer)", for: .normal)
                ansButton4.setTitle("\(answer+1)", for: .normal)
            case 1:
                ansButton1.setTitle("\(answer-1)", for: .normal)
                ansButton2.setTitle("\(answer)", for: .normal)
                ansButton3.setTitle("\(answer+1)", for: .normal)
                ansButton4.setTitle("\(answer-2)", for: .normal)
            case 2:
                ansButton1.setTitle("\(answer)", for: .normal)
                ansButton2.setTitle("\(answer+1)", for: .normal)
                ansButton3.setTitle("\(answer-2)", for: .normal)
                ansButton4.setTitle("\(answer-1)", for: .normal)
            case 3:
                ansButton1.setTitle("\(answer+1)", for: .normal)
                ansButton2.setTitle("\(answer-2)", for: .normal)
                ansButton3.setTitle("\(answer-1)", for: .normal)
                ansButton4.setTitle("\(answer)", for: .normal)
            default:
                break
            }
            break
        case 1:
        //case 1 is minus.
            sign = "-"
            answer = num1 - num2
            QuestionLabel.text = "\(num1)\(sign)\(num2) = "
            ansmixnum = Int(arc4random_uniform(4))
            switch ansmixnum {
            case 0:
                ansButton1.setTitle("\(answer-2)", for: .normal)
                ansButton2.setTitle("\(answer-1)", for: .normal)
                ansButton3.setTitle("\(answer)", for: .normal)
                ansButton4.setTitle("\(answer+1)", for: .normal)
            case 1:
                ansButton1.setTitle("\(answer-1)", for: .normal)
                ansButton2.setTitle("\(answer)", for: .normal)
                ansButton3.setTitle("\(answer+1)", for: .normal)
                ansButton4.setTitle("\(answer-2)", for: .normal)
            case 2:
                ansButton1.setTitle("\(answer)", for: .normal)
                ansButton2.setTitle("\(answer+1)", for: .normal)
                ansButton3.setTitle("\(answer-2)", for: .normal)
                ansButton4.setTitle("\(answer-1)", for: .normal)
            case 3:
                ansButton1.setTitle("\(answer+1)", for: .normal)
                ansButton2.setTitle("\(answer-2)", for: .normal)
                ansButton3.setTitle("\(answer-1)", for: .normal)
                ansButton4.setTitle("\(answer)", for: .normal)
            default:
                break
            }
            break
        case 2:
        //case 2 is multiply.
            sign = "x"
            answer = num1 * num2
            QuestionLabel.text = "\(num1)\(sign)\(num2) = "
            ansmixnum = Int(arc4random_uniform(4))
            switch ansmixnum {
            case 0:
                ansButton1.setTitle("\(answer-2)", for: .normal)
                ansButton2.setTitle("\(answer-1)", for: .normal)
                ansButton3.setTitle("\(answer)", for: .normal)
                ansButton4.setTitle("\(answer+1)", for: .normal)
            case 1:
                ansButton1.setTitle("\(answer-1)", for: .normal)
                ansButton2.setTitle("\(answer)", for: .normal)
                ansButton3.setTitle("\(answer+1)", for: .normal)
                ansButton4.setTitle("\(answer-2)", for: .normal)
            case 2:
                ansButton1.setTitle("\(answer)", for: .normal)
                ansButton2.setTitle("\(answer+1)", for: .normal)
                ansButton3.setTitle("\(answer-2)", for: .normal)
                ansButton4.setTitle("\(answer-1)", for: .normal)
            case 3:
                ansButton1.setTitle("\(answer+1)", for: .normal)
                ansButton2.setTitle("\(answer-2)", for: .normal)
                ansButton3.setTitle("\(answer-1)", for: .normal)
                ansButton4.setTitle("\(answer)", for: .normal)
            default:
                break
            }
            break
        default:
            break
        }
    
    }
    
    //This is answer1 button function. This function will determine whether this option is correct. When ansmixnum = 2, this button is correct option.
    @IBAction func answer1(_ sender: UIButton) {
        ResultLabel.isHidden = false
        NextQuizButtonImage.isHidden = false
        NextQuizButton.isHidden = false
        if ansmixnum == 0 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 1 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 2 {
            score = score + 1
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Correct!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
        } else if ansmixnum == 3 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        }
    }
    
    //This is answer2 button function. This function will determine whether this option is correct. When ansmixnum = 1, this button is correct option.
    @IBAction func answer2(_ sender: UIButton) {
        ResultLabel.isHidden = false
        NextQuizButtonImage.isHidden = false
        NextQuizButton.isHidden = false
        if ansmixnum == 0 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 1 {
            score = score + 1
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Correct!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
        } else if ansmixnum == 2 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 3 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        }

    }
    
    //This is answer3 button function. This function will determine whether this option is correct. When ansmixnum = 0, this button is correct option.
    @IBAction func answer3(_ sender: UIButton) {
        ResultLabel.isHidden = false
        NextQuizButtonImage.isHidden = false
        NextQuizButton.isHidden = false
        if ansmixnum == 0 {
            score = score + 1
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Correct!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
        } else if ansmixnum == 1 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 2 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 3 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        }
    }
    
    //This is answer4 button function. This function will determine whether this option is correct. When ansmixnum = 3, this button is correct option.
    @IBAction func answer4(_ sender: UIButton) {
        ResultLabel.isHidden = false
        NextQuizButtonImage.isHidden = false
        NextQuizButton.isHidden = false
        if ansmixnum == 0 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 1 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 2 {
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Incorrect!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            NextQuizButtonImage.isHidden = true
            NextQuizButton.isHidden = true
            alertLost()
            ScoreTextView.isHidden = false
            ResultLabel.text = "You Lost!"
            ScoreTextView.text! += "Score:\(score)\n"
        } else if ansmixnum == 3 {
            score = score + 1
            ScoreLabel.text = "Score:\(score)"
            ResultLabel.text = "Correct!"
            QuestionLabel.isHidden = true
            ansButton1.isHidden = true
            ansButton2.isHidden = true
            ansButton3.isHidden = true
            ansButton4.isHidden = true
            
        }
    }
    
    
    //When the player loses, this function will run. There will be an alert is displayed, and shows you lost, player can touch play again button to restart game.
    func alertLost(){
        let alertController = UIAlertController(title:"Alert", message: "You Lost!",
            preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Play Again", style:.default) {
            (action) -> Void in self.reset()}
        
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }

    //This funciton is for nextquiz button, when player touch this button, gamestart function will be run.
    @IBAction func NextQuiz(_ sender: UIButton) {
        gamestart()
    }
    
    //reset function, The difference between this function and the gamestart function is that the score will be cleared and the view will be reloaded.
    func reset() {
        viewDidLoad()
        score = 0
        ScoreLabel.text = "Score:\(score)"
    }
    
    //Touch reset button the reset function will be run.      
    @IBAction func reset(_ sender: UIButton) {
        reset()
    }
    
    //return button, dismiss this view, and stop background music.
    @IBAction func Return(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        if soundPlayer != nil {
            soundPlayer!.stop()
            elapsedTime = 0
        }
    }
    
    //Touch musicplay button will play the music.
    @IBAction func MusicPlay(_ sender: UIButton) {
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
            MusicPauseButton.isHidden = false
            MusicPlayButton.isHidden = true
        }
    }
    
    //Touch musicplay button will pause the music.
    @IBAction func MusicPause(_ sender: UIButton) {
        if soundPlayer != nil {
            elapsedTime = soundPlayer!.currentTime
            soundPlayer!.pause()
            MusicPauseButton.isHidden = true
            MusicPlayButton.isHidden = false
            
        }
    }

}
