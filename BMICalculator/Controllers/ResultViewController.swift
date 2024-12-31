//
//  ResultViewController.swift
//  BMICalculator
//
//  Created by parag on 30/12/24.
//

import UIKit

class ResultViewController: UIViewController {

    let mainview = ResultView()
    lazy var result = mainview.header
    var bmi:String = "0"
    
    
    override func viewDidLoad() {
       super.viewDidLoad()
       let button =  mainview.Button(title: "Recalulate", callback: {
            print("Recalulate")
            self.navigationController?.popViewController(animated: true)
       })

        button.backgroundColor = .white;
        button.setTitleColor(.black, for: .normal)
        view.addSubview(mainview.BackgroundImageView)
        view.addSubview(result)
        view.addSubview(button)
        view.backgroundColor = UIColor(hex: "#B0E2FF")
        NSLayoutConstraint.activate([
            mainview.BackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            mainview.BackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainview.BackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainview.BackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
        
        result.text = "Your BMI \n \(bmi)"
        mainview.header.translatesAutoresizingMaskIntoConstraints = false
        mainview.header.textColor = UIColor(.black);
        mainview.header.font = UIFont.systemFont(ofSize: 38)
        mainview.header.textAlignment = .center
        mainview.header.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            mainview.header.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            mainview.header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainview.header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 180),
        ])
        
        NSLayoutConstraint.activate([
        button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
    
}

extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexSanitized.hasPrefix("#") {
            hexSanitized.remove(at: hexSanitized.startIndex)
        }
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: 1.0
        )
    }
}

//
//#Preview{
//    ResultViewController()
//}
