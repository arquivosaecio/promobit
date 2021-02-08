//
//  CentralListaContatosViewController.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class CentralListaContatosViewController: UtilAppDelegateViewController {
    
    @IBOutlet weak var menuSanduicheBarButtonItemOutlet: UIBarButtonItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonSetup()
        // Do any additional setup after loading the view.
    }
    

    func editButtonSetup(){
        if(revealViewController() != nil){
            menuSanduicheBarButtonItemOutlet.target = revealViewController()
            menuSanduicheBarButtonItemOutlet.action = #selector(SWRevealViewController.revealToggle(animated:))
            revealViewController()?.rearViewRevealWidth = 304
            view.addGestureRecognizer((self.revealViewController()?.panGestureRecognizer())!)
        }
    }

}
