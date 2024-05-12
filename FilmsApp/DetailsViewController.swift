//
//  DetailsViewController.swift
//  FilmsApp
//
//  Created by Kaan Uzun on 12.05.2024.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var lblFilm: UILabel!
    @IBOutlet weak var ivFilm: UIImageView!
    @IBOutlet weak var lblPrice: UILabel!
    
    var film: Films?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let f = film {
            lblFilm.text = f.name
            lblPrice.text = "\(f.price!) ₺"
            ivFilm.image = UIImage(named: f.image!)
        }

    }

        
}
