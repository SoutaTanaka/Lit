



import UIKit

class FirstViewController: UIViewController{
    
  
   
    @IBOutlet weak var drawViewArea: drawView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clia(){
   
        let theDrawView : drawView = drawViewArea as drawView    //
        theDrawView.lines = []
        theDrawView.setNeedsDisplay()
        
    }
    
}