//
//  ViewController.swift
//  DataPassing
//
//  Created by Arya Deshmukh on 30/05/24.
//

import UIKit
// Protocol to pass data from ViewControllerB to ViewControllerA

class ViewController: UIViewController,ViewControllerBDelegate  {
    // UI Elements
      lazy var infoLabel: UILabel = {
          let label = UILabel()
          label.translatesAutoresizingMaskIntoConstraints = false
          label.textAlignment = .center
          label.numberOfLines = 0
          label.layer.borderWidth = 1
          label.layer.borderColor = UIColor.gray.cgColor
          return label
      }()

      lazy var navigateToBButton: UIButton = {
          let button = UIButton(type: .system)
          button.translatesAutoresizingMaskIntoConstraints = false
          button.setTitle("Go to ViewController B", for: .normal)
          button.addTarget(self, action: #selector(navigateToViewControllerB), for: .touchUpInside)
          return button
      }()

      override func viewDidLoad() {
          super.viewDidLoad()
          view.backgroundColor = .white
          setupLayout()
      }

      func setupLayout() {
          view.addSubview(infoLabel)
          view.addSubview(navigateToBButton)

          // Constraints for infoLabel
          NSLayoutConstraint.activate([
              infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
              infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
              infoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
              infoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
              infoLabel.heightAnchor.constraint(equalToConstant: 100)
          ])

          // Constraints for navigateToBButton
          NSLayoutConstraint.activate([
              navigateToBButton.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 20),
              navigateToBButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
          ])
      }

      @objc func navigateToViewControllerB() {
          let viewControllerB = ViewControllerB()
          viewControllerB.delegate = self
          navigationController?.pushViewController(viewControllerB, animated: true)
      }

      // ViewControllerBDelegate method
      func didSaveData(name: String, email: String, technology: String) {
          infoLabel.text = "Name: \(name)\nEmail: \(email)\nTechnology: \(technology)"
      }
}

