//
//  ProgTableViewCell.swift
//  NetworkingIntro
//
//  Created by Consultant on 11/7/22.
//

import UIKit

class ProgTableViewCell: UITableViewCell {

    lazy var stockImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .systemGreen
        imageView.layer.cornerRadius = 20.0
        return imageView
    }()
    

    let network = NetworkManager()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        
//        self.contentView.addSubview(stockButton)
        self.contentView.addSubview(stockImageView)
        
        self.stockImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
//        self.stockButton.topAnchor.constraint(equalTo: self.stockImageView.bottomAnchor, constant: 8).isActive = true
//        self.stockButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
//        self.stockButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
//        self.stockButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
}
