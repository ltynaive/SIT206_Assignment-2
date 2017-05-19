//
//  QMGameViewController.swift
//  SIT206_Ass2_Maths_Game_Tianyu_Li
//
//  Created by 李天宇 on 2017/5/8.
//  Copyright © 2017年 Deakin. All rights reserved.
//

import UIKit
import AVFoundation

class QMGameViewController: UIViewController {

    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var NextQuestionImage: UIImageView!
    @IBOutlet weak var MusicPauseButton: UIButton!
    @IBOutlet weak var MusicPlayButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
    var timeleft = Int(45)
    var scoremath = Int(0)
    var answer = Int()
    var number1 = Int()
    var number2 = Int()
    var sign = String()
    var signnum = Int()
    var timer = Timer()
    var scoretowin = Int(10)
    var pointspproblem = Int(1)
    var soundPlayer: AVAudioPlayer?
    var elapsedTime: TimeInterval = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        startButton.isHidden = false
        question.isHidden = true
        resultLabel.isHidden = true
        nextQuestion.isHidden = true
        answerField.isHidden = true
        score.isHidden = true
        timeLabel.isHidden = true
        submitButton.isHidden = true
        NextQuestionImage.isHidden = true
        MusicPlayButton.isHidden = true
        MusicPauseButton.isHidden = true
        resetButton.isHidden = true
        nextQuestion.setTitle("Next Question", for: UIControlState())
        timeleft = UserDefaults.standard.integer(forKey: "totaltime")
        scoretowin = UserDefaults.standard.integer(forKey: "scoretowin")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // start button function, touch this button the game will start.
    @IBAction func start(_ sender: UIButton) {
        resultLabel.isHidden = true
        NextQuestionImage.isHidden = true
        nextQuestion.isHidden = true
        startButton.isHidden = true
        number1 = Int(arc4random_uniform(UInt32(50)))
        number2 = Int(arc4random_uniform(UInt32(50)))
        signnum = Int(arc4random_uniform(UInt32(3)))
        score.isHidden = false
        timeLabel.isHidden = false
        resetButton.isHidden = false
        MusicPauseButton.isHidden = false
        // 3 case, +, -, *.
        switch signnum {
        case 0:
            sign = "+"
            answer = number1 + number2
            break
        case 1:
            sign = "-"
            answer = number1 - number2
            break
        case 2:
            sign = "x"
            answer = number1 * number2
            break
        default:
            break
        }
        question.text = "\(number1)\(sign)\(number2) = "
        question.isHidden = false
        answerField.isHidden = false
        submitButton.isHidden = false
        answerField.text = ""
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QMGameViewController.timeswitch), userInfo: nil, repeats: true)
        
        
        //Background Music
        let path =
            Bundle.main.path(forResource: "QMGameBGM", ofType:"mp3")
        
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
    }
    
    // submit button function, this function will check the answer is correct or incorrect.
    @IBAction func submit(_ sender: UIButton) {
        question.isHidden = true
        answerField.isHidden = true
        submitButton.isHidden = true
        if Int(answerField.text!) == answer {
            resultLabel.isHidden = false
            NextQuestionImage.isHidden = false
            nextQuestion.isHidden = false
            resultLabel.text = "Correct!"
            scoremath = scoremath + pointspproblem
            score.text = "\(scoremath)"
        } else {
            resultLabel.isHidden = false
            NextQuestionImage.isHidden = false
            nextQuestion.isHidden = false
            resultLabel.text = "Incorrect!"
            scoremath = scoremath - pointspproblem
            score.text = "\(scoremath)"
        }
        // if scoremath > scoretowin(10), the player will win.
        if scoremath >= scoretowin {
            question.isHidden = true
            answerField.isHidden = true
            submitButton.isHidden = true
            resultLabel.isHidden = false
            NextQuestionImage.isHidden = false
            nextQuestion.isHidden = false
            resultLabel.text = "You Win!"
            nextQuestion.setTitle("Play Again", for: UIControlState())
        }
        timer.invalidate()
        timeLabel.text = "\(timeleft)"
    }
    
    //nextquestion button function, similar to start function. This function will check this score first.
    @IBAction func nextQuestion(_ sender: UIButton) {
        if scoremath >= scoretowin {
            self.viewDidLoad()
        } else {
            question.isHidden = false
            answerField.isHidden = false
            submitButton.isHidden = false
            resultLabel.isHidden = true
            NextQuestionImage.isHidden = true
            nextQuestion.isHidden = true
            number1 = Int(arc4random_uniform(UInt32(50)))
            number2 = Int(arc4random_uniform(UInt32(50)))
            signnum = Int(arc4random_uniform(UInt32(3)))
            switch signnum {
            case 0:
                sign = "+"
                answer = number1 + number2
                break
            case 1:
                sign = "-"
                answer = number1 - number2
                break
            case 2:
                sign = "x"
                answer = number1 * number2
                break
            default:
                break
            }
            question.text = "\(number1)\(sign)\(number2) = "
            answerField.text = ""
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(QMGameViewController.timeswitch), userInfo: nil, repeats: true)
            timeleft = UserDefaults.standard.integer(forKey: "totaltime")
            timeLabel.text = "\(timeleft)"
        }

    }
    
    //timeswitch function, when time is up, the game will stop, and result label will shows "Time's Up!". Player should touch next question button to restart game.
    func timeswitch() {
        timeleft = timeleft - 1
        timeLabel.text = "\(timeleft)"
        if timeleft == 0 {
            timer.invalidate()
            question.isHidden = true
            answerField.isHidden = true
            submitButton.isHidden = true
            resultLabel.isHidden = false
            NextQuestionImage.isHidden = false
            nextQuestion.isHidden = false
            resultLabel.text = "Time's Up!"
            scoremath = scoremath - pointspproblem
            score.text = "\(scoremath)"
        }
    }

    //Similar to start function, but this function will stop music and replay.
    @IBAction func Reset(_ sender: UIButton) {
        resultLabel.isHidden = true
        NextQuestionImage.isHidden = true
        nextQuestion.isHidden = true
        startButton.isHidden = true
        MusicPlayButton.isHidden = true
        MusicPauseButton.isHidden = false
        number1 = Int(arc4random_uniform(UInt32(50)))
        number2 = Int(arc4random_uniform(UInt32(50)))
        signnum = Int(arc4random_uniform(UInt32(3)))
        score.isHidden = false
        timeLabel.isHidden = false
        switch signnum {
        case 0:
            sign = "+"
            answer = number1 + number2
            break
        case 1:
            sign = "-"
            answer = number1 - number2
            break
        case 2:
            sign = "x"
            answer = number1 * number2
            break
        default:
            break
        }
        question.text = "\(number1)\(sign)\(number2) = "
        question.isHidden = false
        answerField.isHidden = false
        submitButton.isHidden = false
        answerField.text = ""
        timeleft = UserDefaults.standard.integer(forKey: "totaltime")
        timeLabel.text = "\(timeleft)"
        scoremath = Int(0)
        score.text = "\(scoremath)"
        
        //stop music and replay
        if soundPlayer != nil {
            soundPlayer!.stop()
            elapsedTime = 0
        }
        
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
        }
        
    }
    
    
    //return button, dismiss this view, and stop background music.
    @IBAction func Return(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        if soundPlayer != nil {
            soundPlayer!.stop()
            elapsedTime = 0
            
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
    
    //Touch musicplay button will play the music.
    @IBAction func MusicPlay(_ sender: UIButton) {
        if soundPlayer != nil {
            soundPlayer!.currentTime = elapsedTime
            soundPlayer!.play()
            MusicPauseButton.isHidden = false
            MusicPlayButton.isHidden = true
        }
    }
    


    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
