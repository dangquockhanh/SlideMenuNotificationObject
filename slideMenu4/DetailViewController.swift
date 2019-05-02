//
//  DetailMenuViewController.swift
//  slideMenu4
//
//  Created by Đặng Khánh  on 4/24/19.
//  Copyright © 2019 Khánh Trắng. All rights reserved.
//

import UIKit

protocol Delegate {
    var showing: Bool {get set}
}
// key dùng trong notification
extension Notification.Name {
    static let sentUserInfo = Notification.Name("sentUserInfo")
    
}
class DetailViewController: UIViewController {
    
    @IBOutlet weak var nameVc2: UILabel!
    @IBOutlet weak var AgeVc2: UILabel!
    @IBOutlet weak var photoInfo: UIImageView!
    
    var userInfo: UserInfo? {
        didSet {
            guard let userInfo = userInfo else {return }
            nameVc2.text = userInfo.name
            AgeVc2.text = userInfo.age
            if let data = userInfo.image, let image = UIImage(data: data) {
                photoInfo.image = image
            }
        }
    }
    
    //delegate cho hiển thị menu
    var delegate: Delegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNotification()
    }
    
    // thưc hiện truyền dữ liệu bằng notification
    func registerNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showUserInfo), name: .sentUserInfo, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func showUserInfo(_ notification: Notification) {
//        guard let   = notification.userInfo?["key"] else {return}
        userInfo = notification.object as? UserInfo
        delegate?.showing = false // ần menu khi truyền data
    }

    
    @IBAction func buttonMenu(_ sender: Any) {
        delegate?.showing = true
    }
    
}
