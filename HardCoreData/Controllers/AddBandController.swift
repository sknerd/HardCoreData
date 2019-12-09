//
//  AddBandController.swift
//  HardCoreData
//
//  Created by renks on 09.12.2019.
//  Copyright © 2019 Renald Renks. All rights reserved.
//

import UIKit
import SwiftUI
import LBTATools

protocol AddBandControllerDelegate {
    func didAddBand(band: Band)
}

class AddBandController: UIViewController {
    
    var delegate: AddBandControllerDelegate?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        label.backgroundColor = .yellow
        return label
    }()
    
    let foundedLabel = UILabel(text: "Founded")
    
    let nameTextField = UITextField(placeholder: "Enter Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        navigationItem.title = "Add Band"
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(handleSave))
        
        view.backgroundColor = .white
    }
    
    fileprivate func setupUI() {
        
        let backGroundView = UIView()
        backGroundView.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        
        view.addSubview(backGroundView)
        backGroundView.fillSuperview()
        
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField])
        stackView.backgroundColor = .green
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.axis = .horizontal
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 0, height: 80))
        
    }
    
    @objc fileprivate func handleSave() {
        
        dismiss(animated: true) {
            let band = Band(name: self.nameTextField.text ?? "", country: "US", founded: Date())
            
            self.delegate?.didAddBand(band: band)
        }
    }
    
    @objc fileprivate func handleCancel() {
        dismiss(animated: true, completion: nil)
    }
}



// SwiftUI Preview
struct AddBandControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AddBandControllerPreview.ContainerView>) -> UIViewController {
            
            UINavigationController(rootViewController: AddBandController())
        }
        
        func updateUIViewController(_ uiViewController: AddBandControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AddBandControllerPreview.ContainerView>) {
            
        }
    }
}
