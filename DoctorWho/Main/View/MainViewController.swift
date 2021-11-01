//
//  ViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit


class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var viewModel = MainViewModel()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.bindData = {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    


    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categories.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "myCell", for: indexPath) as! MyCollectionViewCell
        let item = viewModel.categories[indexPath.row]
        cell.button.setImage(UIImage(named: item.image), for: .normal)
        cell.label.text = item.name
        return cell;
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item + 1)
        let item = viewModel.categories[indexPath.row]
        let vc = UIStoryboard(name: "SearchStoryboard", bundle: nil).instantiateViewController(identifier: "SearchViewController") as SearchViewController
        vc.query = item.name
        self.navigationController?.pushViewController(vc, animated: true)
    }

    

    

}

