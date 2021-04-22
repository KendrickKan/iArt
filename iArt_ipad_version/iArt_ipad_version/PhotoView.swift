//
//  ChildrenView.swift
//  iArt
//
//  Created by KanDong on 2021/4/10.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class PhotoView: UIViewController {
    
    

    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
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
        
        
        let newdrawer = UIImageView(image: UIImage(named: "lanterm"))
        
        newdrawer.frame = CGRect(x: 8, y: 100, width: 28, height: 28)
        newdrawer.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        //newdrawer.backgroundColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        self.view.addSubview(newdrawer)//黄色图标
        
        let title = UILabel(frame: CGRect(x: 40, y: 105, width: 200, height: 20))
        title.text = "我的画!"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = UIColor.systemBlue
        self.view.addSubview(title)
        
        var picnum = -1
        
        let picidgetparams = ["childID":GlobalUserId] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picIDget",parameters: picidgetparams,requestSerializer: JSONParameterSerializer()){
            response in
            
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            picnum = jsondata["errMessage"].array!.count
            //while picnum == -1{}
            //if picnum == 1
            //{
                GlobalPicID0 = jsondata["errMessage"][0].int!
            //}
            //else if picnum == 2{
                GlobalPicID0 = jsondata["errMessage"][0].int!
                GlobalPicID1 = jsondata["errMessage"][1].int!
            //}
            //else if picnum == 3{
                GlobalPicID0 = jsondata["errMessage"][0].int!
                GlobalPicID1 = jsondata["errMessage"][1].int!
                GlobalPicID2 = jsondata["errMessage"][picnum-1].int!
            //}
        }
        
        
        while picnum == -1 {
        }
        if picnum == 1{
            while GlobalPicID0 == 0{}
        }
        else if picnum == 2{
            while GlobalPicID0 == 0||GlobalPicID1 == 0{}
        }
        else{
            while GlobalPicID0 == 0||GlobalPicID1 == 0||GlobalPicID2 == 0{}
        }
        
        print(picnum)
        print(GlobalPicID0)
        print(GlobalPicID1)
        print(GlobalPicID2)
        
        //var base64String:String? = nil
        var showimage1:UIImage? = nil
        var showimage2:UIImage? = nil
        var showimage3:UIImage? = nil
        //获取图片
        if picnum == 1{
            
            let params = ["picID":GlobalPicID0] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID0base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage1 = UIImage(data: showimagedata!)
            }
            
            
            while showimage1 == nil {
            }
        }
        else if picnum == 2{
            
            let params = ["picID":GlobalPicID0] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID0base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage1 = UIImage(data: showimagedata!)
            }
            
            let params1 = ["picID":GlobalPicID1] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params1,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID1base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage2 = UIImage(data: showimagedata!)
            }
            
            
            while showimage1 == nil || showimage2 == nil {
            }
        }
        else{
            
            let params = ["picID":GlobalPicID0] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID0base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage1 = UIImage(data: showimagedata!)
            }
            
            let params1 = ["picID":GlobalPicID1] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params1,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID1base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage2 = UIImage(data: showimagedata!)
            }
            
            let params3 = ["picID":GlobalPicID2] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picget",parameters: params3,requestSerializer: JSONParameterSerializer()){
                response in
                
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                let base64str = jsondata["imagebase64"].string!
                GlobalPicID2base64 = base64str
                //let errNodata = jsondata.dictionaryValue["errmessahe"] as! String
                let showimagedata = Data(base64Encoded: base64str, options: .ignoreUnknownCharacters)
                showimage3 = UIImage(data: showimagedata!)
            }
            
            while showimage1 == nil || showimage2 == nil || showimage3 == nil {
            }
        }
        //sleep(1)
        
        
        
        
        
        
        
        
        let picBtn = UIButton(frame: CGRect(x:107,y:140,width: 550,height: 270))
        //let picBtn = UIButton(frame: UIScreen.)
        //picBtn.setBackgroundImage(UIImage(named: "draw1"), for: UIControl.State.normal)
        picBtn.setBackgroundImage(showimage1, for: UIControl.State.normal)
        picBtn.layer.masksToBounds = true
        picBtn.layer.cornerRadius = 19
        self.view.addSubview(picBtn)
        //picBtn.addTarget(self, action: #selector(turnToPicView1), for: .touchUpInside)
        
        
        let picBtn2 = UIButton(frame: CGRect(x:107,y:430,width: 550,height: 270))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn2.setBackgroundImage(showimage2, for: UIControl.State.normal)
        picBtn2.layer.masksToBounds = true
        picBtn2.layer.cornerRadius = 19
        self.view.addSubview(picBtn2)
        //picBtn2.addTarget(self, action: #selector(turnToPicView2), for: .touchUpInside)
        
        let picBtn3 = UIButton(frame: CGRect(x:107,y:720,width: 550,height: 270))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn3.setBackgroundImage(showimage3, for: UIControl.State.normal)
        picBtn3.layer.masksToBounds = true
        picBtn3.layer.cornerRadius = 19
        self.view.addSubview(picBtn3)
        //picBtn3.addTarget(self, action: #selector(turnToPicView3), for: .touchUpInside)
        
        
        
//        let aboutBtn = UIButton(frame: CGRect(x:335,y:60,width: 50,height: 50))
//        //let picBtn = UIButton(frame: UIScreen.)
//        aboutBtn.setBackgroundImage(UIImage(named: "aboutme"), for: UIControl.State.normal)
//        aboutBtn.layer.masksToBounds = true
//        aboutBtn.layer.cornerRadius = 25
//        self.view.addSubview(aboutBtn)
        //aboutBtn.addTarget(self, action: #selector(turnToAboutMe), for: .touchUpInside)
        
        
        
        // Do any additional setup after loading the view.
    }
    
//    @objc func turnToAboutMe(){
//
//
//        let con = AboutMeView()
//        self.navigationController?.pushViewController(con, animated: true)
//
//    }
//
//
//    @objc func turnToPicView1(){
//
//        GlobalChoosePic = GlobalPicID0
//        GlobalChoosePicbase64 = GlobalPicID0base64
//        //这要记得将pic参数改一改
//
//        let con = PicView()
//        self.navigationController?.pushViewController(con, animated: true)
//    }
//    @objc func turnToPicView2(){
//
//        GlobalChoosePic = GlobalPicID1
//        GlobalChoosePicbase64 = GlobalPicID1base64
//        //这要记得将pic参数改一改
//
//        let con = PicView()
//        self.navigationController?.pushViewController(con, animated: true)
//    }
//    @objc func turnToPicView3(){
//
//        GlobalChoosePic = GlobalPicID2
//        GlobalChoosePicbase64 = GlobalPicID2base64
//        //这要记得将pic参数改一改
//
//        let con = PicView()
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

    @objc func anotherback() {

        self.navigationController?.popViewController(animated: true)

    }
    
}
