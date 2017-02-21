//
//  ViewController.swift
//  Paint-iRobot
//
//  Created by Nikhil Venkatesh Dasari on 2/4/17.
//  Copyright © 2017 Nikhil Venkatesh Dasari. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    //MARK: IBOutlets
    @IBOutlet weak var colorPicker: UIPickerView!
    @IBOutlet weak var clearDrawingButton: UIButton!
    @IBOutlet weak var drawView: DrawView!
    
    //colors to select 
    var colorsInPicker = ["Red" : UIColor.red , "Green" : UIColor.green, "Blue" : UIColor.blue]
    var selectedColor : UIColor?
    
    
    //MARK: Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        colorPicker.delegate = self
        colorPicker.dataSource = self
        drawView.backgroundColor = UIColor.black
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clearDrawing(_ sender: Any) {
        drawView.Lines = []
        drawView.setNeedsDisplay()
    }
    
    //MARK: PickerView Delegate Functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colorsInPicker.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedColorKey = Array(colorsInPicker.keys)[row]
        drawView.currentSelectedColor  = colorsInPicker[selectedColorKey]!
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = Array(colorsInPicker.keys)[row]
        let attributedTitle = NSAttributedString.init(string: title, attributes: [NSForegroundColorAttributeName: colorsInPicker[title] ?? UIColor.white])
        return attributedTitle
    }


}

