//
//  SnapsViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 14/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import FirebaseAuth

class SnapsViewController: UIViewController {
    let autenticacao = Auth.auth()
    
    @IBAction func sair(_ sender: Any) {
        do {
            try self.autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("erro ao deslogar")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
