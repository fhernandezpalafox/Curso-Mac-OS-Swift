//
//  ViewController.swift
//  AppEjercicio8
//
//  Created by Felipe Hernandez on 23/02/18.
//  Copyright © 2018 Felipe Hernandez. All rights reserved.
//

import Cocoa
import WebKit

class ViewController: NSViewController, WKNavigationDelegate {

    @IBOutlet weak var indicator: NSProgressIndicator!
    
    @IBOutlet weak var txtUrl: NSTextField!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func onIr(_ sender: Any) {
        
        let url =  URL(string:txtUrl.stringValue)
        
        let request =  URLRequest(url: url!)
        
        webView.load(request)
        
        webView.navigationDelegate =  self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL(string:"http://www.google.com")
        
        let request = URLRequest(url: url!)
        
        webView.load(request)
        
        indicator.isHidden = true
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        indicator.isHidden = false
        indicator.startAnimation(self)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        indicator.isHidden = true
        indicator.stopAnimation(self)
    }

}

