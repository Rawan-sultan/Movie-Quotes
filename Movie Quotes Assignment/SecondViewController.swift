//
//  SecondViewController.swift
//  Movie Quotes Assignment
//
//  Created by 라완 💕 on 10/05/1444 AH.
//

import UIKit

class SecondViewController: UIViewController, UIGestureRecognizerDelegate {
   
    @IBOutlet weak var backMovies: UIButton!
    @IBOutlet weak var answer: UIButton!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var quastion: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var back: UIButton!
    
    var Index = -1
    var allMovies: [Movie] = []
    var correctMovies: [Movie] = []
    var image = Data()
    var movieScore = 0
    
    override func viewDidLoad() {
     
        super.viewDidLoad()
        Index = Int.random(in: 0..<allMovies.count)
        nameField.delegate = self
        score.text = "Score :\(movieScore)"
        theQuestion()
        
    }
    
    @IBAction func showAnswer(_ sender: Any) {
        performSegue(withIdentifier: "showAnswer", sender: self)
    }
    
    @IBAction func `return`(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Cancel the current game?", message: "Your score will not be saved", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        let repickAction = UIAlertAction(title: "Re-Pick Movies", style: .destructive, handler:{ [self] action in
        self.navigationController?.popToRootViewController(animated: true)
        })
        alertController.addAction(repickAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true)
    }
    
    @IBAction func backHome(_ sender: UIButton) {
        theQuestion()
}

func theQuestion(){
    Index = Int.random(in: 0..<allMovies.count)
    quastion.text = allMovies[Index].quote
    nameField.placeholder = allMovies[Index].name
    
    
  }
    
    }

extension SecondViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if self.nameField.text == self.allMovies[Index].name {
                //true
            let photo = allMovies[Index].image.jpegData(compressionQuality: 1.0)
            image = photo!
            movieScore += 1
            score.text = "Score :\(movieScore)"
            theQuestion()
            performSegue(withIdentifier: "pushImage", sender: self)
            
        }
        else{
            print("Wrong Answer")
            theQuestion()
            
        }
        
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as? ImageViewController
        vc?.image = image
        let vct = segue.destination as? TheAnswerViewController
        vct?.label = allMovies[Index].name
    }
    
    
}
