//
//  WebViewController.swift
//  Lit
//
//  Created by 田中颯太 on 2016/06/01.
//  Copyright © 2016年 田中颯太. All rights reserved.
//

import UIKit
import Social

class WebViewController: UIViewController ,UIWebViewDelegate ,UIActionSheetDelegate{
    
    @IBAction func tapButton(sender : AnyObject) {
        
        
        var sheet: UIActionSheet = UIActionSheet()
        
        
        let title: String = "Please choose a plan"
        
        sheet.title  = title
        sheet.delegate = self
        sheet.addButtonWithTitle("Cancel")
        sheet.addButtonWithTitle("FaceBookで共有")
        sheet.addButtonWithTitle("Twitterで共有")
        sheet.addButtonWithTitle("LINEで共有")
        // キャンセルボタンのindexを指定
        sheet.cancelButtonIndex = 0
        
        // UIActionSheet表示
        sheet.showInView(self.view)
    }
    
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func tapBottan(sender: AnyObject) {
    }
    var targetURL = "https://www.life-is-tech.com"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webviwe
        
        webview.scalesPageToFit = true
        loadAddressURL()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func Facebook(sender: AnyObject) {
        let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        composeViewController.setInitialText(text)
        
        self.presentViewController(composeViewController, animated: true, completion: nil)
    }
    func Twittr(sender: AnyObject) {
        let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        
        self.presentViewController(composeViewController, animated: true, completion: nil)
    }
    func line(sender: AnyObject) {
        let text: String! = "Message!!"
        let encodeMessage: String! = text.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
        let messageURL: NSURL! = NSURL( string: "line://msg/text/" + encodeMessage )
        if (UIApplication.sharedApplication().canOpenURL(messageURL)) {
            UIApplication.sharedApplication().openURL( messageURL )
        }
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
    func actionSheet(sheet: UIActionSheet!, clickedButtonAtIndex buttonIndex: Int) {
        print("index %d %@", buttonIndex, sheet.buttonTitleAtIndex(buttonIndex))
        if buttonIndex == 1{
            let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
            let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            composeViewController.setInitialText(text)
            
            self.presentViewController(composeViewController, animated: true, completion: nil)
            
            
            
        }
        if buttonIndex == 2{
            let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
            let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            composeViewController.setInitialText(text)
            
            self.presentViewController(composeViewController, animated: true, completion: nil)
            
            
        }
        if buttonIndex == 3{
            let text: String! = "Message!!"
            let encodeMessage: String! = text.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            let messageURL: NSURL! = NSURL( string: "line://msg/text/" + encodeMessage )
            if (UIApplication.sharedApplication().canOpenURL(messageURL)) {
                UIApplication.sharedApplication().openURL( messageURL )
            }
            
            
        }
    }
    
    
}
//シェアできるようにする

