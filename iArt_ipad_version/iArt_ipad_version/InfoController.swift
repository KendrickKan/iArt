//
//  InfoController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/24.
//

import UIKit

class InfoController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let back=UIImageView(image: UIImage(named: "pic6-2"))
        back.contentMode = .scaleAspectFill
        back.frame=CGRect(x: 30, y: 35, width: 70, height: 70)
        back.layer.cornerRadius=35
        back.layer.masksToBounds=true
        back.isUserInteractionEnabled=true
        self.view.addSubview(back)
        
        let ges=UITapGestureRecognizer(target: self, action: #selector(back_))
        back.addGestureRecognizer(ges)
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
