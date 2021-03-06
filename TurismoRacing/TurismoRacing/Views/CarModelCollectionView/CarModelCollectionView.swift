//
//  CarModelCollectionView.swift
//  TurismoRacing
//
//  Created by S2 on 27.07.22.
//

import UIKit

class CarModelCollectionView: UICollectionView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    var carModels: [String] = ["ic_defaultCar", "ic_carAudi", "ic_carBMW", "ic_carFerrari", "ic_carHonda", "ic_carPorsche", "ic_carBuggati", "ic_carDodge"]
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        backgroundColor = .gray.withAlphaComponent(0.5)
        dataSource = self
        delegate = self
        translatesAutoresizingMaskIntoConstraints = false
        showsHorizontalScrollIndicator = false
        flowLayout.minimumLineSpacing = 25
        contentInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        register(CarModelCollectionViewCell.self, forCellWithReuseIdentifier: CarModelCollectionViewCell.reuseID)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return carModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: CarModelCollectionViewCell.reuseID, for: indexPath) as? CarModelCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.carModel.image = UIImage(named: "\(carModels[indexPath.row])")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if let cell = cell {
            let index = indexPath.row
            UserDefaults.standard.set(carModels[index], forKey: "CarModel")
            cell.backgroundColor = .white.withAlphaComponent(0.2)
            cell.layer.cornerRadius = 20
            cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath)
        if let cell = cell {
            cell.backgroundColor = .clear
            cell.transform = .identity
        }
    }
}
