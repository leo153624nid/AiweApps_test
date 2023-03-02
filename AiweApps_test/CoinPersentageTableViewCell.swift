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
        label.font = .systemFont(ofSize: 18, weight: .medium)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
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
        coinName.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 100, height: contentView.frame.size.height)
        
        // setup coinPersentage
        coinPersentage.frame = CGRect(x: 110, y: 0, width: contentView.frame.size.width - 100, height: contentView.frame.size.height)
    }
}
