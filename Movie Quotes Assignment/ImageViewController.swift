//
//  ImageViewController.swift
//  Movie Quotes Assignment
//
//  Created by 라완 💕 on 11/05/1444 AH.
//

import UIKit

class ImageViewController: UIViewController {

    @IBOutlet weak var imageAnswer: UIImageView!
    var image = Data()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imageAnswer.image = UIImage(data: self.image)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0){
            self.dismiss(animated: true)
            
        }

    }
    
}
