



import UIKit




class FirstViewController: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var drawViewArea: DrawView!
    var imageView:UIImageView! = nil
    var imgView:UIImageView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }

        
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
    @IBAction func pictur(_ sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary)){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .photoLibrary
            imagePickerController.preferredContentSize = self.view.frame.size
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            present(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            imgView.image = editedImage
            imgView.contentMode = .scaleAspectFit
        }else{
            imgView.image = image
        }

        
        picker.dismiss(animated: true, completion: nil)
        
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
