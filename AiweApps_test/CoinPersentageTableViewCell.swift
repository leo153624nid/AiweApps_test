//
//  CoinPersentageTableViewCell.swift
//  AiweApps_test
//
//  Created by macbook on 02.03.2023.
//

import UIKit

class CoinPersentageTableViewCell: UITableViewCell {
    static let identifier = "CoinPersentageTableViewCell"

    private let coinName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .medium)
        return label
    }()
    private let coinPersentage: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.frame = .zero
        self.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(coinName)
        contentView.addSubview(coinPersentage)
        
//        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coinName.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 100, height: contentView.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func configure(with viewModel: CoinPersentageTableViewCellViewModel) {
        coinName.text = viewModel.coinName
        coinPersentage.text = String(viewModel.coinPersentage)
    }
    
    func setupView() {
        // setup coinName
        coinName.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        coinName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        coinName.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        coinName.heightAnchor.constraint(equalToConstant: 30).isActive = true
        coinName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        // setup coinPersentage
        coinPersentage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        coinPersentage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        coinPersentage.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        coinPersentage.heightAnchor.constraint(equalToConstant: 30).isActive = true
        coinPersentage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
}
