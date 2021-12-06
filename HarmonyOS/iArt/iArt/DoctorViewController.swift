//
//  DoctorViewController.swift
//  iArt
//
//  Created by mac on 2021/1/21.
//

import UIKit

class DoctorViewController: UIViewController {

    override func viewDidLoad() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
                //去掉（重设）NavigationBar上的一条线
                self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
                self.navigationController?.navigationBar.tintColor=UIColor.blue
        super.viewDidLoad()
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 414, height:90 ))
        label.backgroundColor = UIColor(red: 60.0/255, green: 200.0/255, blue: 1.0, alpha: 1.0)
        
        self.view.addSubview(label)
        let paint = UILabel(frame: CGRect(x: 185, y: 50, width: 51, height: 29))
        // Do any additional setup after loading the view.
        paint.text = "画作"
        paint.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(paint)
        
        let draw3 = UIImageView(image: UIImage(named: "draw2"))
        draw3.frame = CGRect(x: 0, y: 88, width: 412, height: 370)
        self.view.addSubview(draw3)
        
        let back = UIImageView(image: UIImage(named: "backgrounddoctor"))
        back.frame = CGRect(x: 0, y: 453, width: 414, height: 409)
        self.view.addSubview(back)
        
        let text = UILabel(frame: CGRect(x: 6, y: 462, width: 89, height: 29))
        text.text = "医师点评"
        text.font = UIFont.systemFont(ofSize: 20)
        self.view.addSubview(text)
        
        let suggests = UIImageView(image: UIImage(named: "suggestion"))
        
        suggests.frame = CGRect(x: 0, y: 500, width: 414, height: 320)
        
        self.view.addSubview(suggests)
        
        
        // Do any additional setup after loading the view.
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
