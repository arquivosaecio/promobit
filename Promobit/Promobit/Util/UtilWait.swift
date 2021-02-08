//
//  UtilWait.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//

import UIKit

class UtilWait: NSObject {

    func wait(){
        
        // Aguardar retorno assincrono do servidor
        RunLoop.current.run(mode:.default, before: NSDate(timeIntervalSinceNow: 1) as Date)
        
    }
    
    
    
}
