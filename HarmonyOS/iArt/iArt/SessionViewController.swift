//
//  SessionViewController.swift
//  iArt
//
//  Created by mac on 2021/1/22.
//

import UIKit

class SessionViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.black
        super.viewDidLoad()

        let back = UIImageView(image: UIImage(named: "fire"))
        back.frame = CGRect(x: 0, y: 88, width: 414, height: 743)
        self.view.addSubview(back)
        
        let paint = UILabel(frame: CGRect(x: 157, y: 53, width: 160, height: 25))
        // Do any additional setup after loading the view.
        paint.text = "小明的家长"
        paint.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(paint)
        
        let more = UIImageView(image: UIImage(named: "more"))
        more.frame = CGRect(x: 362, y: 53, width: 26, height: 26)
        self.view.addSubview(more)
        
        
        let ming = UIImageView(image: UIImage(named: "ming"))
        ming.frame = CGRect(x: 4, y: 160, width: 46, height: 46)
        ming.layer.cornerRadius = 100
        self.view.addSubview(ming)
        
        let ming1 = UIImageView(image: UIImage(named: "ming"))
        ming1.frame = CGRect(x: 4, y: 388, width: 46, height: 46)
        ming1.layer.cornerRadius = 100
        self.view.addSubview(ming1)
        
        let fly = UIImageView(image: UIImage(named: "fly"))
        fly.frame = CGRect(x: 359, y: 280, width: 46, height: 46)
        fly.layer.cornerRadius = 100
        self.view.addSubview(fly)
        
        let name = UILabel(frame: CGRect(x: 54, y: 157, width: 120, height: 26))
        name.text = "小明的家长"
        name.textColor = UIColor(red: 102/255, green: 102/255,blue: 102/255, alpha: 1)
        name.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(name)
        // Do any additional setup after loading the view.
        let name1 = UILabel(frame: CGRect(x: 54, y: 380, width: 120, height: 26))
        name1.text = "小明的家长"
        name1.textColor = UIColor(red: 102/255, green: 102/255,blue: 102/255, alpha: 1)
        name1.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(name1)
        
        let name3 = UILabel(frame: CGRect(x: 334, y: 267, width: 82, height: 26))
        name3.text = "Fly"
        name3.textColor = UIColor(red: 102/255, green: 102/255,blue: 102/255, alpha: 1)
        name3.font = UIFont.systemFont(ofSize: 14)
        self.view.addSubview(name3)
        
        let talk = UILabel(frame: CGRect(x: 55, y: 188, width: 210, height: 53))
        talk.text = "   治疗师，我家孩子怎么样？"
        talk.backgroundColor = UIColor.white
        talk.textColor = UIColor.black
        talk.layer.cornerRadius = 8
        talk.layer.masksToBounds = true
        talk.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(talk)
        
        let talk1 = UILabel(frame: CGRect(x: 55, y: 422, width: 170, height: 53))
        talk1.text = "   可以详细谈一下吗？"
        talk1.backgroundColor = UIColor.white
        talk1.textColor = UIColor.black
        talk1.layer.cornerRadius = 8
        talk1.layer.masksToBounds = true
        talk1.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(talk1)
        
        let talk2 = UILabel(frame: CGRect(x: 105, y: 306, width: 238, height: 53))
        talk2.text = "   您的孩子心理上可能有些问题"
        talk2.backgroundColor = UIColor(red: 82/255, green: 143/255,blue: 255/255, alpha: 1)
        talk2.textColor = UIColor.white
        talk2.layer.cornerRadius = 8
        talk2.layer.masksToBounds = true
        talk2.font = UIFont.systemFont(ofSize: 16)
        self.view.addSubview(talk2)
        
        let inpu = UIImageView(image: UIImage(named: "input"))
        inpu.frame = CGRect(x: 0, y: 820, width: 414, height: 46)
        self.view.addSubview(inpu)
        
        let textfield = UITextField(frame: CGRect(x: 54, y: 825, width: 279, height: 36))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "输入聊天内容"
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
