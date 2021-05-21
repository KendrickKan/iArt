//
//  ViewController.swift
//  iArt
//
//  Created by mac on 2021/1/12.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class ViewController: UIViewController,UITextFieldDelegate{
//class ViewController: UIViewController{


    var uesrname:String? = nil
    var userpassword:String? = nil
    let textfield = UITextField(frame: CGRect(x: 60, y: 400, width: 300, height: 50))
    let textfield1=UITextField(frame: CGRect(x: 60, y: 470, width: 300, height: 50))
    
    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue 
//        Thread.sleep(forTimeInterval: 0)
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
//        let logo = UIImageView(image: UIImage(named: "115"))
//        logo.frame = CGRect(x:150 , y :220, width: 100,height: 100)
//        logo.layer.cornerRadius = logo.frame.size.width/2
//        logo.layer.masksToBounds = true
//        self.view.addSubview(logo)
        
        let title = UILabel(frame: CGRect(x: 40, y: 300, width: 340, height: 18))
        title.text="没有一个孩子，会成为一座孤岛"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize:16)
        title.textColor = UIColor.lightGray

        self.view.addSubview(title)
        //let textfield = UITextField(frame: CGRect(x: 40, y: 440, width: 340, height: 38))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "电话号码"
        textfield.textAlignment = .center
        textfield.textColor = UIColor.gray
        textfield.backgroundColor = UIColor.clear
        textfield.layer.borderWidth = 2.0
        textfield.layer.borderColor = UIColor.white.cgColor
        textfield.layer.cornerRadius = 25
        textfield.layer.masksToBounds = true
        textfield.clearButtonMode = .always
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.delegate = self

        self.view.addSubview(textfield)

        //let textfield1=UITextField(frame: CGRect(x: 40, y: 510, width: 340, height: 38))
        textfield1.borderStyle = .roundedRect
        textfield1.placeholder = "密码"
        textfield1.textAlignment = .center
        textfield1.textColor = UIColor.gray
        textfield1.backgroundColor = UIColor.clear
        textfield1.layer.borderWidth = 2.0
        textfield1.layer.borderColor = UIColor.white.cgColor
        textfield1.layer.cornerRadius = 25
        textfield1.layer.masksToBounds = true
        textfield1.clearButtonMode = .always
        textfield1.isSecureTextEntry = true
        textfield1.keyboardType = UIKeyboardType.default
        textfield1.returnKeyType = UIReturnKeyType.done
        textfield1.delegate = self
        
        self.view.addSubview(textfield1)

        let loginbuttonp = UIButton(frame: CGRect(x: 60, y: 540, width: 300, height: 50))
        loginbuttonp.backgroundColor = UIColor(red: 173/255, green: 212/255,blue: 209/255, alpha: 1)
        loginbuttonp.setTitle("登陆", for: .normal)
        loginbuttonp.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        loginbuttonp.layer.cornerRadius = 25
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
        
        
        let registerbutton = UIButton(frame: CGRect(x: 60, y: 600, width: 300, height: 38))
        registerbutton.backgroundColor = UIColor.clear
        registerbutton.setTitle("账户注册 | 找回密码", for: .normal)
        registerbutton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 16)
        registerbutton.setTitleColor(UIColor.lightGray, for: .normal)
        registerbutton.layer.cornerRadius = 5
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
        GlobalUserType = "Parent"
        
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
//            if(errNodata == 204)
//            {
//                ifchange = 204
//                print ("Yes")
//            }else {print("No")}
            
            //print(JSON(response.data).dictionary?["errNo"])
            //print(jsondata.dictionaryValue["errNo"])
            //print(response.text)
            
            
            //let jsonData = try JSON(data: response.text)
            //print(jsonData[0])
            //如果登录失败返回失败提醒
            //如果登录成功则判断userid进入不同界面
            
        }
        //sleep(1)
        while(ifchange == 100)
        {}
        //sleep_type_t(0.5)
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "remarkboard") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
        print(ifchange)
        //if ifchange == 200{
//        if textfield.text == "17382350689"{
//            let con = ChildrenView()
//            self.navigationController?.pushViewController(con,animated:true)
//        }
//        else if textfield.text == "15251836927"{
//            let con = DoctorView()
//            self.navigationController?.pushViewController(con,animated:true)
//        }
//        else {
        if (ifchange == 204 || ifchange == 205){
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
            
        }
        
        
        var flag = 100//判断孩子id是否加载出来
        
        if ifchange == 204{
            
            
            let ttparams = ["userId":GlobalUserId] as [String:Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/c_p_dmap/get_binding_P",parameters: ttparams,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                GlobalBandPorDID = jsondata["doctorUserId"].string!
                //GlobalBandPorDID = jsondata.dictionaryValue["doctorUserId"] as! String
                print("GlobalBandPorDID:"+GlobalBandPorDID)
                GlobalBandChildID = jsondata["childUserId"].string!
                //GlobalBandChildID = jsondata.dictionaryValue["childUserId"] as! String
                print("GlobalBandChildID:"+GlobalBandChildID)
                flag = 200
            }
            
            
            GlobalUserType = "Parent"
            
            while flag == 100 {

            }
            
            //usleep(500000)
            let con = DoctorView()
            self.navigationController?.pushViewController(con,animated:true)
            
        }
        else if ifchange == 205{
            
            
            let ttparams = ["userId":GlobalUserId] as [String:Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/c_p_dmap/get_binding_D",parameters: ttparams,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                GlobalBandPorDID = jsondata["parentUserId"].string!
                //GlobalBandPorDID = jsondata.dictionaryValue["parentUserId"] as! String
                print("GlobalBandPorDID:"+GlobalBandPorDID)
                GlobalBandChildID = jsondata["childUserId"].string!
                //GlobalBandChildID = jsondata.dictionaryValue["childUserId"] as! String
                print("GlobalBandChildID:"+GlobalBandChildID)
                
                flag = 200
            }
            
            
            GlobalUserType = "Doctor"
            
            while flag == 100 {

            }
            
            //usleep(500000)
            
            let con = DoctorView()
            self.navigationController?.pushViewController(con,animated:true)
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
//        }
        //}
        
    }
    
    @objc func anotherd() {
        
//        uesrname = textfield.text
//        userpassword = textfield1.text
//        print(uesrname)
//        print(userpassword)
        
        GlobalUserId = textfield.text!//全局变量终于！！！
        GlobalUserType = "Doctor"
        
        print(textfield.text ?? "")
        print(textfield1.text ?? "")
        
        var ifchange = 100
        let params = ["userId":textfield.text,
                      "password":textfield1.text] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/login", parameters: params ,requestSerializer: JSONParameterSerializer()){
            response in
            if let err = response.error{
                ifchange=300
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            let errNodata = jsondata.dictionaryValue["errNo"]
            print (errNodata)
            if(errNodata == 200)
            {
                ifchange = 200
                print ("Yes")
            }else {print("No")}
            //print(JSON(response.data).dictionary?["errNo"])
            //print(jsondata.dictionaryValue["errNo"])
            //print(response.text)
            
            
            //let jsonData = try JSON(data: response.text)
            //print(jsonData[0])
            //如果登录失败返回失败提醒
            //如果登录成功则判断userid进入不同界面
            
        }
        
//        let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "remarkboard") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
        sleep(1)
        print(ifchange)
        if ifchange == 200{
            let con = DoctorView()
            self.navigationController?.pushViewController(con,animated:true)
            
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
    
    @objc func another1() {
        
        let con = RegisterFile()
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

