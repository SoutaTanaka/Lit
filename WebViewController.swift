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
    
    @IBAction func tapButton(_ sender : AnyObject) {
        
        
        let sheet: UIActionSheet = UIActionSheet()
        
        
        let title: String = "Please choose a plan"
        
        sheet.title  = title
        sheet.delegate = self
        sheet.addButton(withTitle: "Cancel")
        sheet.addButton(withTitle: "FaceBookで共有")
        sheet.addButton(withTitle: "Twitterで共有")
        sheet.addButton(withTitle: "LINEで共有")
        // キャンセルボタンのindexを指定
        sheet.cancelButtonIndex = 0
        
        // UIActionSheet表示
        sheet.show(in: self.view)
    }
    
    
    @IBOutlet weak var webview: UIWebView!
    
    @IBAction func tapBottan(_ sender: AnyObject) {
    }
    var targetURL = "https://www.life-is-tech.com"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //webviwe
        
        webview.scalesPageToFit = true
        loadAddressURL()
        // Do any additional setup after loading the view, typically from a nib.
    }
    func Facebook(_ sender: AnyObject) {
        let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
        composeViewController.setInitialText(text)
        
        self.present(composeViewController, animated: true, completion: nil)
    }
    func Twittr(_ sender: AnyObject) {
        let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
        let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
        composeViewController.setInitialText(text)
        
        self.present(composeViewController, animated: true, completion: nil)
    }
    func line(_ sender: AnyObject) {
        let text: String! = "Message!!"
        let encodeMessage: String! = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        let messageURL: URL! = URL( string: "line://msg/text/" + encodeMessage )
        if (UIApplication.shared.canOpenURL(messageURL)) {
            UIApplication.shared.openURL( messageURL )
        }
    }
    
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func loadAddressURL() {
        let requestURL = URL(string: targetURL)
        let req = URLRequest(url: requestURL!)
        webview.loadRequest(req)
    }
    //ステータスバーを非表示
    override var prefersStatusBarHidden : Bool {
        return true
    }
    func actionSheet(_ sheet: UIActionSheet!, clickedButtonAt buttonIndex: Int) {
        print("index %d %@", buttonIndex, sheet.buttonTitle(at: buttonIndex))
        if buttonIndex == 1{
            let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
            let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)!
            composeViewController.setInitialText(text)
            
            self.present(composeViewController, animated: true, completion: nil)
            
            
            
        }
        if buttonIndex == 2{
            let text = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
            let composeViewController: SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)!
            composeViewController.setInitialText(text)
            
            self.present(composeViewController, animated: true, completion: nil)
            
            
        }
        if buttonIndex == 3{
            let text: String! = "Life is Tech ! | ライフイズテック | 中学生、高校生のためのプログラミング教育・ITキャンプ／スクール https://life-is-tech.com/ @Life_is_Techさんから"
            let encodeMessage: String! = text.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
            let messageURL: URL! = URL( string: "line://msg/text/" + encodeMessage )
            if (UIApplication.shared.canOpenURL(messageURL)) {
                UIApplication.shared.openURL( messageURL )
            }
            
            
        }
    }
    
    
}
//シェアできるようにする

