//
//  ContatoTableViewCell.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class ContatoTableViewCell: UITableViewCell {
    
    // celulas individuais
    var indexCelulaSelecionada = 0
    // Apontamento Singleton para classe AppDelegate.swift onde os objetos ficarão
    let app = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var fotoPerfilImageView: UIImageView!
    @IBOutlet weak var novoLabel: UILabel!
    @IBOutlet weak var nomeLabel: UIButton!
    
    @IBOutlet weak var companyLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        nomeLabel.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(nomeLabelClicked(_:)))
        nomeLabel.addGestureRecognizer(guestureRecognizer)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func nomeLabelClicked(_ sender: Any) {
        print("Clicou no nome...")
        app.contatoIndex = indexCelulaSelecionada
    }
    
}
