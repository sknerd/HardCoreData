//
//  ContentView.swift
//  HardCoreData
//
//  Created by renks on 09.12.2019.
//  Copyright © 2019 Renald Renks. All rights reserved.
//

import UIKit
import SwiftUI

class BandsController: UITableViewController, AddBandControllerDelegate {
    
    var bands = [
        Band(name: "Agnostic Front", country: "USA", founded: Date()), // 1981
        Band(name: "Black Flag", country: "USA", founded: Date()), // 1976
        Band(name: "Minor Threat", country: "USA", founded: Date()), // 1980
        Band(name: "Sick of It All", country: "USA", founded: Date()), // 1986
        Band(name: "Converge", country: "USA", founded: Date()), // 1990
        Band(name: "H20", country: "USA", founded: Date()), // 1995
    ]
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        navigationItem.title = "HardCore Data"
        
        tableView.backgroundColor = #colorLiteral(red: 0.6279360796, green: 0.7099244768, blue: 0.8053722621, alpha: 1)
        tableView.tableFooterView = UIView()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.square.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(handleAddBand))
    }
    
    func didAddBand(band: Band) {
        bands.append(band)
        tableView.reloadData()
    }
    
    @objc fileprivate func handleAddBand() {
        
        let addBandController = AddBandController()
        let navController = UINavigationController(rootViewController: addBandController)
        
        
        addBandController.delegate = self
        
        present(navController, animated: true, completion: nil)
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
        
        let band = bands[indexPath.row]
        
        cell.textLabel?.font = .boldSystemFont(ofSize: 16)
        cell.textLabel?.text = band.name
        cell.textLabel?.textColor = .darkGray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        bands.count
    }
}



// SwiftUI Preview
struct MainControllerPreview: PreviewProvider {
    static var previews: some View {
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<MainControllerPreview.ContainerView>) -> UIViewController {
            
            UINavigationController(rootViewController: BandsController())
        }
        
        func updateUIViewController(_ uiViewController: MainControllerPreview.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<MainControllerPreview.ContainerView>) {
            
        }
    }
}
