//
//  ViewController.swift
//  iArt
//
//  Created by mac on 2021/1/12.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class LoginView: UIViewController,UITextFieldDelegate{
//class ViewController: UIViewController{


    var uesrname:String? = nil
    var userpassword:String? = nil
    let textfield = UITextField(frame: CGRect(x: 180, y: 560, width: 380, height: 44))
    let textfield1=UITextField(frame: CGRect(x: 180, y: 640, width: 380, height: 44))
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
//        Thread.sleep(forTimeInterval: 0)
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "loginipad")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
        
//        let logo = UIImageView(image: UIImage(named: "115"))
//        logo.frame = CGRect(x:150 , y :220, width: 100,height: 100)
//        logo.layer.cornerRadius = logo.frame.size.width/2
//        logo.layer.masksToBounds = true
//        self.view.addSubview(logo)
        
//        let title = UILabel(frame: CGRect(x: 210, y: 530, width: 340, height: 35))
//        title.text="小朋友请登录"
//        title.textAlignment = .center
//        title.font = UIFont.systemFont(ofSize:30)
//        title.textColor = UIColor.white

//        self.view.addSubview(title)
        //let textfield = UITextField(frame: CGRect(x: 40, y: 440, width: 340, height: 38))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "电话号码"
        textfield.layer.cornerRadius = 22
        textfield.textColor = UIColor.gray
        textfield.layer.masksToBounds = true
        textfield.clearButtonMode = .always
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.delegate = self

        self.view.addSubview(textfield)

        //let textfield1=UITextField(frame: CGRect(x: 40, y: 510, width: 340, height: 38))
        textfield1.borderStyle = .roundedRect
        textfield1.placeholder = "密码"
        textfield1.layer.cornerRadius = 22
        textfield1.textColor = UIColor.gray
        textfield1.layer.masksToBounds = true
        textfield1.clearButtonMode = .always
        textfield1.isSecureTextEntry = true
        textfield1.keyboardType = UIKeyboardType.default
        textfield1.returnKeyType = UIReturnKeyType.done
        textfield1.delegate = self
        
        self.view.addSubview(textfield1)

        let loginbuttonp = UIButton(frame: CGRect(x: 230, y: 720, width: 120, height: 44))
        loginbuttonp.backgroundColor = UIColor.systemRed
        loginbuttonp.setTitle("登陆", for: .normal)
        loginbuttonp.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        loginbuttonp.layer.cornerRadius = 22
        loginbuttonp.layer.masksToBounds = true
        self.view.addSubview(loginbuttonp)
        loginbuttonp.addTarget(self, action: #selector(anotherp), for: .touchUpInside)
        
//        let loginbuttond = UIButton(frame: CGRect(x: 160, y: 575, width: 100, height: 38))
//        loginbuttond.backgroundColor = UIColor.systemRed
//        loginbuttond.setTitle("医生登陆", for: .normal)
//        loginbuttond.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
//
//        loginbuttond.layer.cornerRadius = 5
//        loginbuttond.layer.masksToBounds = true
//        self.view.addSubview(loginbuttond)
//        loginbuttond.addTarget(self, action: #selector(anotherd), for: .touchUpInside)
        
        
//        self.view.addSubview(loginbutton)
//        @objc func toanother(){
//            let con =
//        }
        
        
        let registerbutton = UIButton(frame: CGRect(x: 420, y: 720, width: 100, height: 44))
        registerbutton.backgroundColor = UIColor.systemBlue
        registerbutton.setTitle("注册", for: .normal)
        registerbutton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        registerbutton.layer.cornerRadius = 22
        registerbutton.layer.masksToBounds = true
        self.view.addSubview(registerbutton)
        registerbutton.addTarget(self, action: #selector(another1), for: .touchUpInside)
        
        
    }
    
//    @objc func askpost()->Bool{
//
//        let params = ["userId":textfield.text,
//                      "password":textfield1.text] as [String : Any]
//        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/login", parameters: params ,requestSerializer: JSONParameterSerializer()){
//            response in
//            if let err = response.error{
//                print("error: \(err.localizedDescription)")
//                return false
//            }
//            let jsondata = JSON(response.data)
//            let errNodata = jsondata.dictionaryValue["errNo"]
//            print (errNodata)
//            if(errNodata == 504)
//            {
//                print ("Yes")
//                return true
//            }else {print("No")
//                return false
//            }
//            //print(JSON(response.data).dictionary?["errNo"])
//            //print(jsondata.dictionaryValue["errNo"])
//            //print(response.text)
//
//
//            //let jsonData = try JSON(data: response.text)
//            //print(jsonData[0])
//            //如果登录失败返回失败提醒
//            //如果登录成功则判断userid进入不同界面
//
//        }
//    }
    
    @objc func anotherp() {

//        uesrname = textfield.text
//        userpassword = textfield1.text
//        print(uesrname)
//        print(userpassword)
        GlobalUserId = textfield.text!//全局变量终于！！！

        print(textfield.text ?? "")
        print(textfield1.text ?? "")

        var ifchange = 100
        let params = ["userId":textfield.text,
                      "password":textfield1.text] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/login", parameters: params ,requestSerializer: JSONParameterSerializer()){
            response in

            if let err = response.error{
                ifchange = 300
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            let errNodata = jsondata.dictionaryValue["errNo"]
            print (errNodata)
            ifchange = jsondata["errNo"].int!

        }
        //sleep(1)
        while(ifchange == 100)
        {}
        print(ifchange)

        let tparams = ["userId":GlobalUserId] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/get_inf",parameters: tparams,requestSerializer: JSONParameterSerializer()){
            response in

            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            //print(jsondata.array![0])
            //print(jsondata.dictionaryValue["gender"] as! String)
            //print(jsondata.dictionaryValue["gender"])
            GlobalGender = jsondata["gender"].string!
            //GlobalGender = jsondata.dictionaryValue["gender"]?.String
            print("GlobalGender:" + GlobalGender)
            GlobalAge = jsondata["age"].int!
            //GlobalAge = jsondata.dictionaryValue["age"] as! Int
            print("GlobalAge:"+String(GlobalAge))
        }


        var flag = 100//判断孩子id是否加载出来

        if ifchange == 203{
            GlobalIfLogin = true
            self.navigationController?.popViewController(animated: true)

        }
        else if ifchange == 504{
            let alertController = UIAlertController(title: "账户未注册!",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        else if ifchange == 501{
            let alertController = UIAlertController(title: "密码错误!",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        else {
            let alertController = UIAlertController(title: "账户或密码错误!",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
    }
//        //}
//
//    }
//
//    @objc func anotherd() {
//
////        uesrname = textfield.text
////        userpassword = textfield1.text
////        print(uesrname)
////        print(userpassword)
//
//        GlobalUserId = textfield.text!//全局变量终于！！！
//        GlobalUserType = "Doctor"
//
//        print(textfield.text ?? "")
//        print(textfield1.text ?? "")
//
//        var ifchange = 100
//        let params = ["userId":textfield.text,
//                      "password":textfield1.text] as [String : Any]
//        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/login", parameters: params ,requestSerializer: JSONParameterSerializer()){
//            response in
//            if let err = response.error{
//                ifchange=300
//                print("error: \(err.localizedDescription)")
//                return
//            }
//            let jsondata = JSON(response.data)
//            let errNodata = jsondata.dictionaryValue["errNo"]
//            print (errNodata)
//            if(errNodata == 200)
//            {
//                ifchange = 200
//                print ("Yes")
//            }else {print("No")}
//            //print(JSON(response.data).dictionary?["errNo"])
//            //print(jsondata.dictionaryValue["errNo"])
//            //print(response.text)
//
//
//            //let jsonData = try JSON(data: response.text)
//            //print(jsonData[0])
//            //如果登录失败返回失败提醒
//            //如果登录成功则判断userid进入不同界面
//
//        }
//
////        let con = UIStoryboard(name: "Main", bundle: nil)
////                .instantiateViewController(withIdentifier: "remarkboard") as UIViewController
////        self.navigationController?.pushViewController(con, animated: true)
//        sleep(1)
//        print(ifchange)
//        if ifchange == 200{
//            let con = DoctorView()
//            self.navigationController?.pushViewController(con,animated:true)
//
//        }
//        else {
//            let alertController = UIAlertController(title: "账户或密码错误!",
//                                                    message: nil, preferredStyle: .alert)
//            //显示提示框
//            self.present(alertController, animated: true, completion: nil)
//            //两秒钟后自动消失
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self.presentedViewController?.dismiss(animated: false, completion: nil)
//            }
//        }
//
//    }
//
    @objc func another1() {

        let con = RegisterView()
        self.navigationController?.pushViewController(con,animated:true)

    }

    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
            //收起键盘
            textfield.resignFirstResponder()
            //打印出文本框中的值
            print(textfield.text ?? "")
            return true
        }
    
    

}

