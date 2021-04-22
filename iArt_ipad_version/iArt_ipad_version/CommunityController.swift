//
//  CommunityController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/24.
//

import UIKit

class CommunityController: UIViewController {
    @IBOutlet weak var scroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor(red: 253.0/255.0, green: 150.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        
        scroll.contentSize=CGSize(width: self.view.frame.width, height: 2500)
        
        let back=UIImageView(image: UIImage(named: "pic4-2"))
        let add=UIImageView(image: UIImage(named: "pic4-3"))
        back.contentMode = .scaleAspectFill
        add.contentMode = .scaleAspectFill
        back.frame=CGRect(x: 50, y: 30, width: 70, height: 70)
        add.frame=CGRect(x: self.view.frame.width-50-70, y: 30, width: 70, height: 70)
        back.layer.cornerRadius=35
        add.layer.cornerRadius=35
        back.layer.masksToBounds=true
        add.layer.masksToBounds=true
        self.view.addSubview(back)
        self.view.addSubview(add)
        
        back.isUserInteractionEnabled=true
        add.isUserInteractionEnabled=true
        let ges1=UITapGestureRecognizer(target: self, action: #selector(back_))
        let ges2=UITapGestureRecognizer(target: self, action: #selector(add_))
        back.addGestureRecognizer(ges1)
        add.addGestureRecognizer(ges2)
    }
    @objc func back_(){
        self.navigationController?.popViewController(animated: true)
    }
    @objc func add_(){
        let con = UIStoryboard(name: "Main", bundle: nil)
            .instantiateViewController(withIdentifier: "addboard") as! AddController
        self.navigationController?.pushViewController(con, animated: true)
    }
}
