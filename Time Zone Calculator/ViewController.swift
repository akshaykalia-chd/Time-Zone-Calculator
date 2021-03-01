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
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        var utcOffset: Int = 0
        comboData1.dataSource = self
        comboData1.stringValue = getComboState(comboName: "comboData1")
        utcOffset = getUtcOffet(timeZoneValue: comboData1.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData1.dateValue = date
        
        comboData2.dataSource = self
        comboData2.stringValue = getComboState(comboName: "comboData2")
        utcOffset = getUtcOffet(timeZoneValue: comboData2.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData2.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData2.dateValue = date
        
        comboData3.dataSource = self
        comboData3.stringValue = getComboState(comboName: "comboData3")
        utcOffset = getUtcOffet(timeZoneValue: comboData3.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData3.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData3.dateValue = date
        
        comboData4.dataSource = self
        comboData4.stringValue = getComboState(comboName: "comboData4")
        utcOffset = getUtcOffet(timeZoneValue: comboData4.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData4.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData4.dateValue = date
        
        comboData5.dataSource = self
        comboData5.stringValue = getComboState(comboName: "comboData5")
        utcOffset = getUtcOffet(timeZoneValue: comboData5.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData5.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData5.dateValue = date
        
        comboData6.dataSource = self
        comboData6.stringValue = getComboState(comboName: "comboData6")
        utcOffset = getUtcOffet(timeZoneValue: comboData6.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData6.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData6.dateValue = date
        
        comboData7.dataSource = self
        comboData7.stringValue = getComboState(comboName: "comboData7")
        utcOffset = getUtcOffet(timeZoneValue: comboData7.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData7.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData7.dateValue = date
        
        comboData8.dataSource = self
        comboData8.stringValue = getComboState(comboName: "comboData8")
        utcOffset = getUtcOffet(timeZoneValue: comboData8.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData8.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData8.dateValue = date
        
        comboData9.dataSource = self
        comboData9.stringValue = getComboState(comboName: "comboData9")
        utcOffset = getUtcOffet(timeZoneValue: comboData9.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData9.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData9.dateValue = date
        
        comboData10.dataSource = self
        comboData10.stringValue = getComboState(comboName: "comboData10")
        utcOffset = getUtcOffet(timeZoneValue: comboData10.stringValue, dayOfMonth: day, monthNum: month)
        dateData10.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData10.dateValue = date
        
        comboData11.dataSource = self
        comboData11.stringValue = getComboState(comboName: "comboData11")
        utcOffset = getUtcOffet(timeZoneValue: comboData11.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData11.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData11.dateValue = date
        
        comboData12.dataSource = self
        comboData12.stringValue = getComboState(comboName: "comboData12")
        utcOffset = getUtcOffet(timeZoneValue: comboData12.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData12.timeZone = TimeZone(secondsFromGMT:utcOffset)
        dateData12.dateValue = date
        
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
  
    //Control Actions ComboBox
    
    @IBAction func combo1Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData1.stringValue, comboName: "comboData1")
        let date = dateData1.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData1.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData1.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo2Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData2.stringValue, comboName: "comboData2")
        let date = dateData2.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData2.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData2.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo3Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData3.stringValue, comboName: "comboData3")
        let date = dateData3.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData3.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData3.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo4Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData4.stringValue, comboName: "comboData4")
        let date = dateData4.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData4.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData4.stringValue, dayOfMonth: day, monthNum: month))
        
        
    }
    @IBAction func combo5Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData5.stringValue, comboName: "comboData5")
        let date = dateData5.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData5.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData5.stringValue, dayOfMonth: day, monthNum: month))
        
        
    }
    @IBAction func combo6Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData6.stringValue, comboName: "comboData6")
        let date = dateData6.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData6.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData6.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo7Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData7.stringValue, comboName: "comboData7")
        let date = dateData7.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData7.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData7.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo8Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData8.stringValue, comboName: "comboData8")
        let date = dateData8.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData8.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData8.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo9Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData9.stringValue, comboName: "comboData9")
        let date = dateData9.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData9.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData9.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo10Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData10.stringValue, comboName: "comboData10")
        let date = dateData10.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData10.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData10.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo11Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData11.stringValue, comboName: "comboData11")
        let date = dateData11.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData11.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData11.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    @IBAction func combo12Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData12.stringValue, comboName: "comboData12")
        let date = dateData12.dateValue
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: date)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: date)) ?? 0
        dateData12.timeZone = TimeZone(secondsFromGMT:getUtcOffet(timeZoneValue: comboData12.stringValue, dayOfMonth: day, monthNum: month))
        
    }
    
    //Contorl Actions Datapicker
    @IBAction func datepicker1Action(_ sender: NSDatePicker) {
        let date = dateData1.dateValue
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
                
        
    }
    @IBAction func datepicker2Action(_ sender: NSDatePicker) {
        let date = dateData2.dateValue
        dateData1.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker3Action(_ sender: NSDatePicker) {
        let date = dateData3.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker4Action(_ sender: NSDatePicker) {
        let date = dateData4.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker5Action(_ sender: NSDatePicker) {
        let date = dateData5.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker6Action(_ sender: NSDatePicker) {
        let date = dateData6.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker7Action(_ sender: NSDatePicker) {
        let date = dateData7.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker8Action(_ sender: NSDatePicker) {
        let date = dateData8.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
    }
    @IBAction func datepicker9Action(_ sender: NSDatePicker) {
        let date = dateData9.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
        
    }
    @IBAction func datepicker10Action(_ sender: NSDatePicker) {
        let date = dateData10.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData11.dateValue = date
        dateData12.dateValue = date
        
        
    }
    @IBAction func datepicker11Action(_ sender: NSDatePicker) {
        let date = dateData11.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData12.dateValue = date
        
        
    }
    @IBAction func datepicker12Action(_ sender: NSDatePicker) {
        let date = dateData12.dateValue
        dateData1.dateValue = date
        dateData2.dateValue = date
        dateData3.dateValue = date
        dateData4.dateValue = date
        dateData5.dateValue = date
        dateData6.dateValue = date
        dateData7.dateValue = date
        dateData8.dateValue = date
        dateData9.dateValue = date
        dateData10.dateValue = date
        dateData11.dateValue = date
        
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




    
