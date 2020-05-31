//
//  TableViewController.swift
//  100DaysOfSwiftProject1
//
//  Created by HexaHack on 31.05.2020.
//  Copyright © 2020 HexaHack. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
  var picturesArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Storm Viewer"        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                picturesArray.append(item)
                print(item)
            }
        }

    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return picturesArray.count
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = picturesArray[indexPath.row]
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedImage = picturesArray[indexPath.row]
            vc.title = "Picture \(indexPath.row + 1) of \(picturesArray.count)"
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
