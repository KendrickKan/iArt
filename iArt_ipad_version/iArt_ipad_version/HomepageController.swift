//
//  HomepageController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/12.
//

import UIKit
import SwiftHTTP
import SwiftyJSON

class HomepageController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    
    var chooseimage:UIImage? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
//        Thread.sleep(forTimeInterval: 2.0)
//        self.navigationController?.navigationBar.shadowImage=UIImage()
//        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        self.navigationController?.navigationBar.tintColor=UIColor.white
//        self.navigationController?.navigationBar.isHidden=true
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        
        
        
        
        
        drawcircle(x: -147, y: -688, r: 1063.0/2.0, red: 250, green: 153, blue: 52)
        drawcircle(x: -77, y: -136, r: 293.0/2.0, red: 254, green: 197, blue: 79)
//        drawcircle(x: 454, y: 626, r: 505.0/2.0, red: 247, green: 219, blue: 108,opacity: 0.5)
//        drawcircle(x: 275, y: 805, r: 393.0/2.0, red: 247, green: 219, blue: 108,opacity: 0.5)
        
        let loadkpic = UIButton(frame: CGRect(x: 450, y: 90, width: 74, height: 74))
//        loadkpic.backgroundColor = UIColor.systemBlue
        loadkpic.setBackgroundImage(UIImage(named: "pic4-3"), for: UIControl.State.normal)
//        loadkpic.setTitle("上传", for: .normal)
//        loadkpic.titleLabel?.font = UIFont.init(name: "AmericanTypewriter-Bold", size: 18)
        loadkpic.layer.cornerRadius = 37
        loadkpic.layer.masksToBounds = true
        self.view.addSubview(loadkpic)
        //loadpic.addTarget(self, action: #selector(anotherp), for: .touchUpInside)
        loadkpic.addTarget(self, action: #selector(kpickImage), for: .touchUpInside)
        
        
        let bear=UIImageView(image: UIImage(named: "bear"))
        bear.frame=CGRect(x: 245, y: 87, width: 134, height: 130)
        self.view.addSubview(bear)
        
        let morning=UITextView(frame: CGRect(x: 76, y: 98, width: 300, height: 50))
        morning.isEditable=false
        morning.text="你好啊！"
        morning.font=UIFont.systemFont(ofSize: 30)
        morning.backgroundColor=UIColor.clear
        self.view.addSubview(morning)

        let baby=UITextView(frame: CGRect(x: 76, y: 149, width: 150, height: 70))
        baby.isEditable=false
        baby.text="小宝贝"
        baby.font=UIFont.init(name: "AmericanTypewriter-Bold", size: 40)
        baby.backgroundColor=UIColor.clear
        self.view.addSubview(baby)
        
        let paint=UIButton(type: .system)
        paint.frame=CGRect(x: 45, y: 248, width: 678, height: 221)
        paint.backgroundColor=UIColor.init(red: 252.0/255.0, green: 196.0/255.0, blue: 98.0/255.0, alpha: 1.0)
        paint.layer.masksToBounds=true
        paint.layer.cornerRadius=30
        self.view.addSubview(paint)
        
        let history=UIButton(type: .system)
        history.frame=CGRect(x: 45, y: 498, width: 678, height: 146)
        history.backgroundColor=UIColor.init(red: 253.0/255.0, green: 139.0/255.0, blue: 123.0/255.0, alpha: 1.0)
        history.layer.masksToBounds=true
        history.layer.cornerRadius=30
        self.view.addSubview(history)
        
        let community=UIButton(type: .system)
        community.frame=CGRect(x: 45, y: 673, width: 678, height: 146)
        community.backgroundColor=UIColor.init(red: 153.0/255.0, green: 213.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        community.layer.masksToBounds=true
        community.layer.cornerRadius=30
        self.view.addSubview(community)
        
        let info=UIButton(type: .system)
        info.frame=CGRect(x: 45, y: 846, width: 678, height: 146)
        info.backgroundColor=UIColor.init(red: 230.0/255.0, green: 162.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        info.layer.masksToBounds=true
        info.layer.cornerRadius=30
        self.view.addSubview(info)
        
        let pic1=UIImageView(image: UIImage(named: "pic1-1"))
        let pic2=UIImageView(image: UIImage(named: "pic1-2"))
        let pic3=UIImageView(image: UIImage(named: "pic1-3"))
        let pic4=UIImageView(image: UIImage(named: "pic1-4"))
        let pic5=UIImageView(image: UIImage(named: "pic1-5"))
        let pic6=UIImageView(image: UIImage(named: "pic1-6"))
        pic1.frame=CGRect(x: 417, y: 199, width: 277, height: 303)
        pic2.frame=CGRect(x: 104, y: 476, width: 171, height: 209)
        pic3.frame=CGRect(x: 452, y: 649, width: 167, height: 186)
        pic4.frame=CGRect(x: 97, y: 786, width: 194, height: 233)
        pic5.frame=CGRect(x: 540, y: 89, width: 70, height: 70)
        pic6.frame=CGRect(x: 651, y: 85, width: 80, height: 80)
        pic1.contentMode = .scaleAspectFit
        pic2.contentMode = .scaleAspectFit
        pic3.contentMode = .scaleAspectFit
        pic4.contentMode = .scaleAspectFit
        pic5.contentMode = .scaleAspectFit
        pic6.contentMode = .scaleAspectFit
        pic6.layer.cornerRadius=pic6.frame.height/2
        pic6.layer.masksToBounds=true
        self.view.addSubview(pic1)
        self.view.addSubview(pic2)
        self.view.addSubview(pic3)
        self.view.addSubview(pic4)
        self.view.addSubview(pic5)
        self.view.addSubview(pic6)
        
        let txt1=UITextView(frame: CGRect(x: 164, y: 320, width: 228, height: 80))
        let txt2=UITextView(frame: CGRect(x: 483, y: 543, width: 207, height: 75))
        let txt3=UITextView(frame: CGRect(x: 164, y: 720, width: 207, height: 75))
        let txt4=UITextView(frame: CGRect(x: 456, y: 886, width: 264, height: 75))
        txt1.isEditable=false
        txt2.isEditable=false
        txt3.isEditable=false
        txt4.isEditable=false
        txt1.isSelectable=false
        txt2.isSelectable=false
        txt3.isSelectable=false
        txt4.isSelectable=false
        txt1.text="绘 画  🎨"
        txt2.text="画 册  📖"
        txt3.text="社 区  🏠"
        txt4.text="关 于 我  🙋‍♂️"
        txt1.backgroundColor=UIColor.clear
        txt2.backgroundColor=UIColor.clear
        txt3.backgroundColor=UIColor.clear
        txt4.backgroundColor=UIColor.clear
        txt1.textColor=UIColor.white
        txt2.textColor=UIColor.white
        txt3.textColor=UIColor.white
        txt4.textColor=UIColor.white
        txt1.font=UIFont.systemFont(ofSize: 55)
        txt2.font=UIFont.systemFont(ofSize: 40)
        txt3.font=UIFont.systemFont(ofSize: 40)
        txt4.font=UIFont.systemFont(ofSize: 40)
        self.view.addSubview(txt1)
        self.view.addSubview(txt2)
        self.view.addSubview(txt3)
        self.view.addSubview(txt4)
        
        
        let ges1=UITapGestureRecognizer(target: self, action: #selector(gotodraw))
        paint.addTarget(self, action: #selector(gotodraw), for: .touchUpInside)
        txt1.addGestureRecognizer(ges1)
        txt1.isUserInteractionEnabled=true
        pic1.addGestureRecognizer(ges1)
        pic1.isUserInteractionEnabled=true
        
        let ges2=UITapGestureRecognizer(target: self, action: #selector(gotohistory))
        history.addTarget(self, action: #selector(gotohistory), for: .touchUpInside)
        txt2.addGestureRecognizer(ges2)
        txt2.isUserInteractionEnabled=true
        pic2.addGestureRecognizer(ges2)
        pic2.isUserInteractionEnabled=true
        
        let ges3=UITapGestureRecognizer(target: self, action: #selector(gotocommu))
        community.addTarget(self, action: #selector(gotocommu), for: .touchUpInside)
        txt3.addGestureRecognizer(ges3)
        txt3.isUserInteractionEnabled=true
        pic3.addGestureRecognizer(ges3)
        pic3.isUserInteractionEnabled=true
        
        let ges4=UITapGestureRecognizer(target: self, action: #selector(gotoinfo))
        info.addTarget(self, action: #selector(gotoinfo), for: .touchUpInside)
        txt4.addGestureRecognizer(ges4)
        txt4.isUserInteractionEnabled=true
        pic4.addGestureRecognizer(ges4)
        pic4.isUserInteractionEnabled=true
        
        pic5.isUserInteractionEnabled=true
        pic5.addGestureRecognizer(ges4)
        
        pic6.isUserInteractionEnabled=true
        pic6.addGestureRecognizer(ges2)
    }
    
    /// 选择图片
        @objc func kpickImage() {
            print(GlobalIfLogin)
            
            if GlobalIfLogin == true{
            
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
                //初始化图片控制器
                let picker = UIImagePickerController()
                //设置代理
                picker.delegate = self
                //指定图片控制器类型
                picker.sourceType = .photoLibrary
                //弹出控制器，显示界面
                picker.allowsEditing = true
                self.present(picker, animated: true, completion: nil)
            }else{
                print("读取相册错误")
            }
        }
            else{
                let alertController = UIAlertController(title: "小朋友请先在关于我登录哦！",
                                                        message: nil, preferredStyle: .alert)
                //显示提示框
                self.present(alertController, animated: true, completion: nil)
                //两秒钟后自动消失
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                    self.presentedViewController?.dismiss(animated: false, completion: nil)
                }
            }
//            //设置代理
//            self.imagePickerController.delegate = self
//            //允许用户对选择的图片或影片进行编辑
//            self.imagePickerController.allowsEditing = true
//            //设置image picker的用户界面
//            self.imagePickerController.sourceType = .photoLibrary
//            //设置图片选择控制器导航栏的背景颜色
//            self.imagePickerController.navigationBar.barTintColor = UIColor.orange
//            //设置图片选择控制器导航栏的标题颜色
//            self.imagePickerController.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
//            //设置图片选择控制器导航栏中按钮的文字颜色
//            self.imagePickerController.navigationBar.tintColor = UIColor.white
//            //显示图片选择控制器
//            self.present(self.imagePickerController, animated: true, completion: nil)
        }
    
    
    func drawcircle(x:CGFloat,y:CGFloat,r:CGFloat,red:CGFloat,green:CGFloat,blue:CGFloat,opacity:CGFloat=1.0){
        let cir=UIView(frame: CGRect(x: x, y: y, width: 2*r, height: 2*r))
        cir.backgroundColor=UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
        cir.layer.masksToBounds=true
        cir.layer.cornerRadius=r
        self.view.addSubview(cir)
    }
    func drawcircle2(x:CGFloat,y:CGFloat,r:CGFloat,red:CGFloat,green:CGFloat,blue:CGFloat){
        let cir=UIView(frame: CGRect(x: x-r, y: y-r, width: 2*r, height: 2*r))
        cir.backgroundColor=UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0)
        cir.layer.masksToBounds=true
        cir.layer.cornerRadius=r
        self.view.addSubview(cir)
    }
    @objc func gotodraw(){
        if GlobalIfLogin == true{//记得改回来
        let darwcon = ViewController()
            self.navigationController?.pushViewController(darwcon, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "小朋友请先在关于我登录哦！",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        //let con = UIStoryboard(name: "Main", bundle: nil)
        //    .instantiateViewController(withIdentifier: "drawboard") as! DrawController;
        //self.navigationController?.pushViewController(con, animated: true)
    }
    @objc func gotohistory(){
        if GlobalIfLogin == true{//记得改回来
        let darwcon = PhotoView()
            self.navigationController?.pushViewController(darwcon, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "小朋友请先在关于我登录哦！",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
//        let con = UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(withIdentifier: "historyboard") as! HistoryController;
//        self.navigationController?.pushViewController(con, animated: true)
    }
    @objc func gotocommu(){
        
        if GlobalIfLogin == true{//记得改回来
            let con = CommunityView()
            self.navigationController?.pushViewController(con, animated: true)
            
//            let con = UIStoryboard(name: "Main", bundle: nil)
//                .instantiateViewController(withIdentifier: "communityboard") as! CommunityController;
//            self.navigationController?.pushViewController(con, animated: true)
//        let darwcon = ViewController()
//            self.navigationController?.pushViewController(darwcon, animated: true)
        }
        else {
            let alertController = UIAlertController(title: "小朋友请先在关于我登录哦！",
                                                    message: nil, preferredStyle: .alert)
            //显示提示框
            self.present(alertController, animated: true, completion: nil)
            //两秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        
    }
//        let con = UIStoryboard(name: "Main", bundle: nil)
//            .instantiateViewController(withIdentifier: "infoboard") as! InfoController;
//        self.navigationController?.pushViewController(con, animated: true)
    

    
    
    /// 图片选择完成
        ///
        /// - Parameters:
        ///   - picker: 图片选择控制器
        ///   - info: 图片信息
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("finished")
    //        print("media type: \(String(describing: info["UIImagePickerControllerMediaType"]))")
    //        print("crop rect: \(String(describing: info["UIImagePickerControllerCropRect"]))")
    //        print("reference url: \(String(describing: info["UIImagePickerControllerReferenceURL"]))")
            //获取选择到的图片
        chooseimage = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage
         print("获取成功")
        
                let imageData = chooseimage?.pngData()
        
                let base64String = imageData?.base64EncodedString()
        //print(base64String)
        
        var loadp = false
        let params = ["imgBase64":base64String,"childID":GlobalUserId] as [String:Any]
        HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picload",parameters: params,requestSerializer: JSONParameterSerializer()){
            response in
            if let err = response.error{
                print("error: \(err.localizedDescription)")
                return
            }
            let jsondata = JSON(response.data)
            if jsondata["errNo"] == 200
            {
                loadp = true
                print("上传成功")
            }
        }
        while loadp == false {
        }
            var lastestpicid = 0
            let getlastestpicparams = ["childID":GlobalUserId] as [String : Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/Pic/lastestPicIDget",parameters: getlastestpicparams,requestSerializer: JSONParameterSerializer()){
                response in
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                if jsondata["errNo"] == "200"
                {
                    lastestpicid = jsondata["Pic_ID"].int!
                    print("获取到最新pic id")
                }


            }
            while lastestpicid == 0{}
            
            let initialcomment = ["Pic_ID":lastestpicid] as [String :Any]
            HTTP.POST("http://121.41.14.201:8080/iArt/doc_pardialogue/initialDia",parameters: initialcomment,requestSerializer: JSONParameterSerializer()){
                response in
                if let err = response.error{
                    print("error: \(err.localizedDescription)")
                    return
                }
                let jsondata = JSON(response.data)
                if jsondata["errNo"] == 200
                {
                    print("更新成功")
                }


            }
        
//            let alertController = UIAlertController(title: "上传成功！",
//                                                    message: nil, preferredStyle: .alert)
//            //显示提示框
//            self.present(alertController, animated: true, completion: nil)
//            //两秒钟后自动消失
//            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
//                self.presentedViewController?.dismiss(animated: false, completion: nil)
//            }
//
            
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
//    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
//        print("finished")
//    //        print("media type: \(String(describing: info["UIImagePickerControllerMediaType"]))")
//    //        print("crop rect: \(String(describing: info["UIImagePickerControllerCropRect"]))")
//    //        print("reference url: \(String(describing: info["UIImagePickerControllerReferenceURL"]))")
//            //获取选择到的图片
//            chooseimage = info["UIImagePickerControllerEditedImage"] as? UIImage
//         print("获取成功")
//
//                let imageData = chooseimage?.pngData()
//
//                let base64String = imageData?.base64EncodedString()
//
//        let params = ["imgBase64":base64String,"childID":GlobalUserId] as [String:Any]
//        HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picload",parameters: params,requestSerializer: JSONParameterSerializer()){
//            response in
//            if let err = response.error{
//                print("error: \(err.localizedDescription)")
//                return
//            }
//            let jsondata = JSON(response.data)
//            if jsondata["errNo"] == 200
//            {
//                print("上传成功")
//            }
//        }
//
//            //将图片加入到textView中
//            //addImage(image: image!)
//            //关闭当前界面
//            //self.dismiss(animated: true, completion: nil)
//        }
    
    /// 取消选择图片
        ///
        /// - Parameter picker: 图片选择控制器
//        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
//            self.dismiss(animated: true, completion: nil)
//        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    @objc func gotoinfo(){
        if GlobalIfLogin == false{
        let con = LoginView()
            self.navigationController?.pushViewController(con, animated: true)}
        else {
            let con = AboutMeView()
            self.navigationController?.pushViewController(con, animated: true)
        }
    }
    
}
