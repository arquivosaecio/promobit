//
//  ExtensionUIColor.swift
//  Promobit
//
//  Created by Master Mac on 07/02/21.
//

import Foundation
import UIKit

// Adiciona funcionalidade ao atribuir cor via RGB sem prcisar dividir os valores por / 255
extension UIColor {
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
}
