//
//  AddContatoViewControllerHandlers.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//

import Foundation
import UIKit
import JMMaskTextField

extension AddContatoViewController {
    
    func setupView(){
        cancelarButtonOutlet.layer.borderColor = UIColor.rgb(red: 0, green: 186, blue: 255).cgColor // cor da borda do botão
        telefoneJMMaskTextField.delegate = self // Campo de texto muda conforme quantidade de caracteres
    }
    
}
