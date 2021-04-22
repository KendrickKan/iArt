//
//  AboutMeView.swift
//  iArt
//
//  Created by KanDong on 2021/4/13.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class AboutMeView: UIViewController, UITextFieldDelegate {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
//        Thread.sleep(forTimeInterval: 0)
        super.viewDidLoad()
        
//        let backbuttom = UIButton(frame: CGRect(x: 10, y: 30, width: 40, height: 30))
//        //loginbuttonp.backgroundColor = UIColor.systemRed
//        backbuttom.setTitle("返回", for: .normal)
//        backbuttom.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
//        //backbuttom.layer.cornerRadius = 22
//        backbuttom.layer.masksToBounds = true
//        self.view.addSubview(backbuttom)
//        backbuttom.addTarget(self, action: #selector(anotherback), for: .touchUpInside)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "snowmoutain")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
                let logo = UIImageView(image: UIImage(named: "115"))
                logo.frame = CGRect(x:270 , y :130, width: 200,height: 200)
                logo.layer.cornerRadius = logo.frame.size.width/2
                logo.layer.masksToBounds = true
                self.view.addSubview(logo)
        
        
//        let params = ["userId":GlobalUserId] as [String : Any]
//        HTTP.POST("http://121.41.14.201:8080/iArt/logininterface/get_inf",parameters: params,requestSerializer: JSONParameterSerializer()){
//            response in
//
//            if let err = response.error{
//                print("error: \(err.localizedDescription)")
//                return
//            }
//            let jsondata = JSON(response.data)
//            //print(jsondata.array![0])
//            //print(jsondata.dictionaryValue["gender"] as! String)
//            //print(jsondata.dictionaryValue["gender"])
//            GlobalGender = jsondata["gender"].string!
//            //GlobalGender = jsondata.dictionaryValue["gender"]?.String
//            print("GlobalGender:" + GlobalGender)
//            GlobalAge = jsondata["age"].int!
//            //GlobalAge = jsondata.dictionaryValue["age"] as! Int
//            print("GlobalAge:"+String(GlobalAge))
//        }
        
//        if GlobalUserType == "Parent"
//        {
//            let params = ["userId":GlobalUserId] as [String:Any]
//            HTTP.POST("http://121.41.14.201:8080/iArt/c_p_dmap/get_binding_P",parameters: params,requestSerializer: JSONParameterSerializer()){
//                response in
//
//                if let err = response.error{
//                    print("error: \(err.localizedDescription)")
//                    return
//                }
//                let jsondata = JSON(response.data)
//                GlobalBandPorDID = jsondata["doctorUserId"].string!
//                //GlobalBandPorDID = jsondata.dictionaryValue["doctorUserId"] as! String
//                print("GlobalBandPorDID:"+GlobalBandPorDID)
//                GlobalBandChildID = jsondata["childUserId"].string!
//                //GlobalBandChildID = jsondata.dictionaryValue["childUserId"] as! String
//                print("GlobalBandChildID:"+GlobalBandChildID)
//            }
//
//        }
//        else{
//            let params = ["userId":GlobalUserId] as [String:Any]
//            HTTP.POST("http://121.41.14.201:8080/iArt/c_p_dmap/get_binding_D",parameters: params,requestSerializer: JSONParameterSerializer()){
//                response in
//
//                if let err = response.error{
//                    print("error: \(err.localizedDescription)")
//                    return
//                }
//                let jsondata = JSON(response.data)
//                GlobalBandPorDID = jsondata["parentUserId"].string!
//                //GlobalBandPorDID = jsondata.dictionaryValue["parentUserId"] as! String
//                print("GlobalBandPorDID:"+GlobalBandPorDID)
//                GlobalBandChildID = jsondata["childUserId"].string!
//                //GlobalBandChildID = jsondata.dictionaryValue["childUserId"] as! String
//                print("GlobalBandChildID:"+GlobalBandChildID)
//            }
//        }
//
//        sleep(1)
        
        
        
        
        let idtextfield = UITextField(frame: CGRect(x: 250, y: 400, width: 250, height: 38))
        idtextfield.borderStyle = .roundedRect
        idtextfield.placeholder = "用户ID:"+GlobalUserId
        idtextfield.textColor = UIColor.gray
        idtextfield.layer.cornerRadius = 5
        idtextfield.layer.masksToBounds = true
        idtextfield.clearButtonMode = .always
        idtextfield.keyboardType = UIKeyboardType.default
        idtextfield.returnKeyType = UIReturnKeyType.done
        idtextfield.delegate = self

        self.view.addSubview(idtextfield)
        
        
        let typetextfield = UITextField(frame: CGRect(x: 250, y: 470, width: 250, height: 38))
        typetextfield.borderStyle = .roundedRect
        typetextfield.placeholder = "用户类型:"+GlobalUserType
        typetextfield.textColor = UIColor.gray
        typetextfield.layer.cornerRadius = 5
        typetextfield.layer.masksToBounds = true
        typetextfield.clearButtonMode = .always
        typetextfield.keyboardType = UIKeyboardType.default
        typetextfield.returnKeyType = UIReturnKeyType.done
        typetextfield.delegate = self

        self.view.addSubview(typetextfield)
        
        let gendertextfield = UITextField(frame: CGRect(x: 250, y: 540, width: 250, height: 38))
        gendertextfield.borderStyle = .roundedRect
        gendertextfield.placeholder = "性别:"+GlobalGender
        gendertextfield.textColor = UIColor.gray
        gendertextfield.layer.cornerRadius = 5
        gendertextfield.layer.masksToBounds = true
        gendertextfield.clearButtonMode = .always
        gendertextfield.keyboardType = UIKeyboardType.default
        gendertextfield.returnKeyType = UIReturnKeyType.done
        gendertextfield.delegate = self

        self.view.addSubview(gendertextfield)
        
        let agetextfield = UITextField(frame: CGRect(x: 250, y: 610, width: 250, height: 38))
        agetextfield.borderStyle = .roundedRect
        agetextfield.placeholder = "年龄:"+String(GlobalAge)
        agetextfield.textColor = UIColor.gray
        agetextfield.layer.cornerRadius = 5
        agetextfield.layer.masksToBounds = true
        agetextfield.clearButtonMode = .always
        agetextfield.keyboardType = UIKeyboardType.default
        agetextfield.returnKeyType = UIReturnKeyType.done
        agetextfield.delegate = self

        self.view.addSubview(agetextfield)
        
        
        
        //base64转换
//        let image = UIImage(named:"115")
//
//        let imageData = image?.jpegData(compressionQuality: 1)
//
//        //let imageData = image?.pngData()
//
//        let base64String = imageData?.base64EncodedString()
//
//        let showimagedata = Data(base64Encoded: base64String!, options: .ignoreUnknownCharacters)
//
//
//        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        //backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
//
//        backgroundImage.image = UIImage(data : showimagedata!)
//
//        self.view.insertSubview(backgroundImage, at : 100)
//
//        print(base64String)
        
        // Do any additional setup after loading the view.
    }
    

    @objc func anotherback() {

        self.navigationController?.popViewController(animated: true)

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
