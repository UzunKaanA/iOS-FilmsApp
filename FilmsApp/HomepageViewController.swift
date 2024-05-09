//
//  ViewController.swift
//  FilmsApp
//
//  Created by Kaan Uzun on 9.05.2024.
//

/*
sectionInSet -> Collection View Area Space
minimumInteritemSpacing -> between item's space
minimumLineSpacing -> item's Horizantal space
First find item's width.
 */

import UIKit

class HomepageViewController: UIViewController {

  @IBOutlet weak var filmsCollectionView: UICollectionView!

  var filmsLists = [Films]()

  override func viewDidLoad() {
    super.viewDidLoad()

    let f1 = Films(id: 1, name: "Django", image: "django", price: 24)
    let f2 = Films(id: 2, name: "Interstellar", image: "interstellar", price: 32)
    let f3 = Films(id: 3, name: "Inception", image: "inception", price: 16)
    let f4 = Films(id: 4, name: "The Hateful Eight", image: "thehatefuleight", price: 28)
    let f5 = Films(id: 5, name: "The Pianist", image: "thepianist", price: 18)
    let f6 = Films(id: 6, name: "Anadoluda", image: "anadoluda", price: 10)
    filmsLists.append(f1)
    filmsLists.append(f2)
    filmsLists.append(f3)
    filmsLists.append(f4)
    filmsLists.append(f5)
    filmsLists.append(f6)

    filmsCollectionView.dataSource = self
    filmsCollectionView.delegate = self


    //CollectionView Design Part...
    let design = UICollectionViewFlowLayout()

    design.sectionInset = UIEdgeInsets(
      top: 10,
      left: 10,
      bottom: 10,
      right: 10
    )
    design.minimumInteritemSpacing = 10
    design.minimumLineSpacing = 15

    //10 * 10 * 10 : 30 area
    let screenWidth = UIScreen.main.bounds.width
    let itemWidth = (screenWidth - 30) / 2

    design.itemSize = CGSize(
      width: itemWidth,
      height: itemWidth * 1.7
    )

    filmsCollectionView.collectionViewLayout = design

  }

}

extension HomepageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return filmsLists.count //Run *this* many times
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "filmsCell", for: indexPath) as! FilmsCollectionViewCell

    let film = filmsLists[indexPath.row]

    cell.ivFilm.image = UIImage(named: film.image!)
    cell.lblFilmPrice.text = "\(film.price!)₺"

    cell.layer.borderColor = UIColor.lightGray.cgColor
    cell.layer.borderWidth = 0.3
    cell.layer.cornerRadius = 10.0

    return cell
  }
}
