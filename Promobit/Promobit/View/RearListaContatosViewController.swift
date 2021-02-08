//
//  RearListaContatosViewController.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class RearListaContatosViewController: UtilAppDelegateViewController {
    
    @IBOutlet weak var meusContatosLabel: UILabel!
    @IBOutlet weak var meusCartoesLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        meusContatosLabel.isUserInteractionEnabled = true
        let guestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(meusContatosLabelLabelClicked(_:)))
        meusContatosLabel.addGestureRecognizer(guestureRecognizer)
        
        meusCartoesLabel.isUserInteractionEnabled = true
        let guestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(meusCartoesLabelClicked(_:)))
        meusCartoesLabel.addGestureRecognizer(guestureRecognizer2)
        
    }
    
    @objc func meusContatosLabelLabelClicked(_ sender: Any) {
        let root = UIStoryboard(name: "ListaContatos", bundle: nil)
        let rootViewController = root.instantiateViewController(identifier: "ListaContatos")
        self.app.window?.rootViewController = rootViewController
        self.app.window?.makeKeyAndVisible()
    }
    
    @objc func meusCartoesLabelClicked(_ sender: Any){
        app.utilAlerta.mensagem(titulo: "Provavelmente", mensagem: "Será implementado na próxima atualização.", view: self)
    }
    
}
