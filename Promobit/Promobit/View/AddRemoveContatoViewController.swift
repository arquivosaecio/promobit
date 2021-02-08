//
//  AddContatoViewController.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//  Autor : Professor Aécio
//

import UIKit
import JMMaskTextField // Responsável por colocar mascaras nos campos de texto

class AddRemoveContatoViewController: UtilAppDelegateViewController , UITextFieldDelegate{
    
    // atualizar ou excluir lista localmente
    
    @IBOutlet weak var nomeSobrenomeTextField: UITextField!
    @IBOutlet weak var empresaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneJMMaskTextField: JMMaskTextField!
    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var adicionarNotaTextField: UITextField!
    @IBOutlet weak var cancelarButtonOutlet: UIButton!
    @IBOutlet weak var salvarButtonOutlet: UIButton!
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.backCancelarHandlers()
    }
    
    @IBAction func excluirHandlers(_ sender: UIButton) {
        
        app.contatos.remove(at: app.contatoIndex)
    }
    
    @IBAction func atualizarHandlers(_ sender: UIButton) {
        app.contatos[app.contatoIndex].name = nomeSobrenomeTextField.text!
        app.contatos[app.contatoIndex].company = empresaTextField.text!
        app.contatos[app.contatoIndex].email = emailTextField.text!
        app.contatos[app.contatoIndex].phone = telefoneJMMaskTextField.text!
        app.contatos[app.contatoIndex].website = siteTextField.text!
        app.contatos[app.contatoIndex].custom_note = adicionarNotaTextField.text!
    }
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }


    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let tf = textField as! JMMaskTextField
        if(tf == telefoneJMMaskTextField){
            if(tf.unmaskedText.count >= 10){
                // Atribuir máscara Fixo
                tf.maskString = "(00) 00000-0000"
            }else{
                // Atribuir máscara Celular
                tf.maskString = "(00) 0000-0000"
            }
        }
        
        return true
    }

}
