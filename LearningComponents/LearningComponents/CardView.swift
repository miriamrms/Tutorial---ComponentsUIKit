//
//  ComponentViewController.swift
//  LearningComponents
//
//  Created by Miriam Mendes on 14/05/25.
//

import Foundation
import UIKit

class CardView: UIView{
    
    //HStack
    private var hStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 15
        stack.alignment = .center
        stack.isUserInteractionEnabled = false
        stack.backgroundColor = .green1
        
        //border
        stack.layer.borderWidth = 1
        stack.layer.borderColor = UIColor.green3.cgColor
        stack.layer.cornerRadius = 8
        return stack
    }()
    
    //Image
    private var backgroundImageView: UIView = {
        let bgView = UIView()
        bgView.translatesAutoresizingMaskIntoConstraints = false
        bgView.backgroundColor = .blue3
        bgView.layer.cornerRadius = 8
        bgView.clipsToBounds = true
        bgView.overrideUserInterfaceStyle = .light
        return bgView
    }()
    
    private var cardImage: UIImageView = {
        let image = UIImageView()
        image.image = .brush
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    //VStack
    private var vStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        stack.alignment = .leading
        stack.isUserInteractionEnabled = false
        stack.backgroundColor = .clear
        return stack
    }()
    
    //Title
    private var cardTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .rounded(ofSize: 20, weight: .semibold)
        return label
    }()
    
    //Description
    private var cardDescription: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .rounded(ofSize: 17, weight: .regular)
        return label
    }()
    
    
    init(cardImage: UIImage, title: String, description: String) {
        super.init(frame: .zero)
        setupView(image: cardImage, title: title, description: description)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView(image: UIImage, title: String, description: String){
        cardImage.image = image
        cardTitle.text = title
        cardDescription.text = description
        addComponents()
        setConstraints()
    }
    
    private func addComponents(){
        addSubview(hStack)
        backgroundImageView.addSubview(cardImage)
        vStack.addArrangedSubview(cardTitle)
        vStack.addArrangedSubview(cardDescription)
        hStack.addArrangedSubview(backgroundImageView)
        hStack.addArrangedSubview(vStack)
        hStack.isLayoutMarginsRelativeArrangement = true
        hStack.layoutMargins = UIEdgeInsets(top: 10, left: 13, bottom: 10, right: 13)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: self.topAnchor),
            hStack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hStack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            
            cardImage.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            cardImage.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
            cardImage.widthAnchor.constraint(equalToConstant: 62),
            cardImage.heightAnchor.constraint(equalToConstant: 62),
            
            backgroundImageView.widthAnchor.constraint(equalToConstant: 80),
            backgroundImageView.heightAnchor.constraint(equalToConstant: 72)
            
        ])
    }
}


#Preview{
    CardView(cardImage: .cleaning, title: "Limpeza", description: "Cuide da higiene para manter a saúde em dia.")
}
