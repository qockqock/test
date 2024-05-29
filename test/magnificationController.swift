//
//  magnificationController.swift
//  test
//
//  Created by 머성이 on 5/28/24.
//

import UIKit

class magnificationController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var image: UIImage?

    override func viewDidLoad() {
        super.viewDidLoad()
        // imageView에 이미지를 설정합니다
        if let imageToDisplay = image {
            imageView.image = imageToDisplay
            
            self.view.backgroundColor = UIColor.black        }
    }
}
