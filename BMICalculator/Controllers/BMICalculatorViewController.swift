//
//  ViewController.swift
//  BMICalculator
//
//  Created by parag on 29/12/24.
//

import UIKit

let DEFAULT_HEIGHT:Float = 1.3;
let DEFAULT_WEIGHT:Float = 50
let MIN_HEIGHT:Float = 1;
let MAX_HEIGHT:Float = 2.5;
let MIN_WEIGHT:Float = 40;
let MAX_WEIGHT:Float = 140

class BMICalculatorViewController: UIViewController {
    var mainview = Calculator()
    var calHeight:Float = DEFAULT_HEIGHT
    var calWeight:Float = DEFAULT_WEIGHT
    lazy var sliderStackContainer:UIStackView = mainview.VStack()
    lazy var sliderStackHeight = mainview.VStack()
    lazy var sliderStackWeight = mainview.VStack()
    lazy var heightSliderLablesRow = mainview.HStack()
    lazy var weightSliderLablesRow = mainview.HStack()
    lazy var weightSlider = mainview.slider()
    lazy var heightSlider = mainview.slider()
    lazy var heightSliderLable = mainview.sliderLable()
    lazy var heightValueSlider = mainview.sliderLable()
    lazy var weightSliderLable = mainview.sliderLable()
    lazy var weightValueSlider = mainview.sliderLable()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(mainview.BackgroundImageView)
        view.addSubview(mainview.header)
        view.addSubview(sliderStackContainer)
        view.addSubview(heightSliderLablesRow)
        view.addSubview(weightSliderLablesRow)
        
        mainview.header.translatesAutoresizingMaskIntoConstraints = false;
        
        
        NSLayoutConstraint.activate([
            mainview.BackgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            mainview.BackgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            mainview.BackgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainview.BackgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
        ])
                
      
        mainview.header.text = "Calculate\nYour BMI"
        mainview.header.translatesAutoresizingMaskIntoConstraints = false
        mainview.header.textColor = UIColor(.black);
        mainview.header.font = UIFont.systemFont(ofSize: 38)
        mainview.header.textAlignment = .left
        mainview.header.numberOfLines = 0
        NSLayoutConstraint.activate([
            mainview.header.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 10),
            mainview.header.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainview.header.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 180),
        ])
        
        //adding slider lable
        heightSliderLable.text = "Height";
    
        heightValueSlider.text = "\(DEFAULT_HEIGHT) m"
        weightSliderLable.text = "Weight";
        weightValueSlider.text = "\(DEFAULT_WEIGHT) Kg"
        heightSliderLablesRow.addArrangedSubview(heightSliderLable);
        heightSliderLablesRow.addArrangedSubview(heightValueSlider);
        weightSliderLablesRow.addArrangedSubview(weightSliderLable);
        weightSliderLablesRow.addArrangedSubview(weightValueSlider)
        
        weightSlider.maximumValue = MAX_WEIGHT
        weightSlider.minimumValue = MIN_WEIGHT
       
        weightSlider.addAction(UIAction {_ in
            self.onWeightSliderChange(self.weightSlider.value)
                }, for: .allEvents)
     
        
    
        heightSlider.maximumValue = MAX_HEIGHT;
        heightSlider.minimumValue = MIN_HEIGHT;
       
//        heightSlider.setValue(DEFAULT_HEIGHT, animated: true)
        heightSlider.addAction(UIAction {_ in
            self.onHeightSliderChange(self.heightSlider.value)
                }, for: .allEvents)
    
        
        sliderStackHeight.addArrangedSubview(heightSliderLablesRow);
        sliderStackHeight.addArrangedSubview(heightSlider)
       
        sliderStackWeight.addArrangedSubview(weightSliderLablesRow);
        sliderStackWeight.addArrangedSubview(weightSlider);
        
        
        sliderStackContainer.addArrangedSubview(sliderStackHeight)
        sliderStackContainer.addArrangedSubview(sliderStackWeight)
        sliderStackContainer.addArrangedSubview(mainview.Button(title: "Calculate", callback:onCalculate))
        
        
        NSLayoutConstraint.activate([
            sliderStackContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            sliderStackContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),

            sliderStackContainer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sliderStackContainer.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant:0)
        ])
        
        sliderStackContainer.spacing = 40
        
        heightSlider.value = DEFAULT_HEIGHT
        weightSlider.value = DEFAULT_WEIGHT

    }

    func onWeightSliderChange(_ value:Float){

        calWeight =  value
        weightValueSlider.text = "\(String(format:"%.2f", value)) kg"
    }
    func onHeightSliderChange(_ value:Float){

        calHeight = value
        heightValueSlider.text = "\(String(format:"%.2f", value)) m"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(navigationController?.viewControllers ?? "No controllers in navigation stack")
    }

    func onCalculate(){
        let bmi = calWeight / pow(calHeight,2)
        let resultVC = ResultViewController();
        resultVC.bmi = String(format: "%.2f", bmi)
        self.navigationController?.pushViewController(resultVC, animated: true)
    }
}



#Preview {
    let navController = UINavigationController(rootViewController: BMICalculatorViewController())
    return navController
}
