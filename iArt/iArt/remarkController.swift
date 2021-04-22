//
//  remarkController.swift
//  iArt
//
//  Created by mac on 2021/1/12.
//

import UIKit

class remarkController: UIViewController {

    override func viewDidLoad() {
        
        
        super.viewDidLoad()
                //去掉（重设）NavigationBar上的一条线
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.white
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height:90 ))
        label.backgroundColor = UIColor(red: 60.0/255, green: 200.0/255, blue: 1.0, alpha: 1.0)
        
        self.view.addSubview(label)
        
        
        
        let cloud = UIImageView(image: UIImage(named: "cloud"))
        // Do any additional setup after loading the view.
        cloud.frame = CGRect(x: 121, y:-30, width: 200, height: 120)
        self.view.addSubview(cloud)
        
        let cloud1 = UIImageView(image: UIImage(named: "cloud"))
        // Do any additional setup after loading the view.
        cloud1.frame = CGRect(x: 227, y:-30, width: 200, height: 120)
        
        
        self.view.addSubview(cloud1)//两朵小云
        
        let label1 = UILabel(frame: CGRect(x: 1, y: 86, width: 412, height: 717))
        label1.backgroundColor = UIColor(red: 249.0/255, green: 237.0/255, blue: 237.0/255, alpha: 1.0)
        self.view.addSubview(label1)
        
        let newdrawer = UIImageView(image: UIImage(named: "newdraw"))
        
        newdrawer.frame = CGRect(x: 8, y: 100, width: 28, height: 28)
        newdrawer.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        //newdrawer.backgroundColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        self.view.addSubview(newdrawer)//黄色图标
        //newdrawer.frame = CGRect(x: 6, y: 456, width: 30, height: 30)
        //self.view.addSubview(newdrawer)
        
//        let newdraw = UILabel(frame: CGRect(x: 46, y: 100, width: 72, height: 26))
//        newdraw.text = "最新画作"
//        self.view.addSubview(newdraw)
//
//        let lanterm = UIImageView(image: UIImage(named: "lanterm"))
//
//        lanterm.frame = CGRect(x: 115, y: 60, width: 113, height: 88)
//        //lanterm.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
//        self.view.addSubview(lanterm)
//        let lanterm1=UIImageView(image: UIImage(named: "lanterm"))
//        lanterm1.frame = CGRect(x: 207, y: 60, width: 113, height: 88)
//        self.view.addSubview(lanterm1)
//        let lanterm2=UIImageView(image: UIImage(named: "lanterm"))
//        lanterm2.frame = CGRect(x: 305, y: 60, width: 113, height: 88)
//        self.view.addSubview(lanterm2)//三个灯笼
//
//        let draw1 = UIImageView(image: UIImage(named: "draw1"))
//        draw1.frame = CGRect(x: 104, y: 144, width: 200, height: 120)
//        self.view.addSubview(draw1)
//        let text1 = UILabel(frame: CGRect(x: 1, y: 278, width: 200, height: 26))
//        text1.text = "上传时间：2020.12.25"
//        self.view.addSubview(text1)
        
//        let draw2 = UIImageView(image: UIImage(named: "draw2"))
//        draw2.frame = CGRect(x: 104, y: 300, width: 200, height: 120)
//        self.view.addSubview(draw2)
//        let text2 = UILabel(frame: CGRect(x: 211, y: 278, width: 200, height: 26))
//        text2.text = "上传时间：2020.12.21"
//        self.view.addSubview(text2)
        
//        let draw3 = UIImageView(image: UIImage(named: "draw2"))
//        draw3.frame = CGRect(x: 1, y: 505, width: 200, height: 140)
//        self.view.addSubview(draw3)
//        let text3 = UILabel(frame: CGRect(x: 1, y: 663, width: 200, height: 26))
//        text3.text = "上传时间：2020.12.18"
//        self.view.addSubview(text3)
//
//        let draw4 = UIImageView(image: UIImage(named: "draw1"))
//        draw4.frame = CGRect(x: 212, y: 505, width: 200, height: 140)
//        self.view.addSubview(draw4)
//        let text4 = UILabel(frame: CGRect(x: 211, y: 663, width: 200, height: 26))
//        text4.text = "上传时间：2020.12.16"
//        self.view.addSubview(text4)
        
//        let newdrawer1 = UIImageView(image: UIImage(named: "newdraw"))
//
//        newdrawer1.frame = CGRect(x: 8, y: 456, width: 28, height: 28)
//        newdrawer1.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
//        //newdrawer.backgroundColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
//        self.view.addSubview(newdrawer1)//黄色图标
//        let newdraw1 = UILabel(frame: CGRect(x: 49, y: 456, width: 90, height: 26))
//        newdraw1.text = "已点评画作"
//        self.view.addSubview(newdraw1)
//
//        let green = UIImageView(image: UIImage(named: "green"))
//        green.frame = CGRect(x: 0, y: 735, width: 77, height: 74)
//        self.view.addSubview(green)
//        let green1 = UIImageView(image: UIImage(named: "green"))
//        green1.frame = CGRect(x: 74, y: 735, width: 77, height: 74)
//        self.view.addSubview(green1)
//        let green2 = UIImageView(image: UIImage(named: "green"))
//        green2.frame = CGRect(x: 164, y: 735, width: 77, height: 74)
//        self.view.addSubview(green2)
//        let green3 = UIImageView(image: UIImage(named: "green"))
//        green3.frame = CGRect(x: 256, y: 735, width: 77, height: 74)
//        self.view.addSubview(green3)
//        let green4 = UIImageView(image: UIImage(named: "green"))
//        green4.frame = CGRect(x: 344, y: 735, width: 77, height: 74)
//        self.view.addSubview(green4)
        
//        let navi = UIImageView(image: UIImage(named: "navi"))
//        navi.frame = CGRect(x: 68, y: 806, width: 278, height: 67)
//        self.view.addSubview(navi)
//
//        let workbutton = UIButton(frame: CGRect(x: 4, y: 144, width: 200, height: 120))
//        workbutton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
//        self.view.addSubview(workbutton)
//        workbutton.addTarget(self, action: #selector(another), for: .touchUpInside)
//
//        let docbutton = UIButton(frame: CGRect(x: 1, y: 505, width: 200, height: 140))
//        docbutton.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
//        self.view.addSubview(docbutton)
//        docbutton.addTarget(self, action: #selector(another1), for: .touchUpInside)
//
//        //导航栏跳转
//        let infor = UIButton(frame: CGRect(x: 307, y: 806, width: 43, height: 67))
//        infor.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
//        self.view.addSubview(infor)
//        infor.addTarget(self, action: #selector(another2), for: .touchUpInside)
//
//        let mes = UIButton(frame: CGRect(x: 163, y: 806, width: 63, height: 67))
//        mes.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
//        self.view.addSubview(mes)
//        mes.addTarget(self, action: #selector(another3), for: .touchUpInside)
//
   }
//    @objc func another() {
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "worksboard") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
//    }
//    @objc func another1(){
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "Doctor") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
//    }
//    @objc func another2(){
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "informationboard") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
//    }
//
//    @objc func another3(){
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "messageboard") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
