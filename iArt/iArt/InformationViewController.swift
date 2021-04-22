//
//  InformationViewController.swift
//  iArt
//
//  Created by mac on 2021/1/21.
//

import UIKit

class InformationViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.blue
        super.viewDidLoad()
        
        let back = UIImageView(image: UIImage(named: "fire"))
        back.frame = CGRect(x: 0, y: 88, width: 414, height: 713)
        self.view.addSubview(back)
        
        let white = UIButton(frame: CGRect(x: 42, y: 115, width: 332, height: 561))
        white.backgroundColor = UIColor.white
        white.layer.cornerRadius = 30
        self.view.addSubview(white)
        
        let user = UIImageView(image: UIImage(named: "user"))
        user.frame = CGRect(x: 60, y: 140, width: 295, height: 495)
        self.view.addSubview(user)
        
        let loginbutton = UIButton(frame: CGRect(x: 91, y: 698, width: 233, height: 56))
        loginbutton.backgroundColor = UIColor.red
        loginbutton.setTitle("退出登陆", for: .normal)
        loginbutton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
        loginbutton.layer.cornerRadius = 30
        loginbutton.layer.masksToBounds = true
        self.view.addSubview(loginbutton)
        loginbutton.addTarget(self, action: #selector(another4), for: .touchUpInside)
        // Do any additional setup after loading the view.
        
        let navi = UIImageView(image: UIImage(named: "navi"))
        navi.frame = CGRect(x: 68, y: 806, width: 278, height: 67)
        self.view.addSubview(navi)
        
        let mes = UIButton(frame: CGRect(x: 163, y: 806, width: 63, height: 67))
        mes.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(mes)
        mes.addTarget(self, action: #selector(another1), for: .touchUpInside)
        
        let remark = UIButton(frame: CGRect(x: 20, y: 806, width: 80, height: 67))
        remark.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(remark)
        remark.addTarget(self, action: #selector(another2), for: .touchUpInside)
        
        let doc = UIButton(frame: CGRect(x: 125, y: 452, width: 180, height: 36))
        doc.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(doc)
        doc.addTarget(self, action: #selector(another3), for: .touchUpInside)
        
        let me = UIButton(frame: CGRect(x: 125, y: 528, width: 180, height: 36))
        me.backgroundColor = UIColor(red: 0.8, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(me)
        me.addTarget(self, action: #selector(another5), for: .touchUpInside)
    }
    
    
    @objc func another1(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "messageboard") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another2(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "remarkboard") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another3(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "Doctor") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another4(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "view") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another5(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "messageboard") as UIViewController
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
