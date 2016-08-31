
import UIKit

class drawView: UIView {
    
    //6.
    var lines: [Line] = []
    var lastPoint: CGPoint!
    var isWriteflag = false
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
    //タッチ取得
    //7.
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if isWriteflag == true{
            lastPoint = touches.first?.locationInView(self)
        }
        //lastPoint = touches.anyObject()?.locationInView(self)
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if isWriteflag == true{
            let newPoint = touches.first?.locationInView(self)
            lines.append(Line(start: lastPoint, end: newPoint!))
            lastPoint = newPoint
            
            self.setNeedsDisplay()
        }
        
    }
    
    //8.線のやつ
    override func drawRect(rect: CGRect) {
        if isWriteflag == true{
            let context = UIGraphicsGetCurrentContext()
            CGContextBeginPath(context)
            
            for line in lines {
                CGContextMoveToPoint(context, line.start.x, line.start.y)
                CGContextAddLineToPoint(context, line.end.x, line.end.y)
                
            }
            
            CGContextSetRGBStrokeColor(context, a, b, c, d) //線の色
            CGContextSetLineWidth(context, size)  //線の太さ
            CGContextSetLineCap(context, CGLineCap.Round)   //線を滑らかに
            CGContextStrokePath(context)
        }
    }
}