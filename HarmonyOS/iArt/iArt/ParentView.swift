//
//  ChildrenView.swift
//  iArt
//
//  Created by KanDong on 2021/4/10.
//

import UIKit

class ParentView: UIViewController {
    
    

    override func viewDidLoad() {
        
        //print("GlobalUserId:"+GlobalUserId)
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "snowmoutain")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        let newdrawer = UIImageView(image: UIImage(named: "lanterm"))
        
        newdrawer.frame = CGRect(x: 8, y: 100, width: 28, height: 28)
        newdrawer.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        //newdrawer.backgroundColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        self.view.addSubview(newdrawer)//黄色图标
        
        let title = UILabel(frame: CGRect(x: 40, y: 105, width: 120, height: 20))
        title.text = "孩子的画作"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = UIColor.systemBlue
        self.view.addSubview(title)
        
        let picBtn = UIButton(frame: CGRect(x:32,y:140,width: 350,height: 200))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn.setBackgroundImage(UIImage(named: "draw1"), for: UIControl.State.normal)
        picBtn.layer.masksToBounds = true
        picBtn.layer.cornerRadius = 19
        self.view.addSubview(picBtn)
        picBtn.addTarget(self, action: #selector(turnToPicView), for: .touchUpInside)
        
        
        let picBtn2 = UIButton(frame: CGRect(x:32,y:360,width: 350,height: 200))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn2.setBackgroundImage(UIImage(named: "draw2"), for: UIControl.State.normal)
        picBtn2.layer.masksToBounds = true
        picBtn2.layer.cornerRadius = 19
        self.view.addSubview(picBtn2)
        picBtn2.addTarget(self, action: #selector(turnToPicView), for: .touchUpInside)
        
        
        let aboutBtn = UIButton(frame: CGRect(x:345,y:60,width: 60,height: 60))
        //let picBtn = UIButton(frame: UIScreen.)
        aboutBtn.setBackgroundImage(UIImage(named: "aboutme"), for: UIControl.State.normal)
        aboutBtn.layer.masksToBounds = true
        aboutBtn.layer.cornerRadius = 19
        self.view.addSubview(aboutBtn)
        aboutBtn.addTarget(self, action: #selector(turnToAboutMe), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func turnToAboutMe(){
        
        
        let con = AboutMeView()
        self.navigationController?.pushViewController(con, animated: true)
        
    }
    
    
    @objc func turnToPicView(){
        
        //这要记得将pic参数改一改
        
        let con = PicView()
        self.navigationController?.pushViewController(con, animated: true)
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
