



import UIKit




class FirstViewController: UIViewController ,UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var drawViewArea: drawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
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
        
        let theDrawView : drawView = drawViewArea as drawView    //
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
    }
    @IBAction func pictur(sender: AnyObject) {
        if (UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)){
            let imagePickerController = UIImagePickerController()
            imagePickerController.sourceType = .PhotoLibrary
            imagePickerController.allowsEditing = true
            imagePickerController.delegate = self
            presentViewController(imagePickerController, animated: true, completion: nil)
        }
    }
    
    
}