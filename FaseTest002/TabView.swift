/**
 * @Name: TabView.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/9
 * @Copyright: 
 */


import UIKit

class TabView: UIView {

    @IBOutlet weak var iconImgV: UIImageView!
    @IBOutlet weak var nameL: UILabel!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override class func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib-class")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("awakeFromNib")
        iconImgV.image = UIImage.init(named: "AppVoiceAssistant")
    }
}
