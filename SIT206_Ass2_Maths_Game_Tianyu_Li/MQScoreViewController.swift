//
//  MQScoreViewController.swift
//  SIT206_Ass2_Maths_Game_Tianyu_Li
//
//  Created by 李天宇 on 2017/5/17.
//  Copyright © 2017年 Deakin. All rights reserved.
//

import UIKit

class MQScoreViewController: UIViewController {
    @IBOutlet weak var ScoreTextView: UITextView!

    
    var score = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreTextView.text! += score
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Return(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
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
