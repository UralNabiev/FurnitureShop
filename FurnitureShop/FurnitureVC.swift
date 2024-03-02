//
//  FurnitureVC.swift
//  FurnitureShop
//
//  Created by O'ral Nabiyev on 02/03/24.
//

import UIKit

class FurnitureVC: UIViewController {
    
    @IBOutlet weak var firstFurnitureImg: UIImageView!
    
    @IBOutlet weak var secondFurnitureImg: UIImageView!
    
    @IBOutlet weak var likeImg: UIImageView!
    
    @IBOutlet weak var priceLbl: UILabel!
    
    @IBOutlet weak var countLbl: UILabel!
    
    @IBOutlet weak var aboutBtn: UIButton!
    
    @IBOutlet weak var furnDescLbl: UILabel!
    
    var countFurn: Int = 1
    var priceFurn: Int = 350
    var isLiked: Bool = false
    
    var aboutDesc: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        let attributedTitle = NSAttributedString(string: "Подробное", attributes: attributes)
        aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
        
    }
    
    func changeColor(imgName: String) {
        firstFurnitureImg.image = UIImage(named: imgName)
        UIView.animateKeyframes(withDuration: 0.7, delay: 0) {
            self.secondFurnitureImg.alpha = 0
        } completion: { _ in
            self.secondFurnitureImg.image = UIImage(named: imgName)
            self.secondFurnitureImg.alpha = 1
        }
    }
    
    @IBAction func likeTapped(_ sender: Any) {
        if isLiked {
            likeImg.tintColor = .white
            likeImg.image = UIImage(systemName: "heart")
            self.likeImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
                self.likeImg.transform = .identity
            }
            isLiked = false
        } else {
            likeImg.tintColor = .red
            likeImg.image = UIImage(systemName: "heart.fill")
            self.likeImg.transform = CGAffineTransform(scaleX: 0.7, y: 0.7)
            UIView.animateKeyframes(withDuration: 0.3, delay: 0) {
                self.likeImg.transform = .identity
            }
            isLiked = true
        }
    }
    
    
    @IBAction func changeColorTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            changeColor(imgName: "orchair")
        case 1:
            changeColor(imgName: "blchair")
        case 2:
            changeColor(imgName: "ylchair")
        default:
            changeColor(imgName: "orchair")
        }
        
    }
    
    @IBAction func aboutTapped(_ sender: Any) {
        
        let attributes: [NSAttributedString.Key: Any] = [
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]

        if aboutDesc {
            furnDescLbl.numberOfLines = 2
            let attributedTitle = NSAttributedString(string: "Подробное", attributes: attributes)
            aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
            aboutDesc = false
        } else {
            furnDescLbl.numberOfLines = 0
            let attributedTitle = NSAttributedString(string: "Закрыть", attributes: attributes)
            aboutBtn.setAttributedTitle(attributedTitle, for: .normal)
            aboutDesc = true
        }
        
    }
    
    
    @IBAction func plusMinusTapped(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            if countFurn > 0 {
                countFurn -= 1
                countLbl.text = "\(countFurn)".numberFormatter()
                priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
            }
        case 1:
            countFurn += 1
            countLbl.text = "\(countFurn)".numberFormatter()
            priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
        default:
            countFurn -= 1
            countLbl.text = "\(countFurn)".numberFormatter()
            priceLbl.text = "\(priceFurn*countFurn)".numberFormatter() + " $"
        }
        
    }
    
    
}

