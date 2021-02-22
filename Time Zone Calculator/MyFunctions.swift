//
//  MyFunctions.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 20/02/21.
//

import Foundation
import SQLite3

func timeZoneList() -> [String]{
    
    var timeZones: [String] = []
    for timeZone in TimeZone.abbreviationDictionary {
        let timeZoneName: String = timeZone.key + ":" + timeZone.value
        timeZones.append(timeZoneName)
        

    }
    let dbHandle = openTzDb()
    if let unwrappeddbHandle = dbHandle{
        let sqlStatment = "SELECT * FROM ComboSaveState"
        query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)
        sqlite3_close(unwrappeddbHandle)
    }

return timeZones
}

func openTzDb() -> OpaquePointer? {
    let dbUrl = try! FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("tzData.db")
    var db: OpaquePointer?
    if sqlite3_open(dbUrl.path, &db) == SQLITE_OK {
        print("Successfully opened connection to database at \(dbUrl.path)")
        return db
    }
    else {
        print("error opening database")
        sqlite3_close(db)
    }
return nil
}

func update(dbPointer:OpaquePointer, updateStatementString:String) {
    //let updateStatementString = "UPDATE ComboSaveState SET comboValue = 'Some TimeZone' WHERE comboName = 'Some comboName';"
    var updateStatement: OpaquePointer?
    if sqlite3_prepare_v2(dbPointer, updateStatementString, -1, &updateStatement, nil) == SQLITE_OK{
     if sqlite3_step(updateStatement) == SQLITE_DONE {
       print("\nSuccessfully updated row.")
     }
     else {
       print("\nCould not update row.")
     }
   }
   else {
     print("\nUPDATE statement is not prepared")
   }

sqlite3_finalize(updateStatement)
}
  
    
func query(dbPointer:OpaquePointer, queryStatementString:String) {
    //let queryStatementString = "SELECT 'Col Name' FROM 'Some Table Name';"
    //let queryStatementString = "SELECT 'Col Name' FROM 'Some Table Name' WHERE 'Col Name' = 'Col Val';"
    var queryStatement: OpaquePointer?
    if sqlite3_prepare_v2(dbPointer, queryStatementString,  -1, &queryStatement, nil) == SQLITE_OK {
      print("\n")
      while (sqlite3_step(queryStatement) == SQLITE_ROW) {
        //let id = sqlite3_column_int(queryStatement, 0)
        guard let queryResultCol1 = sqlite3_column_text(queryStatement, 1) else {
          print("Query result is nil.")
          return
        }
        let name = String(cString: queryResultCol1)
        print("Query Result:")
        print("\(name)")
      }
    } else {
        let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
        print("\nQuery is not prepared \(errorMessage)")
    }
    sqlite3_finalize(queryStatement)
  }
