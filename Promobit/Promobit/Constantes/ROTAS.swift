//
//  ROTAS.swift
//  Promobit
//
//  Created by Master Mac on 06/02/21.
//  Autor : Professor Aécio
//

import UIKit

// Singleton de todas as rotas consumidas pelo app

class ROTAS: NSObject {
    
    let HOST = "https://5ff85fad10778b0017043359.mockapi.io"
    var GET_CONTATOS = ""
    
    override init() {
        super.init()
        self.getRotas()
    }
    
    func getRotas(){
        GET_CONTATOS = HOST + "/api/contatos"
    }

}
