//
//  DetalhesSnapViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 08/05/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import SDWebImage

class DetalhesSnapViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var detalhes: UILabel!
    @IBOutlet weak var contador: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detalhes.text = snap.descricao
        let url = URL(string: snap.urlImagem)
        imagem.sd_setImage(with: url) { (imagem, erro, cache, url) in
            
        }

    }

}
