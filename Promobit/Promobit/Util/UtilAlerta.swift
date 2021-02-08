//
//  UtilAlerta.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class UtilAlerta: NSObject {
    
    func mensagem(titulo : String , mensagem : String , view : UIViewController ){
        
        let alertController = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
            print("OK")
        }
        
        alertController.addAction(okAction)
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        view.present(alertController, animated: true, completion: nil)
        
    }
    
    func mensagemComDelay(titulo : String , mensagem : String , view : UIViewController , segundos : Double){
        
        let alert = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        alert.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = UIColor.white
        view.present(alert, animated: true, completion: nil)
        
        let when = DispatchTime.now() + segundos
        DispatchQueue.main.asyncAfter(deadline: when){
            alert.dismiss(animated: true, completion: nil)
        }
        
    }

}
