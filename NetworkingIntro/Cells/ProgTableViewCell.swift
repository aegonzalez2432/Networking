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
        
        imageView.backgroundColor = .systemGreen
        //imageView.layer.cornerRadius = 20.0
        return imageView
    }()
    
    lazy var stockImageID: UILabel = {
        let imageID = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        imageID.translatesAutoresizingMaskIntoConstraints = false
        imageID.contentMode = .scaleAspectFit
        imageID.backgroundColor = .systemMint
        imageID.text = "ID: Image ID"
        imageID.textAlignment = .center
        return imageID
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
        
        self.contentView.addSubview(stockImageView)
        self.contentView.addSubview(stockImageID)
//        let table = UITableView(frame: .zero)
//        table.translatesAutoresizingMaskIntoConstraints = false
//        table.addSubview(stockImageID)
//        table.addSubview(stockImageView)
        
        self.stockImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.stockImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.stockImageView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        self.stockImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        self.stockImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        
        self.stockImageID.leadingAnchor.constraint(equalTo: self.stockImageView.trailingAnchor, constant: 8).isActive = true
        self.stockImageID.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.stockImageID.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.stockImageID.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        
    }
}
