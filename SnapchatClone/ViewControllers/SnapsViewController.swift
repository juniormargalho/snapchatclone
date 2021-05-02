//
//  SnapsViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 14/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SnapsViewController: UIViewController {
    var snaps: [Snap] = []
    
    @IBAction func sair(_ sender: Any) {
        
        let autenticacao = Auth.auth()
        do {
            try autenticacao.signOut()
            dismiss(animated: true, completion: nil)
        } catch {
            print("erro ao deslogar")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let autenticacao = Auth.auth()
        if let idUsusarioLogado = autenticacao.currentUser?.uid {
            
            let database = Database.database().reference()
            let usuarios = database.child("usuarios")
            let snaps = usuarios.child(idUsusarioLogado).child("snaps")
            
            //Cria ouvinte para snaps
            snaps.observe(DataEventType.childAdded) { (snapshot) in
                
                let dados = snapshot.value as? NSDictionary
                var snap = Snap()
                
                snap.identificador = snapshot.key
                snap.nome = dados?["nome"] as! String
                snap.descricao = dados?["descricao"] as! String
                snap.urlImagem = dados?["urlImagem"] as! String
                snap.idImagem = dados?["idImagem"] as! String
                
                self.snaps.append(snap)
                
                print(self.snaps)
                
            }
            
        }
        
    }
    
}
