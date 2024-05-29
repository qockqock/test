//
//  p2moreController.swift
//  test
//
//  Created by 머성이 on 5/27/24.
//

import UIKit

// UILabel extension으로 정의
extension UILabel {
    func bold(targetString: String) {
        let fontSize = self.font.pointSize
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let fullText = self.text ?? ""
        let range = (fullText as NSString).range(of: targetString)
        let attributedString = NSMutableAttributedString(string: fullText)
        attributedString.addAttribute(.font, value: font, range: range)
        self.attributedText = attributedString
    }
    //자간 0.5 적용은 변수명.addCharacterSpacing() 해주기!
    func addCharacterSpacing(kernValue:Double = 0.5) {
            guard let text = text, !text.isEmpty else { return }
            let string = NSMutableAttributedString(string: text)
            string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
            attributedText = string
        }
}

// Bold체
extension NSMutableAttributedString {
    var fontSize: CGFloat {
            return 14
        }
    var boldFont: UIFont {
            return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
        }
    
    func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
        let font = UIFont.boldSystemFont(ofSize: fontSize)
        let attributes: [NSAttributedString.Key: Any] = [.font: font]
        self.append(NSAttributedString(string: string, attributes: attributes))
        return self
    }
}

class p2moreController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var Label1: UILabel!
    @IBOutlet weak var Label2: UILabel!
    @IBOutlet weak var Label3: UILabel!
    @IBOutlet weak var Label4: UILabel!
    
    @IBOutlet weak var TitleLabel1: UILabel!
    @IBOutlet weak var TitleLabel2: UILabel!
    @IBOutlet weak var TitleLabel3: UILabel!
    @IBOutlet weak var TitleLabel4: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //배경 색 투명도 넣어서 이쁘장하게 만들었음 (ㄹㅇ 깔끔해졌는데?)
        view.backgroundColor = UIColor.black.withAlphaComponent(0.85)
        
        //        // 타이틀 레이블 굵게 해주는건데 라벨3만 안 변한다.. 내일 튜터님한테 여쭤봐야겠다.
        //        TitleLabel1.attributedText = NSMutableAttributedString()
        //            .bold(string: "ABOUT ME", fontSize: 20)
        //        TitleLabel2.attributedText = NSMutableAttributedString()
        //            .bold(string: "EDUCATION", fontSize: 20)
        //        TitleLabel3.attributedText = NSMutableAttributedString()
        //            .bold(string: "CHANNER", fontSize: 20)
        //        TitleLabel4.attributedText = NSMutableAttributedString()
        //            .bold(string: "WORK", fontSize: 20)
        
        // UIImageView에 탭 제스처 인식기 추가
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "magnificationController", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "magnificationController" {
            if let destinationVC = segue.destination as? magnificationController {
                // 이미지를 전달합니다
                destinationVC.image = getImage()
            }
        }
    }
    
    // 이미지를 가져오는 함수
    func getImage() -> UIImage? {
        // 이미지를 가져오는 로직을 작성한다 (예: 이미지를 파일에서 로드하거나 URL에서 다운로드)
        return UIImage(named: "daesung") // 가져올 이미지의 이름으로 설정
    }
}
    
    
    //p2moreController
    
    

/*
 //
 //  p2moreController.swift
 //  test
 //
 //  Created by 머성이 on 5/27/24.
 //

 import UIKit

 // UILabel extension으로 정의
 extension UILabel {
     func bold(targetString: String) {
         let fontSize = self.font.pointSize
         let font = UIFont.boldSystemFont(ofSize: fontSize)
         let fullText = self.text ?? ""
         let range = (fullText as NSString).range(of: targetString)
         let attributedString = NSMutableAttributedString(string: fullText)
         attributedString.addAttribute(.font, value: font, range: range)
         self.attributedText = attributedString
     }
 }

 // Bold체
 extension NSMutableAttributedString {
     var fontSize: CGFloat {
             return 14
         }
     var boldFont: UIFont {
             return UIFont(name: "AvenirNext-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize)
         }
     
     func bold(string: String, fontSize: CGFloat) -> NSMutableAttributedString {
         let font = UIFont.boldSystemFont(ofSize: fontSize)
         let attributes: [NSAttributedString.Key: Any] = [.font: font]
         self.append(NSAttributedString(string: string, attributes: attributes))
         return self
     }
 }

 class p2moreController: UIViewController {
     
     @IBOutlet weak var imageView: UIImageView!
     @IBOutlet weak var backController: UITableView!
     @IBOutlet weak var Label1: UILabel!
     @IBOutlet weak var Label2: UILabel!
     @IBOutlet weak var Label3: UILabel!
     @IBOutlet weak var Label4: UILabel!
     
     // 레이블 관련 추가 (아직 미작동) 5/28 커스텀? 어쩌구로 자간 조정한다고 설명되어있긴 했음
     open class CustomLabel : UILabel {
         @IBInspectable open var characterSpacing:CGFloat = 1 {
             didSet {
                 let attributedString = NSMutableAttributedString(string: self.text!)
                 attributedString.addAttribute(NSAttributedString.Key.kern, value: self.characterSpacing, range: NSRange(location: 0, length: attributedString.length))
                 self.attributedText = attributedString
             }

         }
     }
     //여기까지
     override func viewDidLoad() {
           super.viewDidLoad()
         view.backgroundColor = UIColor.darkGray
         Label1.attributedText = NSMutableAttributedString()
             .bold(string: "문자열 테스트", fontSize: 12)
         
         //컨트롤 아아아
         //Label1.text = "윤대성\n1999.08.23\n인천거주"
         Label2.text = "2024.05.27~\n스파르타 코딩클럽 iOS 4기"
         Label3.text = "https://daesungstudy.tistory.com/ \n https://github.com/qockqock/"
         Label4.text = "2019.04 ~ \n SPC Paris-baguette"
         //여기까지
           
           // UIImageView에 탭 제스처 인식기 추가
           let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:)))
           imageView.isUserInteractionEnabled = true
           imageView.addGestureRecognizer(tapGestureRecognizer)
         
       }
     
       @objc func imageTapped(_ sender: UITapGestureRecognizer) {
           performSegue(withIdentifier: "magnificationController", sender: self)
       }

       override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "magnificationController" {
               if let destinationVC = segue.destination as? magnificationController {
                   // 이미지를 전달합니다
                   destinationVC.image = getImage()
               }
           }
       }

       // 이미지를 가져오는 함수
       func getImage() -> UIImage? {
           // 이미지를 가져오는 로직을 작성한다 (예: 이미지를 파일에서 로드하거나 URL에서 다운로드)
           return UIImage(named: "daesung") // 가져올 이미지의 이름으로 설정
       }
       
     
     
     //p2moreController
     
     
 }

    

 */
   
