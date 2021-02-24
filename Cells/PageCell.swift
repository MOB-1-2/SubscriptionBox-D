//
//  PageCell.swift
//  Subscription-Box
//
//  Created by Student Laptop_7/19_1 on 4/14/20.
//  Copyright © 2020 Makeschool. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {

    
    var page: Page? {
        didSet {
            guard let unwrappedPage = page else { return }
            homeImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.headerText, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
        }
    }
    
    private let homeImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Default-568h@2x.png"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let descriptionTextView: UITextView = {
        let textView = UITextView()
        let attributedText = NSMutableAttributedString(string: "some string", attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 18)])
        textView.attributedText = attributedText
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textAlignment = .center
        textView.isEditable = false
        textView.isScrollEnabled = false
        return textView
    }()
    
    //button
    var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Continue", for: .normal)
        button.isHidden = true
        button.backgroundColor = .cyan
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        setupLayout()
    }

    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        addSubview(descriptionTextView)
        addSubview(button)
        topImageContainerView.addSubview(homeImageView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImageContainerView.topAnchor.constraint(equalTo: topAnchor),
            topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5),

            homeImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor),
            homeImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor),
            homeImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5),
            
            descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor),
            descriptionTextView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor),
            descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor),
            descriptionTextView.heightAnchor.constraint(equalToConstant: 45),
            
            button.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 60),
            button.leftAnchor.constraint(equalTo: leftAnchor, constant: 35),
            button.rightAnchor.constraint(equalTo: rightAnchor, constant: -35),
            button.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc func buttonPressed(){
       print("pressed")
        let vc = LoginVC()
        vc.window = window
       window?.rootViewController = vc
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
