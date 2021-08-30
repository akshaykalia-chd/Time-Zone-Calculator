//
//  ComboOps.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 23/02/21.
//

import Foundation
import SQLite3

func timeZoneList() -> [String]{
    var timeZones: [String] = []
    let dbHandle = openDb()
    if let unwrappeddbHandle = dbHandle{
        var sqlStatment = "SELECT id FROM tzData"
        let tzIds = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)
        sqlStatment = "SELECT name FROM tzData"
        let tzNames = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)
        sqlStatment = "SELECT utcOffsetText FROM tzData"
        let utcOffsetText = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)
        sqlite3_close(unwrappeddbHandle)
        guard tzIds.count == tzNames.count && tzIds.count == utcOffsetText.count else {
            //print("tzData seems to be broken")
            return[""]
        }
        for i in tzIds.indices {
            timeZones.append(tzIds[i]+":"+tzNames[i]+":"+utcOffsetText[i])
        }
        }
return timeZones
}

func saveComboState(comboValue:String, comboName:String){
    let dbHandle = openDb()
    let value:String = "'"+comboValue+"'"
    let name:String = "'"+comboName+"'"
    let sqlStatement:String = "UPDATE ComboSaveState SET comboValue = "+value+" WHERE comboName = "+name+";"
    if let unwrappeddbHandle = dbHandle{
        update(dbPointer: unwrappeddbHandle, updateStatementString: sqlStatement)
        sqlite3_close(unwrappeddbHandle)}
}


func getComboState(comboName:String) -> String{
    let dbHandle = openDb()
    let name:String = "'"+comboName+"'"
    var outPut:[String]=[]
    let sqlStatement:String = "SELECT comboValue FROM ComboSaveState WHERE comboName = "+name+";"
    if let unwrappeddbHandle = dbHandle{
        outPut = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatement)
        sqlite3_close(unwrappeddbHandle)
        }
return outPut[0]
}
