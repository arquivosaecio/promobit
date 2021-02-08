//
//  AddContatoMsgConfirmViewController.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//  Autor : Professor Aécio
//

import UIKit

class AddContatoMsgConfirmViewController: UtilAppDelegateViewController {
    
    @IBOutlet weak var voltarButtonOutlet: UIButton!
    
    @IBAction func voltarButtonAction(_ sender: UIButton) {
        let root = UIStoryboard(name: "ListaContatos", bundle: nil)
        let rootViewController = root.instantiateViewController(identifier: "ListaContatos")
        self.app.window?.rootViewController = rootViewController
        self.app.window?.makeKeyAndVisible()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
