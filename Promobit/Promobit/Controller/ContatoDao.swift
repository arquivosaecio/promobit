//
//  ContatoDao.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//

import UIKit

class ContatoDao: NSObject {
    
    let utilWait = UtilWait()
    
    func getListaContatos(rota : String) -> ContatoResult{
        
        let utilWebImageReader = UtilWebImageReader()
        var locked : Bool = true
        let myUrl = NSURL(string: rota)
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "GET"
        let contatoResult = ContatoResult()
        contatoResult.utilInternet.possuiConexao = true
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("\(String(describing: error))")
                contatoResult.descricaoException = "\(String(describing: error))"
                contatoResult.utilInternet.possuiConexao = false
                locked = false
                return
            }
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
            print(responseString)
            contatoResult.descricaoException = "\(responseString)"
            
            do {
                let jsonResult =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSArray
                if(jsonResult != nil){
                    let contatos = jsonResult! as NSArray
                    for contato in contatos {
                        contatoResult.contato = Contato()
                        print(contato)
                        let contatoNSDictionary = contato as! NSDictionary
                        if((contatoNSDictionary["id"] as? String) != nil){
                            contatoResult.contato.id = contatoNSDictionary["id"] as! String
                        }
                        if((contatoNSDictionary["createdAt"] as? String) != nil){
                            contatoResult.contato.createdAt = contatoNSDictionary["createdAt"] as! String
                        }
                        if((contatoNSDictionary["name"] as? String) != nil){
                            contatoResult.contato.name = contatoNSDictionary["name"] as! String
                        }
                        if((contatoNSDictionary["avatar"] as? String) != nil){
                            contatoResult.contato.avatar = contatoNSDictionary["avatar"] as! String
                            contatoResult.contato.fotoUIImage = utilWebImageReader.getImageFromUrl(url: contatoResult.contato.avatar, defaultImage: "fotos.png")
                        }
                        if((contatoNSDictionary["company"] as? String) != nil){
                            contatoResult.contato.company = contatoNSDictionary["company"] as! String
                        }
                        if((contatoNSDictionary["email"] as? String) != nil){
                            contatoResult.contato.email = contatoNSDictionary["email"] as! String
                        }
                        if((contatoNSDictionary["phone"] as? String) != nil){
                            contatoResult.contato.phone = contatoNSDictionary["phone"] as! String
                        }
                        if((contatoNSDictionary["website"] as? String) != nil){
                            contatoResult.contato.website = contatoNSDictionary["website"] as! String
                        }
                        if((contatoNSDictionary["custom_note"] as? String) != nil){
                            contatoResult.contato.custom_note = contatoNSDictionary["custom_note"] as! String
                        }
                        contatoResult.contatos.append(contatoResult.contato)
                    }
                    contatoResult.contatos[contatoResult.contatos.count - 1].maisNovo = true
                    contatoResult.utilInternet.possuiConexao = true
                    contatoResult.executouComSucesso = true
                    locked = false
                }
                
            }
            catch {
                
                contatoResult.utilInternet.possuiConexao = false
                contatoResult.executouComSucesso = false
                print(error)
                locked = false
                return
            }
        }
        task.resume()
        while (locked) {
            
            self.utilWait.wait()
            
        }
        
        return contatoResult
    }
    
    func insertContato(rota : String , contato : Contato) -> ContatoResult{
        
        var locked : Bool = true
        let myUrl = NSURL(string: rota)
        let request = NSMutableURLRequest(url: myUrl! as URL)
        request.httpMethod = "POST"
        let parameters = "name=\(contato.name)&company=\(contato.company)&email=\(contato.email)&phone=\(contato.phone)&website=\(contato.website)&custom_note=\(contato.custom_note)"
        request.httpBody = parameters.data(using: String.Encoding.utf8)
        let contatoResult = ContatoResult()
        contatoResult.utilInternet.possuiConexao = true
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("\(String(describing: error))")
                contatoResult.descricaoException = "\(String(describing: error))"
                contatoResult.utilInternet.possuiConexao = false
                locked = false
                return
            }
            
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)!
            print(responseString)
            contatoResult.descricaoException = "\(responseString)"
            
            do {
                let jsonResult =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                if(jsonResult != nil){
                    let contatoNSDictionary = jsonResult!
                    if((contatoNSDictionary["id"] as? String) != nil){
                        contatoResult.contato.id = contatoNSDictionary["id"] as! String
                    }
                    if((contatoNSDictionary["createdAt"] as? String) != nil){
                        contatoResult.contato.createdAt = contatoNSDictionary["createdAt"] as! String
                    }
                    if((contatoNSDictionary["name"] as? String) != nil){
                        contatoResult.contato.name = contatoNSDictionary["name"] as! String
                    }
                    if((contatoNSDictionary["avatar"] as? String) != nil){
                        contatoResult.contato.avatar = contatoNSDictionary["avatar"] as! String
                    }
                    if((contatoNSDictionary["company"] as? String) != nil){
                        contatoResult.contato.company = contatoNSDictionary["company"] as! String
                    }
                    if((contatoNSDictionary["email"] as? String) != nil){
                        contatoResult.contato.email = contatoNSDictionary["email"] as! String
                    }
                    if((contatoNSDictionary["phone"] as? String) != nil){
                        contatoResult.contato.phone = contatoNSDictionary["phone"] as! String
                    }
                    if((contatoNSDictionary["website"] as? String) != nil){
                        contatoResult.contato.website = contatoNSDictionary["website"] as! String
                    }
                    if((contatoNSDictionary["custom_note"] as? String) != nil){
                        contatoResult.contato.custom_note = contatoNSDictionary["custom_note"] as! String
                    }
                }
                contatoResult.utilInternet.possuiConexao = true
                contatoResult.executouComSucesso = true
                locked = false
                
                
            }
            catch {
                
                contatoResult.utilInternet.possuiConexao = false
                contatoResult.executouComSucesso = false
                print(error)
                locked = false
                return
            }
        }
        task.resume()
        while (locked) {
            
            self.utilWait.wait()
            
        }
        
        return contatoResult
    }
    
}
