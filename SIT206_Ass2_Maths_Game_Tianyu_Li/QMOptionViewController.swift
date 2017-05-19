//
//  QMOptionViewController.swift
//  SIT206_Ass2_Maths_Game_Tianyu_Li
//
//  Created by 李天宇 on 2017/5/15.
//  Copyright © 2017年 Deakin. All rights reserved.
//

import UIKit

class QMOptionViewController: UIViewController {

    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    var ScoretoWin = Int(10)
    var Time = Int(45)
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimeLabel.text = "\(Time)"
        ScoreLabel.text = "\(ScoretoWin)"

        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func TimeStepper(_ sender: UIStepper) {
        let stepperval = sender.value
        Time = Int(stepperval)
        TimeLabel.text = "\(stepperval)"
    }
    
    @IBAction func ScoreStepper(_ sender: UIStepper) {
        let stepperval = sender.value
        ScoretoWin = Int(stepperval)
        ScoreLabel.text = "\(stepperval)"
    }
    
    // When the player touch save button, the data will be sent to QMGameViewController.
    @IBAction func SaveButton(_ sender: Any) {
        self.performSegue(withIdentifier: "saveoptions", sender: self)
    }

    
    


    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // Check the identifier, sent data to QMGameViewController.
        if segue.identifier == "saveoptions" {
            let destination = segue.destination as! QMGameViewController
            destination.timeleft = Time
            destination.scoretowin = ScoretoWin
            UserDefaults.standard.set(Time, forKey: "totaltime")
            UserDefaults.standard.set(ScoretoWin, forKey: "scoretowin")
            dismiss(animated: true, completion: nil)
        }

    }
    
}
