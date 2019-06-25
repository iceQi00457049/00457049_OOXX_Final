//
//  ViewController.swift
//  00457049_OOXX
//
//  Created by User24 on 2019/6/24.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation
import UIKit
import UserNotifications


class ViewController: UIViewController {
    
    
    var Name : String!
    var Score : String!
    
    
    var activePlayer = 1 //cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    var timer: Timer?
    var x = 9
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
       
        if(gameState[sender.tag-1] == 0 && gameIsActive == true && x > 0)
        {
          gameState[sender.tag-1] = activePlayer
          if(activePlayer == 1)
          {
            sender.setImage(UIImage(named: "叉叉.png"), for: UIControl.State())
                activePlayer = 2
                x = x-1
            if PlayagainButton.isHidden == false {
                let controller = UIAlertController(title: "提醒", message: "趕快下一局吧！", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
            }
          }
          else
          {
            sender.setImage(UIImage(named: "圈圈.jpg"), for: UIControl.State())
                activePlayer = 1
                x = x-1
            if PlayagainButton.isHidden == false {
                let controller = UIAlertController(title: "提醒", message: "趕快下一局吧！", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                controller.addAction(okAction)
                present(controller, animated: true, completion: nil)
            }
          }
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                if gameState[combination[0]]  == 1
                {
                    //Cross has won
                    label.text = "CROSS HAS WON!!"
                    x = 9
                   
                }
                else
                {
                    //Nought has won
                    label.text = "NOUGHT HAS WON!!"
                    x = 9
                    
                }
                PlayagainButton.isHidden = false
                label.isHidden = false
                }
            }
        }
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        
        if gameIsActive == false && x == 0
        {
            label.text = "IT WAS A DRAW..."
            label.isHidden = false
            PlayagainButton.isHidden = false
        }
    }
    
    @IBOutlet weak var PlayagainButton: UIButton!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    @IBAction func PLAYAGAIN(_ sender: AnyObject)
    {
        /*gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        x = 9
        
        PlayagainButton.isHidden = true
        label.isHidden = true
        SCOREButton.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for:UIControl.State())
        }*/
        if let controller = storyboard?.instantiateViewController(withIdentifier: "3") {
            present(controller, animated: true, completion: nil)
        }
    }
    

    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? score
        controller?.win = win.text
        controller?.lose = lose.text
    }
*/
    
    
  @IBAction func WL(_ sender: AnyObject) {
       /* if let controller = storyboard?.instantiateViewController(withIdentifier: "2") {
            present(controller, animated: true, completion: nil)
        }*/
    }
    
    
    
    
    
    
    @IBAction func goToWeb(_ sender: Any) {
        let content = UNMutableNotificationContent()
        content.title = "OOXX"
        content.body = "來玩圈圈叉叉啦！！"
        content.badge = 1
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification1", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var sec = 30
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (_) in
            self.timeLabel.text = String(sec)
            if sec > 0 && self.PlayagainButton.isHidden == true
            {
                sec = sec - 1
            }
            else
            {
                self.PlayagainButton.isHidden = false
                self.label.isHidden = false
                //self.SCOREButton.isHidden = false
                if self.timer != nil
                {
                    self.timer?.invalidate()
                }
            }
            
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        guard let grade = segue.destination as? Grade else {return}
        grade.labellText = timeLabel.text
        grade.labelllText = label.text
        
    }

}

