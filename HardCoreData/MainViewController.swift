//
//  ContentView.swift
//  HardCoreData
//
//  Created by renks on 09.12.2019.
//  Copyright © 2019 Renald Renks. All rights reserved.
//

import UIKit
import SwiftUI

class MainViewController: UITableViewController {
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "HardCore Data"
        
        tableView.backgroundColor = #colorLiteral(red: 0.6279360796, green: 0.7099244768, blue: 0.8053722621, alpha: 1)
//        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.square.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(handleAddBand))
    
        setupNavBarStyle()
    }
    
    @objc fileprivate func handleAddBand() {
        print("adding company")
    }
 
    fileprivate func setupNavBarStyle() {
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.9987531304, green: 0.2995015085, blue: 0.2293531895, alpha: 1)
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        40
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = #colorLiteral(red: 0.9581218274, green: 0.9581218274, blue: 0.9581218274, alpha: 1)
        cell.textLabel?.font = .boldSystemFont(ofSize: 16)
        cell.textLabel?.text = "THE HARDCORE BAND"
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        8
    }
}





// SwiftUI Preview
struct MainControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
//                    .environment(\.colorScheme, .light)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainControllerPreview.ContainerView>) -> UIViewController {
            
            UINavigationController(rootViewController: MainViewController())
        }
        
        func updateUIViewController(_ uiViewController: MainControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainControllerPreview.ContainerView>) {
            
        }
    }
}
