//
//  CustomTableViewCell.swift
//  TableView_App
//
//  Created by Esteban Jiménez on 2023-08-21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lDateN: UILabel!
    @IBOutlet weak var lNombre: UILabel!
    @IBOutlet weak var lMonto: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
