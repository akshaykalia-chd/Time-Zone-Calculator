//
//  ViewController.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 18/02/21.
//

import Cocoa
import Foundation

class ViewController: NSViewController {
    
    private var comboBoxData = timeZoneList()
    
    
    //input Control variables
    @IBOutlet weak var inputTz: NSComboBox!
    @IBOutlet weak var inputDatedata: NSDatePicker!
    
    //output Contorl variables
    @IBOutlet weak var outputTz1: NSComboBox!
    @IBOutlet weak var outputDatedata1: NSDatePicker!
    
    @IBOutlet weak var outputTz2: NSComboBox!
    @IBOutlet weak var outputDatedata2: NSDatePicker!
    
    @IBOutlet weak var outputTz3: NSComboBox!
    @IBOutlet weak var outputDatedata3: NSDatePicker!
    
    @IBOutlet weak var outputTz4: NSComboBox!
    @IBOutlet weak var outputDatedata4: NSDatePicker!
    
    @IBOutlet weak var outputTz5: NSComboBox!
    @IBOutlet weak var outputDatedata5: NSDatePicker!
    
    @IBOutlet weak var outputTz6: NSComboBox!
    @IBOutlet weak var outputDatedata6: NSDatePicker!
    
    @IBOutlet weak var outputTz7: NSComboBox!
    @IBOutlet weak var outputDatedata7: NSDatePicker!
    
    @IBOutlet weak var outputTz8: NSComboBox!
    @IBOutlet weak var outputDatedata8: NSDatePicker!
    
    @IBOutlet weak var outputTz9: NSComboBox!
    @IBOutlet weak var outputDatedata9: NSDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        inputTz?.dataSource = self
        outputTz1?.dataSource = self
        outputTz2?.dataSource = self
        outputTz3?.dataSource = self
        outputTz4?.dataSource = self
        outputTz5?.dataSource = self
        outputTz6?.dataSource = self
        outputTz7?.dataSource = self
        outputTz8?.dataSource = self
        outputTz9?.dataSource = self
        
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
  
    //Control Actions Input Data
    
    @IBAction func inputTzSelected(_ sender: NSComboBox) {
        print("input Time Zone modifed \(inputTz.stringValue)")
        print("Date and time data is \(inputDatedata.dateValue)")
    }
    
    @IBAction func inputDatedataSelected(_ sender: NSDatePicker) {
        print("input Time Zone modifed \(inputTz.stringValue)")
        print("Date and time data is \(inputDatedata.dateValue)")
    }
    
   
    //Control Actions Output Data
    
    @IBAction func outputTz1Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz1.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata1.dateValue)")
    }
    
    @IBAction func outputDatedata1Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz1.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata1.dateValue)")
    }
    
    @IBAction func outputTz2Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz2.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata2.dateValue)")
    }
    
    @IBAction func outputDatedata2Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz2.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata2.dateValue)")
    }
    
    @IBAction func outputTz3Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz3.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata3.dateValue)")
    }
    
    @IBAction func outputDatedata3Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz3.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata3.dateValue)")
    }
    
    @IBAction func outputTz4Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz4.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata4.dateValue)")
    }
    
    @IBAction func outputDatedata4Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz4.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata4.dateValue)")
    }
    
    @IBAction func outputTz5Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz5.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata5.dateValue)")
    }
    
    @IBAction func outputDatedata5Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz5.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata5.dateValue)")
    }
    
    @IBAction func outputTz6Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz6.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata6.dateValue)")
    }
    
    @IBAction func outputDatedata6Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz6.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata6.dateValue)")
    }
    
    @IBAction func outputTz7Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz7.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata7.dateValue)")
    }
    
    @IBAction func outputDatedata7Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz7.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata7.dateValue)")
    }
    
    @IBAction func outputTz8Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz8.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata8.dateValue)")
    }
    
    @IBAction func outputDatedata8Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz8.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata8.dateValue)")
    }
    
    @IBAction func outputTz9Selected(_ sender: NSComboBox) {
        print("Out Time Zone modifed to \(outputTz9.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata9.dateValue)")
    }
    
    @IBAction func outputDatedata9Selected(_ sender: NSDatePicker) {
        print("Out Time Zone modifed to \(outputTz9.stringValue)")
        print("Output Date or Time modifed to \(outputDatedata9.dateValue)")
    }
      
}


extension ViewController: NSComboBoxDataSource {

    func numberOfItems(in comboBox: NSComboBox) -> Int {
        return comboBoxData.count
    }

    func comboBox(_ comboBox: NSComboBox, objectValueForItemAt index: Int) -> Any? {
     
        return comboBoxData[index]
    }
}




    
