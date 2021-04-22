//
//  ChildrenView.swift
//  iArt
//
//  Created by KanDong on 2021/4/9.
//

import UIKit
import SwiftHTTP

class ChildrenView: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    override func viewDidLoad() {
        
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.systemBlue
        super.viewDidLoad()
        
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "launch")
        backgroundImage.contentMode = .scaleAspectFill //等比缩放填充（图片可能有部分显示不全）
         
        //将背景图片imageView插入到当前视图中
        self.view.insertSubview(backgroundImage, at: 0)
        
        
        let newdrawer = UIImageView(image: UIImage(named: "lanterm"))
        
        newdrawer.frame = CGRect(x: 8, y: 100, width: 28, height: 28)
        newdrawer.tintColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        //newdrawer.backgroundColor = UIColor(red: 255.0/255, green: 168.0/255, blue: 60/255.0, alpha: 1.0)
        self.view.addSubview(newdrawer)//黄色图标
        
        let title = UILabel(frame: CGRect(x: 40, y: 105, width: 80, height: 20))
        title.text = "我的画作"
        title.font = UIFont.systemFont(ofSize: 18)
        title.textColor = UIColor.systemBlue
        self.view.addSubview(title)
        
        let picBtn = UIButton(frame: CGRect(x:32,y:140,width: 350,height: 200))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn.setBackgroundImage(UIImage(named: "draw1"), for: UIControl.State.normal)
        picBtn.layer.masksToBounds = true
        picBtn.layer.cornerRadius = 19
        self.view.addSubview(picBtn)
        
        let picBtn2 = UIButton(frame: CGRect(x:32,y:360,width: 350,height: 200))
        //let picBtn = UIButton(frame: UIScreen.)
        picBtn2.setBackgroundImage(UIImage(named: "draw2"), for: UIControl.State.normal)
        picBtn2.layer.masksToBounds = true
        picBtn2.layer.cornerRadius = 19
        self.view.addSubview(picBtn2)
        
        
        let newpicBtn = UIButton(frame: CGRect(x:320,y:750,width: 50,height: 50))
        //let picBtn = UIButton(frame: UIScreen.)
        newpicBtn.setBackgroundImage(UIImage(named: "newpic"), for: UIControl.State.normal)
        newpicBtn.layer.masksToBounds = true
        //newpciBtn.layer.cornerRadius = 19
        self.view.addSubview(newpicBtn)
        newpicBtn.addTarget(self, action: #selector(another), for: .touchUpInside)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    @objc func another(){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            //初始化图片控制器
            let picker = UIImagePickerController()
            //设置代理
            picker.delegate = self
            //指定图片控制器类型
            picker.sourceType = .photoLibrary
            //弹出控制器，显示界面
            self.present(picker, animated: true, completion: {
                () -> Void in
            })
            
            //获取选择的原图
//            let pickedImage = info[UIImagePickerController.InfoKey.originalImage.rawValue] as! UIImage
//             
//            //将选择的图片保存到Document目录下
//            let fileManager = FileManager.default
//            let rootPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,
//                                                    .userDomainMask, true)[0] as String
//            let filePath = "\(rootPath)/pickedimage.jpg"
//            let imageData = pickedImage.jpegData(compressionQuality: 1.0)
//            fileManager.createFile(atPath: filePath, contents: imageData, attributes: nil)
//             
//            //上传图片
//            if (fileManager.fileExists(atPath: filePath)){
//                //取得NSURL
//                let imageURL = URL(fileURLWithPath: filePath)
//                 
//                        
//                        //let fileUrl = NSBundle.mainBundle().URLForResource("hangge", withExtension: "zip")!
//                           HTTP.POST("http://121.41.14.201:8080/iArt/Pic/picload",
//                                parameters: ["file": Upload(fileUrl: imageURL),"childID": "17382350689"]){ response in
//                            if let err = response.error{
//                                print("error: \(err.localizedDescription)")
//                                return
//                            }
//                            print(response.description)
//                            }
//                
//                        
//                }
//             
//            //图片控制器退出
//            picker.dismiss(animated: true, completion:nil)
            
            
        }else{
            print("读取相册错误")
        }
        
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
     


