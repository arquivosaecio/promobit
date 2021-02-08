//
//  CentralListaContatosViewController.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class CentralListaContatosViewController: UtilAppDelegateViewController , UITableViewDelegate , UITableViewDataSource{
    
    @IBOutlet weak var menuSanduicheBarButtonItemOutlet: UIBarButtonItem!
    @IBOutlet weak var sadImageOutlet: UIImageView!
    @IBOutlet weak var sadLabelOutlet: UILabel!
    @IBOutlet weak var contatoTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var addButtonOutlet: UIButton!
    
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let addContatoViewController = AddContatoViewController()
        app.window?.rootViewController = addContatoViewController
        app.window?.makeKeyAndVisible()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonSetup()
        
        contatoTableView.dataSource = self
        contatoTableView.delegate = self
        let cellXib = UINib(nibName: "ContatoTableViewCell", bundle: nil)
        contatoTableView.register(cellXib, forCellReuseIdentifier: "cell")
        contatoTableView.isEditing = true
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
    
    override func viewDidAppear(_ animated: Bool) {
        
        app.contatoResult = app.contatoDao.getListaContatos(rota: app.rotas.GET_CONTATOS)
        app.utilInternet = app.contatoResult.utilInternet
        app.contatos = app.contatoResult.contatos
        
        activityIndicator.stopAnimating()
        contatoTableView.reloadData()
        addButtonOutlet.isHidden = false
        
        if(app.utilInternet.possuiConexao == false){
            app.utilAlerta.mensagem(titulo: "Sem Internet!", mensagem: "Por favor conecte-se a internet e abra o app novamente1", view: self)
        }else{
            if(app.contatos.count == 0){ // mostrar mensagem de que não existem contatos
                sadImageOutlet.isHidden = false
                sadLabelOutlet.isHidden = false
                contatoTableView.isHidden = true
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contatoTableView.dequeueReusableCell(withIdentifier: "cell") as! ContatoTableViewCell
        cell.fotoPerfilImageView.image = app.contatos[indexPath.row].fotoUIImage
        cell.nomeLabel.text = app.contatos[indexPath.row].name
        cell.companyLabel.text = app.contatos[indexPath.row].company
        cell.novoLabel.layer.masksToBounds = true
        cell.novoLabel.layer.cornerRadius = 12
        if(app.contatos[indexPath.row].maisNovo == true){
            cell.novoLabel.isHidden = false
        }
        return cell
    }
    
    
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
//
//    override func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let movedObject = self.app.contatos[sourceIndexPath.row]
        app.contatos.remove(at: sourceIndexPath.row)
        app.contatos.insert(movedObject, at: destinationIndexPath.row)
    }
    


}
