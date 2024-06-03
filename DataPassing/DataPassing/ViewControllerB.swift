//
//  ViewControllerB.swift
//  DataPassing
//
//  Created by Arya Deshmukh on 01/06/24.
//

import UIKit

// Protocol to pass data from ViewControllerB to ViewControllerA
protocol ViewControllerBDelegate: AnyObject {
    func didSaveData(name: String, email: String, technology: String)
}

class ViewControllerB: UIViewController,ViewControllerCDelegate {
    weak var delegate: ViewControllerBDelegate?
       private var technology: String = ""

       // UI Elements
       lazy var nameTextField: UITextField = {
           let textField = UITextField()
           textField.translatesAutoresizingMaskIntoConstraints = false
           textField.placeholder = "Enter name"
           textField.borderStyle = .roundedRect
           return textField
       }()

       lazy var emailTextField: UITextField = {
           let textField = UITextField()
           textField.translatesAutoresizingMaskIntoConstraints = false
           textField.placeholder = "Enter email"
           textField.borderStyle = .roundedRect
           return textField
       }()

       lazy var saveButton: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Save", for: .normal)
           button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
           return button
       }()

       lazy var navigateToCButton: UIButton = {
           let button = UIButton(type: .system)
           button.translatesAutoresizingMaskIntoConstraints = false
           button.setTitle("Go to ViewController C", for: .normal)
           button.addTarget(self, action: #selector(navigateToViewControllerC), for: .touchUpInside)
           return button
       }()

       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = .white
           setupLayout()
       }

       func setupLayout() {
           view.addSubview(nameTextField)
           view.addSubview(emailTextField)
           view.addSubview(saveButton)
           view.addSubview(navigateToCButton)

           // Constraints for nameTextField
           NSLayoutConstraint.activate([
               nameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
               nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
           ])

           // Constraints for emailTextField
           NSLayoutConstraint.activate([
               emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
               emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
               emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
           ])

           // Constraints for saveButton
           NSLayoutConstraint.activate([
               saveButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20),
               saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])

           // Constraints for navigateToCButton
           NSLayoutConstraint.activate([
               navigateToCButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
               navigateToCButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
           ])
       }

       @objc func saveData() {
           guard let name = nameTextField.text, let email = emailTextField.text else { return }
           delegate?.didSaveData(name: name, email: email, technology: technology)
           navigationController?.popViewController(animated: true)
       }

       @objc func navigateToViewControllerC() {
           let viewControllerC = ViewControllerC()
           viewControllerC.delegate = self
           navigationController?.pushViewController(viewControllerC, animated: true)
       }

       // ViewControllerCDelegate method
       func didSaveTechnology(technology: String) {
           self.technology = technology
       }
}
