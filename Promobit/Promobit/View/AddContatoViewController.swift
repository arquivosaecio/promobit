//
//  AddContatoViewController.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//

import UIKit
import JMMaskTextField // Responsável por colocar mascaras nos campos de texto

class AddContatoViewController: UtilAppDelegateViewController , UITextFieldDelegate{
    
    @IBOutlet weak var nomeSobrenomeTextField: UITextField!
    @IBOutlet weak var empresaTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneJMMaskTextField: JMMaskTextField!
    @IBOutlet weak var siteTextField: UITextField!
    @IBOutlet weak var adicionarNotaTextField: UITextField!
    @IBOutlet weak var cancelarButtonOutlet: UIButton!
    @IBOutlet weak var salvarButtonOutlet: UIButton!
    
    @IBAction func backButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func cancelarButtonAction(_ sender: UIButton) {
    }
    
    @IBAction func salvarButtonAction(_ sender: UIButton) {
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
