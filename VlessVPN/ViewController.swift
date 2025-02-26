//
//  ViewController.swift
//  VlessVPN
//
//  Created by Jahongir Anvarov on 21.02.2025.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let mainView = MainView()

    // MARK: - Private methods
    
    override func loadView() {
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.connectButton.addTarget(self, action: #selector(connectToVPN), for: .touchUpInside)
    }

    // MARK: - Private methods
    
    @objc private func connectToVPN() {
        VPNManager.shared.startVPN()
    }
}
