//
//  ViewController.swift
//  ColorizedApp2
//
//  Created by Elenka on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK -  IB Outlets
    @IBOutlet weak var valueRedLabel: UILabel!
    @IBOutlet weak var valueGreenLabel: UILabel!
    @IBOutlet weak var valueBlueLabel: UILabel!
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        valueRedLabel.text = String(redSlider.value)
        valueGreenLabel.text = String(greenSlider.value)
        valueBlueLabel.text = String(blueSlider.value)
    }
    
    // MARK -IB Actoins
    @IBAction func sliderChanged(_ sender: UISlider) {
        switch sender.tag {
        case 1:
            valueRedLabel.text = String(format: "%.1f", redSlider.value)
        case 2:
            valueGreenLabel.text = String(format: "%.1f", greenSlider.value)
        default:
            valueBlueLabel.text = String(format: "%.1f", blueSlider.value)
        }
    }
    

}
