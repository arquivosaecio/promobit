//
//  UtilAppDelegateViewController.swift
//  Promobit
//
//  Created by Master Mac on 06/02/21.
//  Autor : Professor Aécio
//

import UIKit

class UtilAppDelegateViewController: UIViewController {
    
    // Apontamento Singleton para classe AppDelegate.swift onde os objetos ficarão
    let app = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // Interrupção: ao tocar na tela ocultar o teclado
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
