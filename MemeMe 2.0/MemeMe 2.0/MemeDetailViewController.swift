//
//  MemeDetailViewController.swift
//  MemeMe 1.0
//
//  Created by Anmol on 17/03/21.
//

import UIKit

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var detailMemeImage: UIImageView!
    
    var allMemes: Meme!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.detailMemeImage!.image = allMemes.memeImage
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    

}
