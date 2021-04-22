//
//  HistoryController.swift
//  iArt_ipad_version
//
//  Created by 苹果 on 2021/1/24.
//

import UIKit

class HistoryController: UIViewController {

    @IBOutlet weak var scroll: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.shadowImage=UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.tintColor=UIColor.white
        self.navigationController?.navigationBar.isHidden=true
        
        self.view.backgroundColor=UIColor(red: 253.0/255.0, green: 150.0/255.0, blue: 45.0/255.0, alpha: 1.0)

        scroll.contentSize=CGSize(width: self.view.frame.width, height: 2150)
        
        let back=UIImageView(image: UIImage(named: "pic3-2"))
        back.frame=CGRect(x: 50, y: 20, width: 70, height: 70)
        back.contentMode = .scaleToFill
        back.isUserInteractionEnabled=true
        scroll.addSubview(back)
        
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
