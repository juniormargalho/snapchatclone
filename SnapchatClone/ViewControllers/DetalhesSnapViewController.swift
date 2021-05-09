//
//  DetalhesSnapViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 08/05/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import SDWebImage
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class DetalhesSnapViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var detalhes: UILabel!
    @IBOutlet weak var contador: UILabel!
    
    var snap = Snap()
    var tempo = 11
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalhes.text = snap.descricao
        let url = URL(string: snap.urlImagem)
        imagem.sd_setImage(with: url) { (imagem, erro, cache, url) in
            if erro == nil {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
                    self.tempo = self.tempo - 1
                    self.contador.text = String(self.tempo)
                    if self.tempo == 0 {
                        timer.invalidate()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        let autenticacao = Auth.auth()
        if let idUsuarioLogado = autenticacao.currentUser?.uid {
            //removendo nó do database
            let database = Database.database().reference()
            let usuarios = database.child("usuarios")
            let snaps = usuarios.child(idUsuarioLogado).child("snaps")
            snaps.child(snap.identificador).removeValue()
            //removendo imagem do storage
            let storage = Storage.storage().reference()
            let imagens = storage.child("imagens")
            imagens.child("\(snap.idImagem).jpg").delete { (erro) in
                if erro == nil {
                    print("sucesso")
                }else {
                    print("fracasso")
                }
            }
        }
    }

}
