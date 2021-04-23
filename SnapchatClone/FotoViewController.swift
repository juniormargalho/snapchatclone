//
//  FotoViewController.swift
//  SnapchatClone
//
//  Created by Nelson Antonio Barbosa Margalho Junior on 14/04/21.
//  Copyright © 2021 JuniorMargalho. All rights reserved.
//

import UIKit
import FirebaseStorage

class FotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UITextField!
    @IBOutlet weak var botaoProximo: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    @IBAction func proximoPasso(_ sender: Any) {
        self.botaoProximo.isEnabled = false
        self.botaoProximo.setTitle("Carregando...", for: .normal)
        
        let armazenamento = Storage.storage().reference()
        let imagens = armazenamento.child("imagens")
        
        //recupera a imagem
        if let imagemSelecionada = imagem.image {
            if let imagemDados = imagemSelecionada.jpegData(compressionQuality: 0.5){
                imagens.child("imagem.jpg").putData(imagemDados, metadata: nil) { (metaDados, erro) in
                    
                    if erro == nil {
                        print("sucesso")
                        self.botaoProximo.isEnabled = true
                        self.botaoProximo.setTitle("Próximo", for: .normal)
                    }else {
                        print("falha")
                    }
                    
                }
            }
        }
    }
    
    @IBAction func selecionarFoto(_ sender: Any) {
        imagePicker.sourceType = .savedPhotosAlbum
        present(imagePicker, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagemRecuperada = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagem.image = imagemRecuperada
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
    }
    
}
