/**
 * @Name: TabBarRootVC.swift
 * @Description:
 * @Author: iBro
 * @Date: 2021/3/9
 * @Copyright: 
 */


import UIKit
import SnapKit

class TabBarRootVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addChildVC()
        setTabBar()
    }
    
    func addChildVC() {
        let main = ViewController()
        self.viewControllers = [main]
    }
    
    func setTabBar() {
//        tabBar.removeFromSuperview()
        tabBar.isHidden = true
        
        let tbView = TabBarView(a: "Hello")
        tbView.backgroundColor = UIColor.init(displayP3Red: 0.741, green: 0.265, blue: 0.166, alpha: 0.65)
        tbView.layer.masksToBounds = true
        tbView.layer.cornerRadius = 10
        view.addSubview(tbView)
        #if targetEnvironment(macCatalyst)
//            tbView.frame = CGRect(x: 20, y: kScreenHeight - 90, width: view.bounds.size.width - 40, height: 60)
        tbView.snp.makeConstraints { make in
            make.left.equalTo(20)
            make.bottom.equalTo(-20)
            make.right.equalTo(-20)
            make.height.equalTo(60)
        }
        #else
            tbView.frame = CGRect(x: 10, y: kScreenHeight - 90, width: kScreenWidth - 20, height: 50)
        #endif
        
        let w = 40
        let h = 50
        for i in 0..<(viewControllers?.count ?? 0) {
            let tv = Bundle.main.loadNibNamed("TabView", owner: nil, options: nil)?.last as! TabView
//            tv.frame = CGRect(x: 0, y: 0, width: w, height: h)
            tbView.addSubview(tv)
            tv.snp.makeConstraints { make in
                make.left.equalTo(0)
                make.top.bottom.equalTo(0)
                make.right.equalTo(0)
            }
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
