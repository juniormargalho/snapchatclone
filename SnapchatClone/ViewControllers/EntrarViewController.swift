//
//  EntrarViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 13/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import FirebaseAuth

class EntrarViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    
    @IBAction func entrar(_ sender: Any) {
        
        //recuperar dados digitados
        if let emailR = self.emailText.text {
            if let senhaR = self.senhaText.text {
                
                //autenticar usuario no firebase
                let autenticacao = Auth.auth()
                autenticacao.signIn(withEmail: emailR, password: senhaR) { (usuario, erro) in
                    
                    if erro == nil {
                        if usuario == nil {
                            let alerta = Alerta(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação, tente novamente!")
                            self.present(alerta.getAlerta(), animated: true, completion: nil)
                        }else {
                            
                            //redireciona o usuario para a tela principal
                            self.performSegue(withIdentifier: "loginSegue", sender: nil)
                        }
                    }else {
                        let alerta = Alerta(titulo: "Dados incorretos", mensagem: "Verifique os dados digitados e tente novamente!")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
