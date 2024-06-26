//
//  picController.swift
//  test
//
//  Created by 머성이 on 5/27/24.
//

import UIKit

class picController: UIViewController {

    @IBOutlet weak var UIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonRound()

    }
    // 버튼의 너비와 높이가 동일한지 확인
    func makeButtonRound() {
        let buttonSize = UIButton.frame.size
        let cornerRadiu = buttonSize.width / 2
        
    // 원형으로 만들기
        UIButton.layer.cornerRadius = cornerRadiu
        UIButton.clipsToBounds = true
        
    // 버튼의 색상 변경
        UIButton.backgroundColor = UIColor.clear
        
    // 버튼의 테두리 변경
        UIButton.layer.borderWidth = 2.0
        UIButton.layer.borderColor = UIColor.systemBlue.cgColor
    }
    
    
    // 버튼이 눌렸을 때 화면전환 구현
    @IBAction func buttonTapped(_ sender: Any) {
        let storyboared = UIStoryboard(name: "Main", bundle: nil)
        if let p2moreController = storyboared.instantiateViewController(withIdentifier: "p2moreController") as? p2moreController{
            self.present(p2moreController, animated: true, completion: nil)
        }
    }

}
