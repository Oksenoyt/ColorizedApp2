//
//  ViewController.swift
//  ColorizedApp2
//
//  Created by Elenka on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK -  IB Outlets
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var color: UIColor!
    var currentColorRGB: [String: CGFloat]!
    
    var delegate: MainViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        redSlider.value = Float(currentColorRGB["red"] ?? 0)
        greenSlider.value = Float(currentColorRGB["green"] ?? 0)
        blueSlider.value = Float(currentColorRGB["blue"] ?? 0)
        colorView.backgroundColor = color
    }
    
    
    // MARK -IB Actoins
    @IBAction func sliderChanged(_ sender: UISlider) {
        color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        
        switch sender.tag {
        case 1:
            valueRedLabel.text = String(format: "%.2f", redSlider.value)
            colorView.backgroundColor = color
        case 2:
            valueGreenLabel.text = String(format: "%.2f", greenSlider.value)
            colorView.backgroundColor = color
        default:
            valueBlueLabel.text = String(format: "%.2f", blueSlider.value)
            colorView.backgroundColor = color
        }
    }
    
    @IBAction func closeSettings() {
        delegate.setNewValues(newColor: color)
        dismiss(animated: true)
    }
}

