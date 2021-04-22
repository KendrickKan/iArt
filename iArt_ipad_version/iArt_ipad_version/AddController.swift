//
//  AddController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/24.
//

import UIKit

class AddController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let back=UIImageView(image: UIImage(named: "pic5-2"))
        let add=UIImageView(image: UIImage(named: "pic5-3"))
        back.contentMode = .scaleAspectFill
        add.contentMode = .scaleAspectFill
        back.frame=CGRect(x: 50, y: 40, width: 70, height: 70)
        add.frame=CGRect(x: self.view.frame.width-50-70, y: 40, width: 70, height: 70)
        back.layer.cornerRadius=35
        add.layer.cornerRadius=35
        back.layer.masksToBounds=true
        add.layer.masksToBounds=true
        self.view.addSubview(back)
        self.view.addSubview(add)
        
        back.isUserInteractionEnabled=true
        add.isUserInteractionEnabled=true
        let ges1=UITapGestureRecognizer(target: self, action: #selector(back_))
        let ges2=UITapGestureRecognizer(target: self, action: #selector(back_))
        back.addGestureRecognizer(ges1)
        add.addGestureRecognizer(ges2)
    }
    
    @objc func back_(){
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
