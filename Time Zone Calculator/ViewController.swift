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
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData1.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData1.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData1.stringValue, dayOfMonth: day, monthNum: month)
        let utcTime = dateData1.dateValue
        print(utcOffset)
        dateData2.dateValue =  dateData1.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData1.dateValue + Double(utcOffset)
        print("INPU UTC TIME:\(utcTime)")*/
        }
    @IBAction func combo2Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData2.stringValue, comboName: "comboData2")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData2.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData2.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData2.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData2.dateValue + Double(utcOffset)*/
    }
    
    @IBAction func combo3Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData3.stringValue, comboName: "comboData3")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData3.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData3.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData3.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData3.dateValue +  Double(utcOffset)
        dateData2.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData3.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo4Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData4.stringValue, comboName: "comboData4")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData4.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData4.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData4.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData4.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo5Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData5.stringValue, comboName: "comboData5")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData5.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData5.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData5.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData5.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo6Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData6.stringValue, comboName: "comboData6")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData6.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData6.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData6.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData6.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo7Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData7.stringValue, comboName: "comboData7")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData7.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData7.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData7.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData7.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo8Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData8.stringValue, comboName: "comboData8")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData8.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData8.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData8.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData8.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo9Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData9.stringValue, comboName: "comboData9")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData9.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData9.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData9.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData9.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo10Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData10.stringValue, comboName: "comboData10")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData10.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData10.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData10.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData10.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo11Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData11.stringValue, comboName: "comboData11")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData11.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData11.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData11.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData11.dateValue + Double(utcOffset)*/
    }
    @IBAction func combo12Action(_ sender: NSComboBox) {
        saveComboState(comboValue: comboData12.stringValue, comboName: "comboData12")
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData12.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData12.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData12.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData12.dateValue + Double(utcOffset)*/
    }
    
    //Contorl Actions Datapicker
    @IBAction func datepicker1Action(_ sender: NSDatePicker) {        
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData1.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData1.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData1.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData1.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData1.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker2Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData2.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData2.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData2.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData2.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData2.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker3Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData3.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData3.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData3.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData3.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData3.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker4Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData4.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData4.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData4.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData4.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData4.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker5Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData5.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData5.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData5.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData5.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData5.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker6Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData6.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData6.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData6.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData6.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData6.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker7Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData7.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData7.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData7.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData7.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData7.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker8Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData8.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData8.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData8.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData8.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData8.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker9Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData9.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData9.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData9.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData9.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData9.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker10Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData10.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData10.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData10.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData10.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData10.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker11Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData11.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData11.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData11.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData11.dateValue + Double(utcOffset)
        dateData12.dateValue = dateData11.dateValue + Double(utcOffset)*/
    }
    @IBAction func datepicker12Action(_ sender: NSDatePicker) {
        /*let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        let day = Int(dateFormatter.string(from: dateData12.dateValue)) ?? 0
        dateFormatter.dateFormat = "M"
        let month = Int(dateFormatter.string(from: dateData12.dateValue)) ?? 0
        let utcOffset = getUtcOffet(timeZoneValue: comboData12.stringValue, dayOfMonth: day, monthNum: month)
        print(utcOffset)
        dateData1.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData2.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData3.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData4.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData5.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData6.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData7.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData8.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData9.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData10.dateValue = dateData12.dateValue + Double(utcOffset)
        dateData11.dateValue = dateData12.dateValue + Double(utcOffset)*/
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




    
