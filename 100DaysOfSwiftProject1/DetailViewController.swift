//
//  DetailViewController.swift
//  100DaysOfSwiftProject1
//
//  Created by HexaHack on 31.05.2020.
//  Copyright © 2020 HexaHack. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
       @IBOutlet weak var pictureView: UIImageView!
       var selectedImage: String?
       var imageName: String?
       override func viewDidLoad() {
           super.viewDidLoad()
    
           
           navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
           if let imageToLoad = selectedImage {
               pictureView.image = UIImage(named: imageToLoad)
           }
       }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    @objc func shareTapped() {
        guard let image = pictureView.image else {
            print("Image not found")
            return
        }
        
        let vc = UIActivityViewController(activityItems: [imageName!, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
}
