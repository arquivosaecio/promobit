//
//  AddRemoveContatoViewControllerHandlers.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import Foundation
import UIKit
import JMMaskTextField

extension AddRemoveContatoViewController {
    
    func setupView(){
        excluirButtonOutlet.layer.borderColor = UIColor.rgb(red: 0, green: 186, blue: 255).cgColor // cor da borda do botão
        telefoneJMMaskTextField.delegate = self // Campo de texto muda conforme quantidade de caracteres
        nomeSobrenomeTextField.text! =  app.contatos[app.contatoIndex].name
        empresaTextField.text! = app.contatos[app.contatoIndex].company
        emailTextField.text! = app.contatos[app.contatoIndex].email
        telefoneJMMaskTextField.text! = app.contatos[app.contatoIndex].phone
        siteTextField.text! = app.contatos[app.contatoIndex].website
        adicionarNotaTextField.text! = app.contatos[app.contatoIndex].custom_note
    }
    
    func backCancelarHandlers(){
        let root = UIStoryboard(name: "ListaContatos", bundle: nil)
        let rootViewController = root.instantiateViewController(identifier: "ListaContatos")
        self.app.window?.rootViewController = rootViewController
        self.app.window?.makeKeyAndVisible()
    }
    
}
