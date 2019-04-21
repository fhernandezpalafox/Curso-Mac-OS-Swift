//
//  AppDelegate.swift
//  appDatosBiometricos
//
//  Created by Felipe Hernandez on 4/20/19.
//  Copyright © 2019 Felipe Hernandez. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    var window = NSApplication.shared.mainWindow?.windowController
    

    func MainStoryBoard() -> NSStoryboard {
        
        return NSStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func GetViewController(storyboard: NSStoryboard,
                           viewControllerName :String) -> NSViewController? {
        
        //Retorna la viewController mediante el identificador que le esta mandando
        //como parametro
        //Main, Chat o Login
        return (storyboard.instantiateController(withIdentifier:  viewControllerName) as? NSViewController)
        
    }
    
    func SetRootViewController(rootViewController:NSViewController?)  {
        
        //Se realiza la validacion si es diferente de nil o null
        if let aController = rootViewController {  //Login o Chat
            rootViewController?.presentAsModalWindow(aController)
        }
        
    }
    

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        
        let loginViewController =  GetViewController(storyboard: MainStoryBoard(), viewControllerName: "ViewController")
        
        SetRootViewController(rootViewController: loginViewController)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

