//
//  Grade.swift
//  00457049_OOXX
//
//  Created by User24 on 2019/6/25.
//  Copyright © 2019 User24. All rights reserved.
//

import Foundation
import UserNotifications
import UIKit

class Grade: UIViewController{
    
    
    
    @IBOutlet weak var labelll: UILabel!
    @IBOutlet weak var labell: UILabel!
    var labellText : String!
    var labelllText : String!
    
    
    
    @IBAction func ButtonHome(_ sender: Any) {
        if let controller = storyboard?.instantiateViewController(withIdentifier: "3") {
            present(controller, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        labell.text = labellText
        labelll.text = labelllText
    }
}

