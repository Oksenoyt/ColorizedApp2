//
//  MainViewController.swift
//  ColorizedApp2
//
//  Created by Elenka on 13.07.2022.
//

import UIKit

protocol MainViewControllerDelegate {
    func setNewValues(newColor: UIColor)
}

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
    }
    
}

// MARK: - MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate{
    func setNewValues(newColor: UIColor) {
        view.backgroundColor = newColor
    }
}


