//
//  ViewController.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 18/02/21.
//

import Cocoa
import Foundation
import SQLite3

class ViewController: NSViewController {
    
    private var comboBoxData = timeZoneList()
    
    
    //input/Output Control variables
    @IBOutlet weak var
        comboData1,
        comboData2,
        comboData3,
        comboData4,
        comboData5,
        comboData6,
        comboData7,
        comboData8,
        comboData9,
        comboData10,
        comboData11,
        comboData12: NSComboBox!
    @IBOutlet weak var
        dateData1,
        dateData2,
        dateData3,
        dateData4,
        dateData5,
        dateData6,
        dateData7,
        dateData8,
        dateData9,
        dateData10,
        dateData11,
        dateData12 : NSDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        comboData1.dataSource = self
        comboData1.stringValue = getComboState(comboName: "comboData1")
        dateData1.dateValue = Date()
                
        comboData2.dataSource = self
        comboData2.stringValue = getComboState(comboName: "comboData2")
        dateData2.dateValue = Date()
        
        comboData3.dataSource = self
        comboData3.stringValue = getComboState(comboName: "comboData3")
        dateData3.dateValue = Date()
        
        comboData4.dataSource = self
        comboData4.stringValue = getComboState(comboName: "comboData4")
        dateData4.dateValue = Date()
        
        comboData5.dataSource = self
        comboData5.stringValue = getComboState(comboName: "comboData5")
        dateData5.dateValue = Date()
        
        comboData6.dataSource = self
        comboData6.stringValue = getComboState(comboName: "comboData6")
        dateData6.dateValue = Date()
        
        comboData7.dataSource = self
        comboData7.stringValue = getComboState(comboName: "comboData7")
        dateData7.dateValue = Date()
        
        comboData8.dataSource = self
        comboData8.stringValue = getComboState(comboName: "comboData8")
        dateData8.dateValue = Date()
        
        comboData9.dataSource = self
        comboData9.stringValue = getComboState(comboName: "comboData9")
        dateData9.dateValue = Date()
        
        comboData10.dataSource = self
        comboData10.stringValue = getComboState(comboName: "comboData10")
        dateData10.dateValue = Date()
        
        comboData11.dataSource = self
        comboData11.stringValue = getComboState(comboName: "comboData11")
        dateData11.dateValue = Date()
        
        comboData12.dataSource = self
        comboData12.stringValue = getComboState(comboName: "comboData12")
        dateData12.dateValue = Date()
               
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
  
    //Control Actions ComboBox
    
    @IBAction func combo1Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData1.stringValue, comboName: "comboData1")
        setToNow(timeZoneValue: comboData1.stringValue)
        }
    @IBAction func combo2Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData2.stringValue, comboName: "comboData2")
    }
    @IBAction func combo3Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData3.stringValue, comboName: "comboData3")
    }
    @IBAction func combo4Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData4.stringValue, comboName: "comboData4")
    }
    @IBAction func combo5Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData5.stringValue, comboName: "comboData5")
    }
    @IBAction func combo6Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData6.stringValue, comboName: "comboData6")
    }
    @IBAction func combo7Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData7.stringValue, comboName: "comboData7")
    }
    @IBAction func combo8Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData8.stringValue, comboName: "comboData8")
    }
    @IBAction func combo9Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData9.stringValue, comboName: "comboData9")
    }
    @IBAction func combo10Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData10.stringValue, comboName: "comboData10")
    }
    @IBAction func combo11Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData11.stringValue, comboName: "comboData11")
    }
    @IBAction func combo12Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData12.stringValue, comboName: "comboData12")
    }
    
    //Contorl Actions Datapicker
    @IBAction func datepicker1Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker2Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker3Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker4Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker5Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker6Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker7Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker8Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker9Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker10Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker11Action(_ sender: NSDatePicker) {
    }
    @IBAction func datepicker12Action(_ sender: NSDatePicker) {
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




    
