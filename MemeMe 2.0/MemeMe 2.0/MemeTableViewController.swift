//
//  MemeTableViewController.swift
//  MemeMe 1.0
//
//  Created by Anmol on 17/03/21.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var allMemes: [Meme]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let applicationDelegate = (UIApplication.shared.delegate as! AppDelegate)
        
        allMemes = applicationDelegate.memes
        
        //tableView reload
        
        tableView.reloadData()
        
    }
    
    
    @IBAction func editButtonPressed(_ sender: Any) {
        
    }
    

    @IBAction func createNewMeme(_ sender: Any) {
        
        if let nextController = storyboard!.instantiateViewController(withIdentifier: "MemeEditorViewController") as? MemeEditorViewController {
            present(nextController, animated: true, completion: nil)
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.allMemes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeTableViewCell", for: indexPath) as! MemeTableViewCell
        
        let meme = self.allMemes[(indexPath as NSIndexPath).row]
        
        cell.memeImageView?.image = meme.memeImage
        cell.textLabel?.text = "\(meme.topText)...\(meme.bottomText)"
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailController = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        detailController.allMemes = self.allMemes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
    }

}
