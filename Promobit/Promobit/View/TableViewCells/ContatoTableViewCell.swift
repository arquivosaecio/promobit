//
//  ContatoTableViewCell.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class ContatoTableViewCell: UITableViewCell {
    
    @IBOutlet weak var fotoPerfilImageView: UIImageView!
    @IBOutlet weak var novoLabel: UILabel!
    @IBOutlet weak var nomeLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
