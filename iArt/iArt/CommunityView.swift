//
//  CommunityView.swift
//  iArt
//
//  Created by KanDong on 2021/10/16.
//

import UIKit

class CommunityView: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
//        Thread.sleep(forTimeInterval: 0)
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "communitypic")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
//        let CommunityBtn = UIButton(frame: CGRect(x: 150, y: 770, width:120, height: 120))
//        //CommunityBtn.setBackgroundImage(UIImage(named: "communitybtn"), for: UIControl.State.normal)
//        CommunityBtn.layer.masksToBounds = true
//        CommunityBtn.layer.cornerRadius = 25
//        self.view.addSubview(CommunityBtn)
//        CommunityBtn.addTarget(self, action: #selector(turnToWeeklyReport), for: .touchUpInside)
//
        let CommunityBtn = UIButton(frame: CGRect(x: 290, y: -30, width: 100, height:200))
        //CommunityBtn.backgroundColor = UIColor(red: 173/255, green: 212/255,blue: 209/255, alpha: 1)
        CommunityBtn.setTitle("健康周报", for: .normal)
        CommunityBtn.setTitleColor(UIColor.systemBlue, for: .normal)
        CommunityBtn.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
        //CommunityBtn.layer.cornerRadius = 25
        CommunityBtn.layer.masksToBounds = true
        self.view.addSubview(CommunityBtn)
        CommunityBtn.addTarget(self, action: #selector(turnToWeeklyReport), for: .touchUpInside)
    }
    
    
    @objc func turnToWeeklyReport(){
        let con = WeeklyReportView()
        self.navigationController?.pushViewController(con, animated: true)
        
    }
    
}

