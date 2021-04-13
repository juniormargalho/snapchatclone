//
//  CadastroViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 13/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import FirebaseAuth

class CadastroViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var senhaText: UITextField!
    @IBOutlet weak var confirmarSenhaText: UITextField!
    
    @IBAction func criarConta(_ sender: Any) {
        
        //recuperar dados digitados
        if let emailR = self.emailText.text {
            if let senhaR = self.senhaText.text {
                if let confirmarSenhaR = self.confirmarSenhaText.text {
                    
                    //validar senha
                    if senhaR == confirmarSenhaR {
                        
                        //criar conta firebase
                        let autenticacao = Auth.auth()
                        autenticacao.createUser(withEmail: emailR, password: senhaR) { (usuario, erro) in
                            
                            if erro == nil {
                                print("sucesso ao cadastrar usuario")
                            }else {
                                print("Erro ao cadastrar usuario")
                            }
                            
                        }
                        
                    }else {
                        self.exibirMensagem(titulo: "Dados incorretos", mensagem: "As senhas não estão iguais, digite novamente!")
                    }//fim validar senha
                    
                }
            }
        }
        
    }
    
    func exibirMensagem(titulo: String, mensagem: String) {
        let alerta = UIAlertController(title: titulo, message: mensagem, preferredStyle: .alert)
        let acaoCancelar = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alerta.addAction(acaoCancelar)
        present(alerta, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }

}
