//
//  ViewController.swift
//  MyApp14
//
//  Created by iii-user on 2017/6/30.
//  Copyright © 2017年 iii-user. All rights reserved.
//

import UIKit
import JavaScriptCore

class ViewController: UIViewController , BradProtocol{

    @IBOutlet weak var webView: UIWebView!
    
    
    @IBOutlet weak var labelName: UILabel!
    
    @IBAction func test1(_ sender: Any) {
        
        let url = Bundle.main.url(forResource: "brad", withExtension: "html")
        let req = URLRequest(url: url!)
        webView.loadRequest(req)
        
        let jsContext = webView.value(forKeyPath: "documentView.webView.mainFrame.javaScriptContext") as! JSContext
        
        jsContext.setObject(self, forKeyedSubscript: "iii" as (NSCopying & NSObjectProtocol)!)
        
    }
    func m1(_ name:String){
        print("ur name is \(name)")
        labelName.text = name
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

   

}
@objc protocol BradProtocol :JSExport{
    func m1(_ name:String)
}
