//
//  Calculator.swift
//  BMICalculator
//
//  Created by parag on 29/12/24.
//

import UIKit

class Calculator {
    var container = UIView();
    var header = UILabel();
    
    func sliderLable() -> UILabel{
        let lable = UILabel();
        //        weightSlider.minimumTrackTintColor = .lightGray
        //        weightSlider.thumbTintColor = .red
        //        weightSlider.maximumTrackTintColor  = .red;
        //        weightSlider.minimumTrackTintColor = .lightGray
        lable.textColor = .lightGray;
        lable.translatesAutoresizingMaskIntoConstraints = false
        return lable;
    }
    
    
    
    func slider() ->  UISlider{
        let s = UISlider();
        return s
    }
    var BackgroundImageView:UIImageView = {
        var imgBackground = UIImageView()
        imgBackground.image = UIImage(named:"calculate_background");
        imgBackground.contentMode = .scaleAspectFit;
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
        
        return imgBackground;
    }()
//    var slider:UISlider =  {
//        var slider = UISlider();
//        slider.minimumValue = 40;
//        slider.maximumValue = 110;
//        slider.thumbTintColor = .red
//        slider.maximumTrackTintColor  = .red;
//        slider.minimumTrackTintColor = .lightGray
//        slider.addAction(UIAction {_ in
//            onValueChange(slider.value)
//        }, for: .editingChanged)
//        slider.translatesAutoresizingMaskIntoConstraints = false
//        return slider;
//    }()
    
    func VStack() ->UIStackView {
        let stack = UIStackView();
        stack.axis = .vertical;
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func HStack() -> UIStackView {
        let stack = UIStackView();
        stack.axis = .horizontal;
        stack.spacing = 10
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }
    
    func Button(title:String,callback: @escaping () -> Void) -> UIButton{
        let btn = UIButton()
      

        btn.layer.cornerRadius = 6
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.contentMode = .scaleAspectFit
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .purple
//        btn.setBackgroundImage(image, for: .normal)
        btn.heightAnchor.constraint(equalToConstant: 50).isActive = true;
        btn.addAction(UIAction {_ in
            callback()
        } , for: .touchUpInside)
        return btn
    }
}
