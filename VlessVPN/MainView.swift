//
//  MainView.swift
//  VlessVPN
//
//  Created by Jahongir Anvarov on 23.02.2025.
//

import UIKit

final class MainView: UIView {
    
    // MARK: - Public properties
    
    let connectButton: UIButton = {
        let button = UIButton()
        button.setTitle("Подключить", for: .normal)
        button.backgroundColor = .blue
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Public methods
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        connectButton.layer.cornerRadius = connectButton.frame.width / 2
        connectButton.layer.masksToBounds = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private func setupView() {
        backgroundColor = .white
        addSubview(connectButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            connectButton.centerXAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor),
            connectButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            connectButton.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 60),
            connectButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -60),
            connectButton.heightAnchor.constraint(equalTo: connectButton.widthAnchor)
        ])
    }
}

