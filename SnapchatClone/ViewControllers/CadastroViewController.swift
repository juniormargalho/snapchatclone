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
                                if usuario == nil {
                                    let alerta = Alerta(titulo: "Erro ao autenticar", mensagem: "Problema ao realizar autenticação, tente novamente.")
                                    self.present(alerta.getAlerta(), animated: true, completion: nil)
                                }else {
                                    
                                    //redireciona o usuario para a tela principal
                                    self.performSegue(withIdentifier: "cadastroLoginSegue", sender: nil)
                                }
                                
                            }else {
                                
                                let erroR = erro! as NSError
                                
                                if let codigoErro = erroR.userInfo["FIRAuthErrorUserInfoNameKey"] {
                                    let erroTexto = codigoErro as! String
                                    var mensagemErro = ""
                                    
                                    switch erroTexto {
                                        case "ERROR_INVALID_EMAIL" :
                                            mensagemErro = "E-mail inválido, digite um e-mail válido!"
                                            break
                                        case "ERROR_WEAK_PASSWORD" :
                                            mensagemErro = "Senha precisa ter no mínimo 6 caracteres, com letras e números!"
                                            break
                                        case "ERROR_EMAIL_ALREADY_IN_USE" :
                                            mensagemErro = "Este e-mail já está cadastrado!"
                                            break
                                        default :
                                            mensagemErro = "Dados digitados estão incorretos!"
                                    }
                                    let alerta = Alerta(titulo: "Dados inválidos", mensagem: mensagemErro)
                                    self.present(alerta.getAlerta(), animated: true, completion: nil)
                                }
                            }//fim validacao erro
                        }
                        
                    }else {
                        let alerta = Alerta(titulo: "Dados incorretos", mensagem: "As senhas não estão iguais, digite novamente!")
                        self.present(alerta.getAlerta(), animated: true, completion: nil)
                    }//fim validar senha
                    
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
