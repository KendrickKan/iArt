//
//  DrawController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/24.
//

import UIKit

class DrawController: UIViewController{

    @IBOutlet weak var back: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage=UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.tintColor=UIColor.white
        self.navigationController?.navigationBar.isHidden=true
        
        let ges=UITapGestureRecognizer(target: self, action: #selector(back_))
        back.isUserInteractionEnabled=true
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
