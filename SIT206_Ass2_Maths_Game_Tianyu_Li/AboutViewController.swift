//
//  AboutViewController.swift
//  SIT206_Ass2_Maths_Game_Tianyu_Li
//
//  Created by 李天宇 on 2017/5/8.
//  Copyright © 2017年 Deakin. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {
    
    //This function is for Github Button, user can touch this button to open YouTube website.
    @IBAction func GithubButton(_ sender: UIButton) {
        //When user touch this button, the alert will be displayed, and two options can be choosed. Touch Yes will open Safari, touch no the alert will hide.
        let alertController = UIAlertController(title:"Alert", message: "Do you want to open Github website?", preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style:.default) {
            (action) -> Void in UIApplication.shared.open(URL(string: "https://github.com/ltynaive/SIT206_Assignment-2")!, options: [:], completionHandler: nil)}
        
        let noAction = UIAlertAction(title: "No", style:.default, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //This function is for YouTube Button, user can touch this button to open YouTube website.
    @IBAction func YoutubeButton(_ sender: UIButton) {
        //When user touch this button, the alert will be displayed, and two options can be choosed. Touch Yes will open Safari, touch no the alert will hide.
        let alertController = UIAlertController(title:"Alert", message: "Do you want to open Youtube website?", preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style:.default) {
            (action) -> Void in UIApplication.shared.open(URL(string: "https://github.com/ltynaive/SIT206_Assignment-2")!, options: [:], completionHandler: nil)}
        
        let noAction = UIAlertAction(title: "No", style:.default, handler: nil)
        
        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    
    //This function is for Trello Board Button, user can touch this button to open Trello website.
    @IBAction func TrelloBoardButton(_ sender: UIButton) {
        //When user touch this button, the alert will be displayed, and two options can be choosed. Touch Yes will open Safari, touch no the alert will hide.
        let alertController = UIAlertController(title:"Alert", message: "Do you want to open Trello Board website?", preferredStyle: .actionSheet)
        
        let yesAction = UIAlertAction(title: "Yes", style:.default) {
            (action) -> Void in UIApplication.shared.open(URL(string: "https://trello.com/b/qHLYzqtP/sit206-ass2-maths-game")!, options: [:], completionHandler: nil)}
        
        let noAction = UIAlertAction(title: "No", style:.default, handler: nil)

        alertController.addAction(yesAction)
        alertController.addAction(noAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
