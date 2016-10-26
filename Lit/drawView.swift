
import UIKit

class DrawView: UIView {
    
    //6.
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var isWriteflag = true
    var a: CGFloat = 0
    var b: CGFloat = 1
    var c: CGFloat = 0
    var d: CGFloat = 30
    var size: CGFloat = 8
    
    
    
    //4.
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //self.backgroundColor = UIColor.blackColor() //チェック用
        
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        }
//    タッチ取得
    //7.
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isWriteflag == true{
            lastPoint = touches.first?.location(in: self)
        }
        //lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isWriteflag == true{
            let newPoint = touches.first?.location(in: self)
            lines.append(Line(start: lastPoint, end: newPoint!))
            lastPoint = newPoint
            
            self.setNeedsDisplay()
        }
        
    }
    
    //8.線のやつ
    override func draw(_ rect: CGRect) {
        if isWriteflag == true{
            let context = UIGraphicsGetCurrentContext()
            context?.beginPath()
            
            for line in lines {
                context?.move(to: CGPoint(x: line.start.x, y: line.start.y))
                context?.addLine(to: CGPoint(x: line.end.x, y: line.end.y))
                
            }
            
            context?.setStrokeColor(red: a, green: b, blue: c, alpha: d) //線の色
            context?.setLineWidth(size)  //線の太さ
            context?.setLineCap(CGLineCap.round)   //線を滑らかに
            context?.strokePath()
        }
    }
}
