//
//  SearchViewController.swift
//  DoctorWho
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 13.10.2021.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Search"
        viewModel.bindData = {
            DispatchQueue.main.async { self.tableView.reloadData() }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filtered.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath)
        let doctor = viewModel.filtered[indexPath.row]
        cell.textLabel?.text = doctor.title
        cell.detailTextLabel?.text = doctor.subtitle
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")

        
        let vc = UIStoryboard(name: "ProfileStoryboard", bundle: nil).instantiateViewController(identifier: "ProfileViewController") as ProfileViewController
        vc.doctorId = viewModel.filtered[indexPath.row].id
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.filterData(searchText: searchText)
    }
    
    
}
