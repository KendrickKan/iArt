//
//  MessageViewController.swift
//  iArt
//
//  Created by mac on 2021/1/21.
//

import UIKit

class MessageViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.blue
        super.viewDidLoad()

        let paint = UILabel(frame: CGRect(x: 185, y: 50, width: 76, height: 29))
        // Do any additional setup after loading the view.
        paint.text = "信息箱"
        paint.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(paint)
        // Do any additional setup after loading the view.
        
        let mes = UIImageView(image: UIImage(named: "message"))
        mes.frame = CGRect(x: 0, y: 135, width: 414, height: 314)
        self.view.addSubview(mes)
        
//        let text = UILabel(frame: CGRect(x: 13, y: 95, width: 160, height: 29))
//        text.text = "通知列表"
//        text.font = UIFont.systemFont(ofSize: 20)
//        self.view.addSubview(text)
//
//        let text1 = UILabel(frame: CGRect(x: 290, y: 95, width: 160, height: 29))
//        text1.text = "全部已读"
//        text1.font = UIFont.systemFont(ofSize: 20)
//        self.view.addSubview(text1)
        
        let navi = UIImageView(image: UIImage(named: "navi"))
        navi.frame = CGRect(x: 68, y: 806, width: 278, height: 67)
        self.view.addSubview(navi)
        
        let infor = UIButton(frame: CGRect(x: 307, y: 806, width: 43, height: 67))
        infor.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(infor)
        infor.addTarget(self, action: #selector(another2), for: .touchUpInside)
        
        let remark = UIButton(frame: CGRect(x: 20, y: 806, width: 80, height: 67))
        remark.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(remark)
        remark.addTarget(self, action: #selector(another3), for: .touchUpInside)
        
        let session = UIButton(frame: CGRect(x: 0, y: 211, width: 414, height: 80))
        session.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
        self.view.addSubview(session)
        session.addTarget(self, action: #selector(another1), for: .touchUpInside)
        
    }
    @objc func another1(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "sessionboard") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another2(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "informationboard") as UIViewController
        self.navigationController?.pushViewController(con, animated: true)
    }
    
    @objc func another3(){
        let con = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "remarkboard") as UIViewController
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
