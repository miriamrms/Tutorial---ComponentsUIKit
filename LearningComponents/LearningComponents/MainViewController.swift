//
//  ViewController.swift
//  LearningComponents
//
//  Created by Miriam Mendes on 13/05/25.
//

import UIKit

class MainViewController: UIViewController {
    
    private var brushTip: CardView = {
        let brushComponent = CardView(cardImage: .brush, title: "Higiene Bucal", description: "Cuide da saúde bucal para manter a saúde em dia.")
        brushComponent.translatesAutoresizingMaskIntoConstraints = false
        return brushComponent
    }()
    
    private var preparationTip: CardView = {
        let preparationComponent = CardView(cardImage: .notebook, title: "Preparação", description: "Estar preparado evita imprevistos e facilita o dia a dia.")
        preparationComponent.translatesAutoresizingMaskIntoConstraints = false
        return preparationComponent
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .green2
        view.addSubview(brushTip)
        view.addSubview(preparationTip)
        setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            brushTip.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            brushTip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            brushTip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            preparationTip.topAnchor.constraint(equalTo: brushTip.bottomAnchor, constant: 20),
            preparationTip.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            preparationTip.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
    }
}


#Preview {
    MainViewController()
}


extension UIFont {
    class func rounded(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        let systemFont = UIFont.systemFont(ofSize: size, weight: weight)
        let font: UIFont
        
        if let descriptor = systemFont.fontDescriptor.withDesign(.rounded) {
            font = UIFont(descriptor: descriptor, size: size)
        } else {
            font = systemFont
        }
        return font
    }
}
