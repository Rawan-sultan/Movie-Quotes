//
//  TheAnswerViewController.swift
//  Movie Quotes Assignment
//
//  Created by 라완 💕 on 12/05/1444 AH.
//

import UIKit

class TheAnswerViewController: UIViewController {

    @IBOutlet weak var answerLabel: UILabel!
    var label: String? = String()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.answerLabel.text = self.label

        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.dismiss(animated: true)

        }
    }

}
