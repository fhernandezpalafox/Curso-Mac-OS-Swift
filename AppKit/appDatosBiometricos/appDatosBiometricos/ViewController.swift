//
//  ViewController.swift
//  appDatosBiometricos
//
//  Created by Felipe Hernandez on 4/20/19.
//  Copyright © 2019 Felipe Hernandez. All rights reserved.
//

import Cocoa
import LocalAuthentication

class ViewController: NSViewController {
    
let  appDelegate = NSApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var txtPassword: NSSecureTextField!
    @IBOutlet weak var txtUsuario: NSTextField!
    
    @IBAction func onAceptar(_ sender: Any) {
        if txtUsuario.stringValue == "felipe" && txtPassword.stringValue == "fe" {
            
        }
    }
    
    @IBAction func onBiometrico(_ sender: Any) {
        
        let contexto = LAContext()
        var error: NSError?
        
        let myLocalizedReasonString = "La aplicación usara tu acceso mediante a tu usuario."
        
        if contexto.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error) {
             print("No esta disponible el acceso mediante usuario MacOS.")
        }
        
        contexto.evaluatePolicy(.deviceOwnerAuthentication, localizedReason: myLocalizedReasonString) { success, evaluateError in
            
            DispatchQueue.main.async {
                if success {
                    
                    /*let mainStoryboard = self.appDelegate.MainStoryboard()
                    
                    let viewController = self.appDelegate.GetViewController(storyboard: mainStoryboard, viewControllerName: "PrincipalViewController")
                    
                    self.appDelegate.SetRootViewController(rootViewController: viewController)
                    */
                     print("todo bien.")
                    
                  let viewController =  self.appDelegate.GetViewController(storyboard: self.appDelegate.MainStoryBoard(), viewControllerName: "PrincipalViewController")

                    self.appDelegate.SetRootViewController(rootViewController: viewController)
                    
                   self.dismiss(self)
                    
                }else {
                    print("Error de autenticacion.")
                }
            }
        }
    }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

