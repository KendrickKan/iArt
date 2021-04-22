//
//  PicView.swift
//  iArt
//
//  Created by KanDong on 2021/4/10.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class PicView: UIViewController,UITextFieldDelegate {
    
    
    //let makecomment = UITextField(frame: CGRect(x: 40, y: 800, width: 340, height: 380))
    let makecomment = UITextField(frame: CGRect(x: 30, y: 410, width: 279, height: 36))

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()
        
//        let header = UIImageView(image: UIImage(named: "header"))
//        header.frame = CGRect(x: 0, y: 0, width: 414, height: 88)
//        self.view.addSubview(header)
        let paint = UILabel(frame: CGRect(x: 185, y: 50, width: 51, height: 29))
        // Do any additional setup after loading the view.
        paint.text = "画作"
        paint.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(paint)
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "snowmoutain")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
        var showimage:UIImage? = nil
        let showimagedata = Data(base64Encoded: GlobalChoosePicbase64, options: .ignoreUnknownCharacters)
        showimage = UIImage(data: showimagedata!)
        let painter = UIImageView(image: showimage)
        painter.frame = CGRect(x: 0, y: 88, width: 414, height: 310)
        self.view.addSubview(painter)
        
        let text0 = UILabel(frame: CGRect(x: 23, y: 455, width: 94, height: 58))
        text0.text = "潜在危险倾向评价"
        text0.font = UIFont.systemFont(ofSize: 20)
        text0.numberOfLines = 0
        self.view.addSubview(text0)
        
        let text1 = UILabel(frame: CGRect(x: 23, y: 545, width: 94, height: 58))
        text1.text = "社交兴趣障碍评价"
        text1.font = UIFont.systemFont(ofSize: 20)
        text1.numberOfLines = 0
        self.view.addSubview(text1)
        
        let text2 = UILabel(frame: CGRect(x: 23, y: 635, width: 94, height: 58))
        text2.text = "心理健康综合指数"
        text2.font = UIFont.systemFont(ofSize: 20)
        text2.numberOfLines = 0
        self.view.addSubview(text2)
        
//        let sun = UIImageView(image: UIImage(named: "sunny"))
//        sun.frame = CGRect(x: 161, y: 410, width: 253, height: 283)
//        sun.backgroundColor = UIColor.white
//        sun.tintColor = UIColor.blue
//        self.view.addSubview(sun)
        //判断三个指标然后展示
        var mental = -1
        var social = -1
        var potential = -1
        let params = ["Pic_ID" : GlobalChoosePic] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/Pic/searchDatas",parameters: params,requestSerializer: JSONParameterSerializer())
            {
            response in
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            mental = jsondata["MentalHealth"].int!
            social = jsondata["SocialInterest"].int!
            potential = jsondata["PotentialDanger"].int!
        }
        while mental == -1 || social == -1 || potential == -1 {}
        
        printsun(x: 0, num: mental)//0,1,2分别代表第一个第二个第三个指标
        printsun(x: 1, num: social)
        printsun(x: 2, num: potential)
        
        
        
        
        makecomment.borderStyle = .roundedRect
        makecomment.placeholder = "请输回复"
        makecomment.textColor = UIColor.gray
        makecomment.layer.cornerRadius = 5
        makecomment.layer.masksToBounds = true
        makecomment.clearButtonMode = .always
        makecomment.keyboardType = UIKeyboardType.default
        makecomment.returnKeyType = UIReturnKeyType.done
        makecomment.delegate = self

        self.view.addSubview(makecomment)
        
        let sendBtn = UIButton(frame: CGRect(x: 330, y: 410, width: 60, height: 36))
        sendBtn.backgroundColor = UIColor.systemBlue
        sendBtn.setTitle("发送", for: .normal)
        sendBtn.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
        sendBtn.layer.cornerRadius = 5
        sendBtn.layer.masksToBounds = true
        self.view.addSubview(sendBtn)
        sendBtn.addTarget(self, action: #selector(sendcomment), for: .touchUpInside)
        
        
        let RecentlyReply = UILabel(frame: CGRect(x: 23, y: 725, width: 94, height: 58))
        if GlobalUserType == "Parent"{
            RecentlyReply.text = "    医生    最新回复"
        }
        else {
            RecentlyReply.text = "    家长    最新回复"}
        RecentlyReply.font = UIFont.systemFont(ofSize: 20)
        RecentlyReply.numberOfLines = 0
        self.view.addSubview(RecentlyReply)
        
        
        var commenterr = 100
        var commentstr = "0"
        let commentparams = ["Pic_ID" : GlobalChoosePic] as [String : Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/viewDia",parameters: commentparams,requestSerializer: JSONParameterSerializer())
            {
            response in
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            commenterr = jsondata["errNo"].int!
            if GlobalUserType == "Parent"
            {
                commentstr = jsondata["Doctor"].string!
            }
            else
            {
                commentstr = jsondata["Parent"].string!
            }
        }
        while commenterr == 100 || commentstr == "0"{}
        
        let RecentlyReplyData = UILabel(frame: CGRect(x: 140, y: 725, width: 215, height: 58))
        RecentlyReplyData.text = commentstr
        RecentlyReplyData.font = UIFont.systemFont(ofSize: 20)
        RecentlyReplyData.numberOfLines = 0
        self.view.addSubview(RecentlyReplyData)
    }
    

    @objc func sendcomment(){
        //这里写发送评论的交互
        var ifchange = 100
        if GlobalUserType == "Parent"{
            let params = ["Pic_ID" : GlobalChoosePic,"P_Message" : makecomment.text] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/addParDia",parameters: params,requestSerializer: JSONParameterSerializer())
                {
                response in
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                ifchange = 200
            }
        }
        else{
            let params = ["Pic_ID" : GlobalChoosePic,"D_Message" : makecomment.text] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/addDocDia",parameters: params,requestSerializer: JSONParameterSerializer())
                {
                response in
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                ifchange = 200
            }
        }
        //然后就刷新comment label
        while ifchange == 100{
        }
        if ifchange == 200{
            let alertController = UIAlertController(title: "回复成功，对方已收到最新回复",message: nil, preferredStyle: .alert)
                            //显示提示框
            self.present(alertController, animated: true, completion: nil)
                            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    }
        }
        else{
            let alertController = UIAlertController(title: "回复失败",message: nil, preferredStyle: .alert)
                            //显示提示框
            self.present(alertController, animated: true, completion: nil)
                            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                    }
        }
        
    }
    
    func textFieldShouldReturn(_ textfield: UITextField) -> Bool {
            //收起键盘
            textfield.resignFirstResponder()
            //打印出文本框中的值
            print(textfield.text ?? "")
            return true
        }
    
    @objc func printsun(x: Int , num: Int){
        
        for idx in stride(from: 0, to: num, by: 1) {
            let sun = UIImageView(image: UIImage(named: "lightsun"))
            sun.frame = CGRect(x: -100 + idx*50, y: 260 + x*90, width: 500, height: 450)
            self.view.addSubview(sun)
        }
        
        
        for idx in stride(from: 0, to: 5-num, by: 1) {
            let sun = UIImageView(image: UIImage(named: "darksun"))
            sun.frame = CGRect(x: -100 + idx*50 + num*50, y: 260 + x*90, width: 500, height: 450)
            self.view.addSubview(sun)
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
