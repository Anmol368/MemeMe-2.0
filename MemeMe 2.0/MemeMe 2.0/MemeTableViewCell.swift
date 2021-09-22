//
//  MemeTableViewCell.swift
//  MemeMe 1.0
//
//  Created by Anmol on 17/03/21.
//

import UIKit

class MemeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var cellsTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
       

    }

}
