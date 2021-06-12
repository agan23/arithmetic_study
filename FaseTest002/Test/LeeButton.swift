/**
 * @Name: LeeButton.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/4/5
 * @Copyright: 
 */


import UIKit

class LeeButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let cgrect = self.bounds
        let buttonBounds = cgrect.insetBy(dx: -20, dy: -20)
  
        return buttonBounds.contains(point)
    }
}
