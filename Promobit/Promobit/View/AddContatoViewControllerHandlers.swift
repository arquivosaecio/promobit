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
    
    func backCancelarHandlers(){
        let root = UIStoryboard(name: "ListaContatos", bundle: nil)
        let rootViewController = root.instantiateViewController(identifier: "ListaContatos")
        self.app.window?.rootViewController = rootViewController
        self.app.window?.makeKeyAndVisible()
    }
    
    func salvarHandlers(){
        app.contato.name = nomeSobrenomeTextField.text!
        app.contato.company = empresaTextField.text!
        app.contato.email = emailTextField.text!
        app.contato.phone = telefoneJMMaskTextField.text!
        app.contato.website = siteTextField.text!
        app.contato.custom_note = adicionarNotaTextField.text!
        app.contatoResult = app.contatoDao.insertContato(rota: app.rotas.INSERT_CONTATO, contato: app.contato)
        if(app.contatoResult.executouComSucesso){
            let alerta = UIAlertController(title: "Sucesso!", message: "Contatos salvo!", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
                UIAlertAction in
                NSLog("OK")
                self.backCancelarHandlers()
            }
            alerta.addAction(okAction)
            alerta.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
            self.present(alerta, animated: true, completion: nil)
        }else{
            app.utilAlerta.mensagem(titulo: "Erro!", mensagem: "Falha ao salvar o contato, por favor tente novamente mais tarde...", view: self)
        }
    }
    
}
