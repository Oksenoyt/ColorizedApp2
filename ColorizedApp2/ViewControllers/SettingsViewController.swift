//
//  ViewController.swift
//  ColorizedApp2
//
//  Created by Elenka on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    // MARK -  IB Outlets
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redTextField: UITextField!
    @IBOutlet weak var greenTextField: UITextField!
    @IBOutlet weak var blueTextField: UITextField!
    
    // MARK -  Public Properties
    var color: UIColor!
    var delegate: MainViewControllerDelegate!
    
    var currentColor: [String: Float] = ["red": 0]
    
    // MARK -  Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate  = self
        
        colorView.layer.cornerRadius = 10
        setSettingsFromMainScreen()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK -IB Actoins
    @IBAction func sliderChanged(_ sender: UISlider) {
        getColorFromSliders()
        
        switch sender.tag {
        case 1:
            currentColor["red"] = redSlider.value
            setNewSettings()
        case 2:
            currentColor["green"] = greenSlider.value
            setNewSettings()
        default:
            currentColor["blue"] = blueSlider.value
            setNewSettings()
        }
    }
    
    @IBAction func closeSettings() {
        view.endEditing(true)
        delegate.setNewValues(newColor: color)
        dismiss(animated: true)
    }
    
    // MARK - Private methods
    private func getRGBFromView() -> [String: Float] {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        
        color.getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        return ["red": Float(red), "green":Float(green), "blue":Float(blue)]
    }
    
    private func getColorFromSliders() {
        color = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func setSettingsFromMainScreen() {
        currentColor = getRGBFromView()
        setNewSettings()
    }
    
    private func setNewSettings() {
        for (key, value) in currentColor{
            switch key {
            case "red":
                redSlider.value = value
                valueRedLabel.text = String(format: "%.2f", value)
                redTextField.text = String(format: "%.2f", value)
            case "green":
                greenSlider.value = value
                valueGreenLabel.text = String(format: "%.2f", value)
                greenTextField.text = String(format: "%.2f", value)
            default:
                blueSlider.value = value
                valueBlueLabel.text = String(format: "%.2f", value)
                blueTextField.text = String(format: "%.2f", value)
            }
        }
        getColorFromSliders()
        colorView.backgroundColor = color
    }
}

//MARK: - UITextFildDelegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let value = Float(newValue) else {
            showAlert(title: "Значение не задано 🙁", message: "Укажите значение от 0 до 1")
            return
        }
        switch textField.tag {
        case 1:
            currentColor["red"] = value
            setNewSettings()
        case 2:
            currentColor["green"] = value
            setNewSettings()
        default:
            currentColor["blue"] = value
            setNewSettings()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
    }
}

//MARK: - UIAlertController
extension SettingsViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

