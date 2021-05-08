//
//  DetalhesSnapViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 08/05/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit

class DetalhesSnapViewController: UIViewController {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var detalhes: UILabel!
    @IBOutlet weak var contador: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
