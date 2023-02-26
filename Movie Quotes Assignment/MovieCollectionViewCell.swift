//
//  MovieCollectionViewCell.swift
//  Movie Quotes Assignment
//
//  Created by 라완 💕 on 10/05/1444 AH.
//

import UIKit

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    
    var quote: String!
    
    func setup(movie: Movie){
        movieImage.image = movie.image
        movieName.text = movie.name
        quote = movie.quote
    }
    
}
