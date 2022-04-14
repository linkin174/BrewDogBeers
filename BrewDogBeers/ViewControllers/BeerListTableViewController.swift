//
//  BeerListTableViewController.swift
//  BrewDogBeers
//
//  Created by Aleksandr Kretov on 13.04.2022.
//

import UIKit

class BeerListTableViewController: UITableViewController {
    
    //MARK: - Public properties
    
    var beers: [Beer] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    //MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.separatorStyle = .none
        NetworkManager.shared.alamofireRequest(from: NetworkManager.shared.apiURL) { response in
            switch response {
            case .success(let data):
                self.beers = data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beer", for: indexPath) as! CustomTableViewCell
        let beer = beers[indexPath.row]
        cell.setupCell(with: beer)
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    
    //MARK: - Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        performSegue(withIdentifier: "showDeteailedInfo", sender: beer)
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let aboutVC = segue.destination as? AboutViewController else { return }
        aboutVC.beer = sender as? Beer
    }
}
