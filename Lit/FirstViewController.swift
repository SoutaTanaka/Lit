



import UIKit




class FirstViewController: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var drawViewArea: DrawView!
    var imageView:UIImageView! = nil
    var imgView:UIImageView! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }

        imgView = UIImageView(frame:CGRectMake(0,64,320,455))
    
//        drawViewArea.layer.contents = UIImage(named: "FaceBook.png")!.CGImage!
        self.view.addSubview(imgView)
        
        view.sendSubviewToBack(imgView)
        drawViewArea.backgroundColor = UIColor.clearColor()
        
        

        // Do any additional setup after loading the view, typically from a nib.
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
    @IBAction func pictur(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.preferredContentSize = self.view.frame.size
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        
        if let info = editingInfo, let editedImage = info[UIImagePickerControllerEditedImage] as? UIImage{
            imgView.image = editedImage
            imgView.contentMode = .ScaleAspectFit
        }else{
            imgView.image = image
        }

        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
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
