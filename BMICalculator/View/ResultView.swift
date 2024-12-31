//
//  ResultView.swift
//  BMICalculator
//
//  Created by parag on 29/12/24.
//

import UIKit

class ResultView {
    var BackgroundImageView:UIImageView = {
        var imgBackground = UIImageView()
        imgBackground.image = UIImage(named:"result_background");
        imgBackground.contentMode = .scaleAspectFill;
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
        
        return imgBackground;
    }()
    
    var header = UILabel();
    
    func Button(title:String,callback: @escaping () -> Void) -> UIButton{
        let btn = UIButton()
        btn.layer.cornerRadius = 6
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        btn.addAction(UIAction {_ in
            callback()
        } , for: .touchUpInside)
        return btn
    }
}
