//
//  MemeCollectionViewController.swift
//  MemeMe 1.0
//
//  Created by Anmol on 17/03/21.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    //MM 2.0 - AppDelegate property
    
    var allMemes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let space:CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        let dimension1 = (view.frame.size.height - (2 * space)) / 3.0

        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimension, height: dimension1)
        
    }
        
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        let applicationDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        allMemes = applicationDelegate.memes
        
        //collectionView reload
        
        collectionView!.reloadData()
    }
    

    @IBAction func createNewMeme(_ sender: Any) {
        
        if let nextController = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as? MemeEditorViewController {
            present(nextController, animated: true, completion: nil)
        }
        
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.allMemes.count
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCollectionViewCell", for: indexPath) as! MemeCollectionViewCell
        let meme = self.allMemes[(indexPath as NSIndexPath).row]

        
        cell.memeImageView?.image = meme.memeImage

        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {

        // Grab the DetailVC from Storyboard
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController

        //Populate view controller with data from the selected item
        detailController.allMemes = allMemes[(indexPath as NSIndexPath).row]

        // Present the view controller using navigation
        navigationController!.pushViewController(detailController, animated: true)

    }
    

}
