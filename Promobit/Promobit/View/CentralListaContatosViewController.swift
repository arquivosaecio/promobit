//
//  CentralListaContatosViewController.swift
//  Promobit
//
//  Created by Master Mac on 08/02/21.
//

import UIKit

class CentralListaContatosViewController: UtilAppDelegateViewController , UITableViewDelegate , UITableViewDataSource{
    
    var sortType = 0
    var timer : AnyObject?
    
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
    
    @IBAction func filtroButtonAction(_ sender: Any) {
        print("Filtrando...")
        sortType += 1
        if(sortType == 1){
            app.utilAlerta.mensagemComDelay(titulo: "Ordenar por:", mensagem: "Nome", view: self, segundos: 1.0)
            app.contatos.sort { $0.name > $1.name }
        }else{
            if(sortType == 2){
                app.utilAlerta.mensagemComDelay(titulo: "Ordenar por:", mensagem: "Empresa", view: self, segundos: 1.0)
                app.contatos.sort { $0.company > $1.company }
            }else{
                app.utilAlerta.mensagemComDelay(titulo: "Ordenar por:", mensagem: "ID", view: self, segundos: 1.0)
                app.contatos.sort { $0.id > $1.id }
            }
        }
        if(sortType >= 3){
            sortType = 0
        }
            
        contatoTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editButtonSetup()
        
        contatoTableView.dataSource = self
        contatoTableView.delegate = self
        let cellXib = UINib(nibName: "ContatoTableViewCell", bundle: nil)
        contatoTableView.register(cellXib, forCellReuseIdentifier: "cell")
        // Caso queira mover as linhas descomentar este bloco
        contatoTableView.isEditing = true
        // Caso queira mover as linhas descomentar este bloco
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(verificarSeEparaEditarCadastro), userInfo: nil, repeats: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return app.contatos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contatoTableView.dequeueReusableCell(withIdentifier: "cell") as! ContatoTableViewCell
        cell.fotoPerfilImageView.image = app.contatos[indexPath.row].fotoUIImage
        cell.nomeLabel.setTitle(app.contatos[indexPath.row].name, for: .normal)
        cell.companyLabel.text = app.contatos[indexPath.row].company
        cell.novoLabel.layer.masksToBounds = true
        cell.novoLabel.layer.cornerRadius = 12
        cell.indexCelulaSelecionada = indexPath.row
        cell.nomeLabel.addTarget(self, action: #selector(self.editarContato), for: .touchUpInside)
        if(app.contatos[indexPath.row].maisNovo == true){
            cell.novoLabel.isHidden = false
        }
        return cell
    }

    // Caso queira mover as linhas descomentar este bloco
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
    // Caso queira mover as linhas descomentar este bloco
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        app.contatoIndex = indexPath.row
        let addRemoveContatoViewController = AddRemoveContatoViewController()
        app.window?.rootViewController = addRemoveContatoViewController
        app.window?.makeKeyAndVisible()
    }
    
    @objc func editarContato(){
        timer?.invalidate()
        print("Clicou na main...")
        let addRemoveContatoViewController = AddRemoveContatoViewController()
        app.window?.rootViewController = addRemoveContatoViewController
        app.window?.makeKeyAndVisible()
    }
    
    @objc func verificarSeEparaEditarCadastro(){
        if(app.contatoIndex != -1){
            self.editarContato()
        }
    }

}
