//
//  WorksController.swift
//  iArt
//
//  Created by mac on 2021/1/21.
//

import UIKit

class WorksController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.blue
        super.viewDidLoad()
        
        
        
        let header = UIImageView(image: UIImage(named: "header"))
        header.frame = CGRect(x: 0, y: 0, width: 414, height: 88)
        self.view.addSubview(header)
        let paint = UILabel(frame: CGRect(x: 185, y: 50, width: 51, height: 29))
        // Do any additional setup after loading the view.
        paint.text = "画作"
        paint.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(paint)
        
        let back = UIImageView(image: UIImage(named: "background"))
        back.frame = CGRect(x: 0, y: 398, width: 414, height: 422)
        self.view.addSubview(back)
        
        let painter = UIImageView(image: UIImage(named: "painter"))
        painter.frame = CGRect(x: 0, y: 88, width: 414, height: 310)
        self.view.addSubview(painter)
        
        let text0 = UILabel(frame: CGRect(x: 23, y: 439, width: 94, height: 58))
        text0.text = "潜在危险倾向评价"
        text0.font = UIFont.systemFont(ofSize: 20)
        text0.numberOfLines = 0
        self.view.addSubview(text0)
        
        let text1 = UILabel(frame: CGRect(x: 23, y: 529, width: 94, height: 58))
        text1.text = "社交兴趣障碍评价"
        text1.font = UIFont.systemFont(ofSize: 20)
        text1.numberOfLines = 0
        self.view.addSubview(text1)
        
        let text2 = UILabel(frame: CGRect(x: 23, y: 619, width: 94, height: 58))
        text2.text = "心理健康综合指数"
        text2.font = UIFont.systemFont(ofSize: 20)
        text2.numberOfLines = 0
        self.view.addSubview(text2)
        
        let sun = UIImageView(image: UIImage(named: "sunny"))
        sun.frame = CGRect(x: 161, y: 398, width: 253, height: 283)
        sun.backgroundColor = UIColor.white
        sun.tintColor = UIColor.blue
        self.view.addSubview(sun)
        
        let inpu = UIImageView(image: UIImage(named: "input"))
        inpu.frame = CGRect(x: 0, y: 820, width: 414, height: 46)
        self.view.addSubview(inpu)
        
        let textfield = UITextField(frame: CGRect(x: 54, y: 825, width: 279, height: 36))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "请输入您对画作的具体评价吧！"
        textfield.textColor = UIColor.gray
        textfield.layer.masksToBounds = true
        self.view.addSubview(textfield)
        
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
