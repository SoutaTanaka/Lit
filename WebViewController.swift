//
//  WebViewController.swift
//  Lit
//
//  Created by 田中颯太 on 2016/06/01.
//  Copyright © 2016年 田中颯太. All rights reserved.
//

import UIKit

class WebViewController: UIViewController ,UIWebViewDelegate{
    
    @IBOutlet weak var webview: UIWebView!
    
    var targetURL = "https://www.life-is-tech.com"
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webviwe
        
        webview.scalesPageToFit = true
         loadAddressURL()
        // Do any additional setup after loading the view, typically from a nib.
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadAddressURL() {
        let requestURL = NSURL(string: targetURL)
        let req = NSURLRequest(URL: requestURL!)
        webview.loadRequest(req)
    }
    //ステータスバーを非表示
    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    

}
