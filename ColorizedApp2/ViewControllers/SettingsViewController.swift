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
    
    var delegate: MainViewControllerDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 10
        setSettings()
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
    
    // MARK - Private method
    private func getRGB() -> [String: CGFloat] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return ["red":red, "green":green, "blue":blue]
    }
    
    private func setSettings() {
        let currentColorRGB: [String: CGFloat]
        currentColorRGB = getRGB()
        
        for (key, value) in currentColorRGB{
            switch key {
            case "red":
                redSlider.value = Float(value)
                valueRedLabel.text = String(format: "%.2f", value)
            case "green":
                greenSlider.value = Float(value)
                valueGreenLabel.text = String(format: "%.2f", value)
            default:
                blueSlider.value = Float(value)
                valueBlueLabel.text = String(format: "%.2f", value)
            }
        }
        colorView.backgroundColor = color
    }
}


