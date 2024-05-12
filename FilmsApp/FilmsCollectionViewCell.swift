//
//  FilmsCollectionViewCell.swift
//  FilmsApp
//
//  Created by Kaan Uzun on 9.05.2024.
//

import UIKit

protocol CellProtocol {
    func addToCartClicked(indexPath: IndexPath)
}

class FilmsCollectionViewCell: UICollectionViewCell {
  @IBOutlet weak var ivFilm: UIImageView!
  @IBOutlet weak var lblFilmPrice: UILabel!
  
    var cellProtocol:CellProtocol?
    var indexPath:IndexPath?
    
  @IBAction func btnAddToCart(_ sender: Any) {
      cellProtocol?.addToCartClicked(indexPath: indexPath!)
  }
}
