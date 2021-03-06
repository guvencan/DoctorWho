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
    @IBOutlet weak var imageView: UIImageView!
    private let baseView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        baseView.backgroundColor = UIColor(hexString: "63B8A7")
        view.addSubview(baseView)
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTapped)))
        imageView.isUserInteractionEnabled = true
        
        viewModel.bindData = {
            DispatchQueue.main.async { self.collectionView.reloadData() }
        }
        

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        baseView.frame = UIApplication.shared.statusBarFrame
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)        
        navigationController?.setNavigationBarHidden(true, animated: animated)
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
        redirect(tag: item.name)
    }

    @IBAction func filterTap(_ sender: UIButton) {
        if let text = sender.titleLabel?.text {
            redirect(tag: text)
        }
        
    }
    
    @objc func imageTapped(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            redirect(tag: "??zel Sigorta")
        }
    }
    
    func redirect(tag: String){
        let vc = UIStoryboard(name: "SearchStoryboard", bundle: nil).instantiateViewController(identifier: "SearchViewController") as SearchViewController
        vc.query = tag
        self.navigationController?.pushViewController(vc, animated: true)
    }

    
}

