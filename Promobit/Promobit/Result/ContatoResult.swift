//
//  ContatoResult.swift
//  Promobit
//
//  Created by Master Mac on 06/02/21.
//  Autor : Professor Aécio
//

import UIKit

class ContatoResult: NSObject {
    
    // Resultado que vem do controller retornando o objeto(s), ou o motivo da falha da operação
    var contato = Contato()
    var contatos = [Contato]()
    var descricaoException : String = ""
    var executouComSucesso = false
    var utilInternet = UtilInternet()

}
