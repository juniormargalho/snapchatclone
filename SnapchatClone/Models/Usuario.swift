//
//  Usuario.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 27/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit

class Usuario {
    var email: String
    var nome: String
    var uid: String
    
    init(email: String, nome: String, uid: String) {
        self.email = email
        self.nome = nome
        self.uid = uid
    }
    
}
