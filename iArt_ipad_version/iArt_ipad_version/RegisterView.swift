//
//  RegisterFile.swift
//  iArt
//
//  Created by kandong on 2021/4/7.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class RegisterView: UIViewController,UITextFieldDelegate {
    
    
    
    
    let textfield = UITextField(frame: CGRect(x: 190, y: 180, width: 340, height: 38))
    let textfield1 = UITextField(frame: CGRect(x: 190, y: 250, width: 340, height: 38))
//    let textfield2 = UITextField(frame: CGRect(x: 40, y: 300, width: 340, height: 38))
    let textfield5 = UITextField(frame: CGRect(x: 190, y: 320, width: 340, height: 38))
    let textfield6 = UITextField(frame: CGRect(x: 190, y: 390, width: 340, height: 38))
    let textfield3 = UITextField(frame: CGRect(x: 190, y: 460, width: 340, height: 38))
    let textfield4 = UITextField(frame: CGRect(x: 190, y: 530, width: 340, height: 38))

    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
//        Thread.sleep(forTimeInterval: 0)
        super.viewDidLoad()
        
        //self.view.backgroundColor = UIColor(patternImage: <#T##UIImage#>(named:"background"))
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "loginipad")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
        // Do any additional setup after loading the view.
        let title = UILabel(frame: CGRect(x: 180, y: 110, width: 340, height: 18))
        title.text="请在下框注册的账户"
        title.textAlignment = .center
        title.font = UIFont.systemFont(ofSize:18)
        title.textColor = UIColor.white

        self.view.addSubview(title)
        
        //let textfield = UITextField(frame: CGRect(x: 40, y: 180, width: 340, height: 38))
        textfield.borderStyle = .roundedRect
        textfield.placeholder = "电话号码"
        textfield.textColor = UIColor.gray
        textfield.layer.cornerRadius = 19
        textfield.layer.masksToBounds = true
        textfield.clearButtonMode = .always
        textfield.keyboardType = UIKeyboardType.default
        textfield.returnKeyType = UIReturnKeyType.done
        textfield.delegate = self

        self.view.addSubview(textfield)
//        let textfield1=UITextField(frame: CGRect(x: 40, y: 230, width: 340, height: 38))
        
        textfield1.borderStyle = .roundedRect
        textfield1.placeholder = "用户名"
        textfield1.textColor = UIColor.gray
        textfield1.layer.cornerRadius = 19
        textfield1.layer.masksToBounds = true
        textfield1.clearButtonMode = .always
        //textfield1.isSecureTextEntry = true
        textfield1.keyboardType = UIKeyboardType.default
        textfield1.returnKeyType = UIReturnKeyType.done
        textfield1.delegate = self
        
        self.view.addSubview(textfield1)
        
        
//        let textfield2=UITextField(frame: CGRect(x: 40, y: 280, width: 340, height: 38))
        
//        textfield2.borderStyle = .roundedRect
//        textfield2.placeholder = "请输入你的身份1为孩子2为家长3为医生"
//        textfield2.textColor = UIColor.gray
//        textfield2.layer.cornerRadius = 5
//        textfield2.layer.masksToBounds = true
//        textfield2.clearButtonMode = .always
//        //textfield1.isSecureTextEntry = true
//        textfield2.keyboardType = UIKeyboardType.default
//        textfield2.returnKeyType = UIReturnKeyType.done
//        textfield2.delegate = self
//
//        self.view.addSubview(textfield2)
        
        
//        let textfield5=UITextField(frame: CGRect(x: 40, y: 330, width: 340, height: 38))
        
        textfield5.borderStyle = .roundedRect
        textfield5.placeholder = "请输入年龄"
        textfield5.textColor = UIColor.gray
        textfield5.layer.cornerRadius = 19
        textfield5.layer.masksToBounds = true
        textfield5.clearButtonMode = .always
        //textfield1.isSecureTextEntry = true
        textfield5.keyboardType = UIKeyboardType.default
        textfield5.returnKeyType = UIReturnKeyType.done
        textfield5.delegate = self
        
        self.view.addSubview(textfield5)
        
        
//        let textfield6=UITextField(frame: CGRect(x: 40, y: 380, width: 340, height: 38))
        
        textfield6.borderStyle = .roundedRect
        textfield6.placeholder = "请输入性别1为男，2为女"
        textfield6.textColor = UIColor.gray
        textfield6.layer.cornerRadius = 19
        textfield6.layer.masksToBounds = true
        textfield6.clearButtonMode = .always
        //textfield1.isSecureTextEntry = true
        textfield6.keyboardType = UIKeyboardType.default
        textfield6.returnKeyType = UIReturnKeyType.done
        textfield6.delegate = self
        
        self.view.addSubview(textfield6)
        
        
        
        //let textfield3=UITextField(frame: CGRect(x: 40, y: 400, width: 340, height: 38))
        
        textfield3.borderStyle = .roundedRect
        textfield3.placeholder = "请输入密码"
        textfield3.textColor = UIColor.gray
        textfield3.layer.cornerRadius = 19
        textfield3.layer.masksToBounds = true
        textfield3.clearButtonMode = .always
        textfield3.isSecureTextEntry = true
        textfield3.keyboardType = UIKeyboardType.default
        textfield3.returnKeyType = UIReturnKeyType.done
        textfield3.delegate = self
        
        self.view.addSubview(textfield3)
        
        
        //let textfield4=UITextField(frame: CGRect(x: 40, y: 450, width: 340, height: 38))
        
        textfield4.borderStyle = .roundedRect
        textfield4.placeholder = "请再次确认密码"
        textfield4.textColor = UIColor.gray
        textfield4.layer.cornerRadius = 19
        textfield4.layer.masksToBounds = true
        textfield4.clearButtonMode = .always
        textfield4.isSecureTextEntry = true
        textfield4.keyboardType = UIKeyboardType.default
        textfield4.returnKeyType = UIReturnKeyType.done
        textfield4.delegate = self
        
        self.view.addSubview(textfield4)
        
        let registerbutton = UIButton(frame: CGRect(x: 275, y: 620, width: 170, height: 38))
        registerbutton.backgroundColor = UIColor.systemRed
        registerbutton.setTitle("注册", for: .normal)
        registerbutton.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)

        registerbutton.layer.cornerRadius = 19
        registerbutton.layer.masksToBounds = true
        self.view.addSubview(registerbutton)
        
        registerbutton.addTarget(self, action: #selector(another), for: .touchUpInside)

        // Do any additional setup after loading the view.
    }
    
    @objc func another() {
        
        if textfield.text?.count != 11 || textfield1.text == nil  || textfield3.text == nil || textfield4.text == nil || textfield5.text == nil || (textfield6.text != "1" && textfield6.text != "2" ){
        
            let alertController = UIAlertController(title: "请确保以上内容不为空且合法!",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        
        else if textfield3.text != textfield4.text {
            
            
            let alertController = UIAlertController(title: "两次密码输入不同!",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        
        //判断是否注册成功如果是 跳回登录页面
        
        
        else{
            
            var ifchange = 100
            //let id = textfield.text
//            var usetype = "Child"
            var usesex = "male"
            if textfield6.text == "2"{
                usesex = "female"
            }
            
            let params = ["userType":"Child",
                          "userId":textfield.text,
                          "userName":textfield1.text,
                          "password":textfield3.text,
                          "gender":usesex,
                          "age":textfield5.text] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/regist", parameters: params ,requestSerializer: JSONParameterSerializer()){
                response in
                if let err = response.error{
                    ifchange = 300
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let errNodata = jsondata.dictionaryValue["errNo"]
                if(errNodata == 200)
                {
                    ifchange = 200
                }
//                {
//                    let alertController = UIAlertController(title: "注册成功，请返回登录",
//                                                            message: nil, preferredStyle: .alert)
//                    //显示提示框
//                    self.present(alertController, animated: true, completion: nil)
//                    //两秒钟后自动消失
//                    DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                        self.presentedViewController?.dismiss(animated: false, completion: nil)}
//                }
//                else{
//                }
                print("opt finished: \(response.description)")
                }
            sleep(1)
            if ifchange == 100{
                let alertController = UIAlertController(title: "注册失败",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    }
            }
            else if ifchange == 300
            {
                let alertController = UIAlertController(title: "账户已被注册",message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    }
            }
            else{
//                let alertController = UIAlertController(title: "注册成功，请返回登录",message: nil, preferredStyle: .alert)
//                                //显示提示框
//                self.present(alertController, animated: true, completion: nil)
//                                //两秒钟后自动消失
//                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                        self.presentedViewController?.dismiss(animated: false, completion: nil)
//                        }
                self.navigationController?.popViewController(animated: true)
            }
                    
                
            
            
//            let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "view") as UIViewController
//        self.navigationController?.pushViewController(con, animated: true)
            
        }
    }
    
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
            //收起键盘
            textfield.resignFirstResponder()
            //打印出文本框中的值
            print(textfield.text ?? "")
            return true
        }

}
