//
//  CommunityView.swift
//  iArt_ipad_version
//
//  Created by KanDong on 2021/4/16.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class CommunityView: UIViewController,UITextFieldDelegate {
    
    let loadcomment = UITextField(frame: CGRect(x: 32, y: 890, width: 700, height: 50))
    let loadcommentback = UITextField(frame: CGRect(x: 32, y: 960, width: 650, height: 50))
    
    //let sendBtn = UIButton(frame: CGRect(x: 686, y: 965, width: 44, height: 36))

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("进入 社区")

        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "loginipad")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        
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
            
            GlobalCommuityPic = jsondata["errMessage"][picnum-1].int!
            print("get GlobalCommuityPic")
            
        }
        
        while GlobalCommuityPic == 0{}
        
        var showimage1:UIImage? = nil
        let params = ["picID":GlobalCommuityPic] as [String : Any]
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
            print("get GlobalCommuityPic  image")
        }
        
        
        while showimage1 == nil {
        }
        
        let picBtn = UIButton(frame: CGRect(x:32,y:65,width: 700,height: 800))
        //let picBtn = UIButton(frame: UIScreen.)
        //picBtn.setBackgroundImage(UIImage(named: "draw1"), for: UIControl.State.normal)
        picBtn.setBackgroundImage(showimage1, for: UIControl.State.normal)
        picBtn.layer.masksToBounds = true
        picBtn.layer.cornerRadius = 19
        self.view.addSubview(picBtn)
        
        
        var viewchildcommnet = "000"
        let viewchildcommnetparams = ["Pic_ID":GlobalCommuityPic]
        HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/viewChildMoments",parameters: viewchildcommnetparams,requestSerializer: JSONParameterSerializer()){
            response in
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            viewchildcommnet = jsondata["Child"].string!
        }
        while viewchildcommnet == "000" {
        }
        
       // let loadcomment = UITextField(frame: CGRect(x: 32, y: 890, width: 700, height: 50))
        loadcomment.borderStyle = .roundedRect
        loadcomment.placeholder = "社区最新留言：" + viewchildcommnet
        loadcomment.layer.cornerRadius = 22
        //loadcomment.placeholder =
        loadcomment.textColor = UIColor.black
        loadcomment.layer.masksToBounds = true
        loadcomment.clearButtonMode = .always
        loadcomment.keyboardType = UIKeyboardType.default
        loadcomment.returnKeyType = UIReturnKeyType.done
        loadcomment.delegate = self

        self.view.addSubview(loadcomment)
        
        //let loadcommentback = UITextField(frame: CGRect(x: 32, y: 960, width: 650, height: 50))
        loadcommentback.borderStyle = .roundedRect
        loadcommentback.placeholder = "（请输入你的回复吧）"
        loadcommentback.layer.cornerRadius = 22
        //loadcomment.placeholder =
        loadcommentback.textColor = UIColor.black
        loadcommentback.layer.masksToBounds = true
        loadcommentback.clearButtonMode = .always
        loadcommentback.keyboardType = UIKeyboardType.default
        loadcommentback.returnKeyType = UIReturnKeyType.done
        loadcommentback.delegate = self

        self.view.addSubview(loadcommentback)
        
        
        let sendBtn = UIButton(frame: CGRect(x: 686, y: 965, width: 44, height: 36))
        sendBtn.backgroundColor = UIColor.systemBlue
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
        sendBtn.layer.cornerRadius = 15
        sendBtn.layer.masksToBounds = true
        self.view.addSubview(sendBtn)
        sendBtn.addTarget(self, action: #selector(sendcomment), for: .touchUpInside)
        
        
//        //let loadcomment = UIButton(frame: CGRect(x: 32, y: 65, width: 700, height: 820))
//        loadcomment.backgroundColor = UIColor.lightText
////        loadcomment.setBackgroundImage(UIImage(named: "pic4-3"), for: UIControl.State.normal)
//        loadcomment.setTitle("社区最新留言：你的画真好看！我想和你学学画画！（请输入你的回复吧）", for: .normal)
//        loadcomment.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
//        loadcomment.layer.cornerRadius = 37
//        loadcomment.layer.masksToBounds = true
//        self.view.addSubview(loadcomment)
        //loadpic.addTarget(self, action: #selector(anotherp), for: .touchUpInside)
        //loadkpic.addTarget(self, action: #selector(kpickImage), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func sendcomment(){
        var ifchange = false
        let params = ["Pic_ID":GlobalCommuityPic,"C_Message":loadcommentback.text] as [String:Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/addChiMoments",parameters: params,requestSerializer: JSONParameterSerializer())
            {
            response in
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            ifchange = true
        }
        while ifchange == false {
        }
        loadcomment.placeholder = "我最新回复：" + loadcommentback.text!
        self.view.addSubview(loadcomment)
        let alertController = UIAlertController(title: "回复评论成功！",
                                                message: nil, preferredStyle: .alert)
        //显示提示框
        self.present(alertController, animated: true, completion: nil)
        //两秒钟后自动消失
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.presentedViewController?.dismiss(animated: false, completion: nil)
        }
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
