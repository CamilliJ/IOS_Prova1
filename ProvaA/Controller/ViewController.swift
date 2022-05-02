//
//  ViewController.swift
//  ProvaA
//
//

import UIKit

class ViewController: UIViewController {

    // Adicione a referência para os campos necessários para a validação aqui
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Adicione o método de ação que será utilizada para validar os campos informados aqui
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var senha: UITextField!

    var email_certo: String = "camilli@cotemig.com.br"
    var senha_certa: String = "@Senha123"
    
    
    @IBAction func entrar(_ sender: Any) {
        
        let email_cliente = email.text
        let senha_cliente = senha.text
        if email_cliente == email_certo && senha_cliente == senha_certa {
            showSuccessDialog()
        }else{
            showErrorDialog()
        }
    }
    
    // Se os dados estiverem incorretos chame esse método
    func showErrorDialog() {
        presentAlert(title: "Error", message: "Email ou Senha inválidos!")
    }
    
    // Se os dados de acesso estão corretos, chame esse método.
    func showSuccessDialog() {
        // Lembre se de colocar o indentifier na segue que criou no Storyboard. coloque o nome dela abaixo:
        performSegue(withIdentifier: "Passar", sender: nil)
        
/*
        Atenção: Para criar sua segue e utilizar com o método acima, ela não pode ser adicionada a um botão,
        adicione diretamente na tela de origem.
 
         Adicione a segue para abrir em fullscreen para isso siga os passos:
         * Mude o kind para Present Modally
         * Mude o Presentation para Full Screen
*/
    }
}

// Essa é uma extension, isso funciona adicionando uma nova funcionalidade pra classe original
extension UIViewController {
    
    // o método abaixo adiciona a funcionalidade para todas as classes do tipo UIViewController apresentar um alerta
    func presentAlert(title: String, message: String, actionHandler: (() -> Void)? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default) { _ in
            actionHandler?()
        })
        present(alert, animated: true)
    }
}
