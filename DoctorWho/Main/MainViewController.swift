//
//  ViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit


class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var categories: [category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categories = getCategoryData()?.category ?? []

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
    }


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        let item = categories[indexPath.row]
        cell.button.setImage(UIImage(named: item.image), for: .normal)
        cell.label.text = item.name
        return cell;
    }


}




    func getCategoryData() -> categoryData?{
        if let jsonData = readLocalFile(forName: "category") {
            do {
                let data = try JSONDecoder().decode(categoryData.self, from: jsonData)
                print("Name: ", data.category[0].name)
                print("===================================")
                return data
            } catch {
                print("decode error")
            }
        }
        return nil
    }
