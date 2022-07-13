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
    
    var currentColorRGB: [String: CGFloat] = ["red":0.0]
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? SettingsViewController else { return }
        getRGBq()
        settingsVC.color = view.backgroundColor
        settingsVC.delegate = self
        settingsVC.currentColorRGB = currentColorRGB
    }
    
    func getRGBq() {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        view.backgroundColor?.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        currentColorRGB = ["red":red, "green":green, "blue":blue, "alpha":alpha]
        return
    }
    
}

// MARK: - MainViewControllerDelegate
extension MainViewController: MainViewControllerDelegate{
    func setNewValues(newColor: UIColor) {
        view.backgroundColor = newColor
    }
}


