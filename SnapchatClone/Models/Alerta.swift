//
//  Alerta.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 25/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit

class Alerta {
    var titulo: String
    var mensagem: String
    
    init(titulo: String, mensagem: String) {
        self.titulo = titulo
        self.mensagem = mensagem
    }
    
    func getAlerta() -> UIAlertController {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        return alerta
    }
    
}
