



import UIKit




class FirstViewController: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var drawViewArea: DrawView!
    var imageView:UIImageView! = nil
    var imgView:UIImageView! = nil
    var cancell:String! = "キャンセル"
    
    
    let alert = UIAlertController()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        drawViewArea.backgroundColor = UIColor.clear
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        imgView = UIImageView(frame:drawViewArea.frame)
        
        //        drawViewArea.layer.contents = UIImage(named: "FaceBook.png")!.CGImage!
        self.view.addSubview(imgView)
        
        view.sendSubview(toBack: imgView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func which (){
        alert.title = "方法を選択"
        alert.addAction(UIAlertAction(title: "写真を追加", style: .default, handler: { action in
            
            
        }))
        alert.addAction(UIAlertAction(title: "テンプレートから選ぶ" , style: .default, handler: {action in
            print ("a")
        }))
        alert.addAction(UIAlertAction(title: "キャンセル", style: .cancel, handler: { action in
        print ("s") }))
        present(alert, animated: true, completion: nil)

        //        alert.addButton(withTitle: "写真を追加")
        //        alert.addButton(withTitle: "テンプレートから選ぶ")
        //        alert.addButton(withTitle: cancell)
        //        alert.cancelButtonIndex = 2
        //        alert.show()
    }
    
    @IBAction func onoff (){
        if drawViewArea.isWriteflag == false {
            drawViewArea.isWriteflag = true
        }else if drawViewArea.isWriteflag == true {
            drawViewArea.isWriteflag = false
        }
    }
    @IBAction func clia(){
        
        let theDrawView : DrawView = drawViewArea as DrawView    //
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
    }
    //    @IBAction func pictur(_ sender: AnyObject) {
    //
    func image (){
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }
        
    }
    //    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            imgView.image = editedImage
            imgView.contentMode = .scaleAspectFit
        }else{
            imgView.image = image // ここのimageに情報が入ってない
        }
        
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func background (){
        image()
    }
    
}
//パン、ピンチで拡大、縮小、移動
//選択画像の表示
//UIImageViewの生成
//
//
//
//
//
