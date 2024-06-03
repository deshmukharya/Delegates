//
//  ViewControllerC.swift
//  DataPassing
//
//  Created by Arya Deshmukh on 01/06/24.
//

import UIKit

protocol ViewControllerCDelegate: AnyObject {
    func didSaveTechnology(technology: String)
}

class ViewControllerC: UIViewController {
    
    weak var delegate: ViewControllerCDelegate?
    
    // UI Elements
    lazy var technologyTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter technology"
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.addTarget(self, action: #selector(saveTechnology), for: .touchUpInside)
        return button
    }()
    
    lazy var navigateBackButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Back to ViewController B", for: .normal)
        button.addTarget(self, action: #selector(navigateBackToViewControllerB), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
        view.addSubview(technologyTextField)
        view.addSubview(saveButton)
        view.addSubview(navigateBackButton)
        
        // Constraints for technologyTextField
        NSLayoutConstraint.activate([
            technologyTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            technologyTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            technologyTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        // Constraints for saveButton
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: technologyTextField.bottomAnchor, constant: 20),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Constraints for navigateBackButton
        NSLayoutConstraint.activate([
            navigateBackButton.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 20),
            navigateBackButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func saveTechnology() {
        guard let technology = technologyTextField.text else { return }
        delegate?.didSaveTechnology(technology: technology)
        navigationController?.popViewController(animated: true)
    }
    
    @objc func navigateBackToViewControllerB() {
        navigationController?.popViewController(animated: true)
    }
    
}
