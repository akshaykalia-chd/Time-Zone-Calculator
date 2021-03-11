//
//  MyFunctions.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 20/02/21.
//

import Foundation
import SQLite3
import Cocoa

func getDBurl() -> URL {
    let mainBundle = Bundle.main
    //let dbPath = mainBundle.path(forResource: "tzData", ofType: "db")
    let dbPath = mainBundle.url(forResource: "tzData", withExtension: "db")
    if let path = dbPath{
        return path
        
    }
    return mainBundle.bundleURL
}

func openDb() -> OpaquePointer? {
    let dbUrl = try! FileManager.default
        .url(for: .applicationSupportDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        .appendingPathComponent("tzData.db")
    var db: OpaquePointer?
    if sqlite3_open(dbUrl.path, &db) == SQLITE_OK  {
        //print("Successfully opened connection to database at \(dbUrl.path)")
        return db
    }
    /*if sqlite3_open(dbUrl.path, &db) == SQLITE_OK {
        //print("Successfully opened connection to database at \(dbUrl.path)")
        return db
    }*/
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
  
    
func query(dbPointer:OpaquePointer, queryStatementString:String) -> [String]{
    // SELECT 'Some Col' FROM 'Some Table' WHERE 'Seom Col' = 'Some val';
    var queryStatement: OpaquePointer?
    if sqlite3_prepare_v2(dbPointer, queryStatementString,  -1, &queryStatement, nil) == SQLITE_OK {
        var outPut: [String] = []
            while (sqlite3_step(queryStatement) == SQLITE_ROW) {
                if let queryResultCol = sqlite3_column_text(queryStatement, 0){
                outPut.append(String(cString: queryResultCol))
                }
                else {print("Query result is nil.")
                }
            }
        sqlite3_finalize(queryStatement)
        return outPut
        }
    else {
    let errorMessage = String(cString: sqlite3_errmsg(dbPointer))
    print("\nQuery is not prepared \(errorMessage)")
    }
sqlite3_finalize(queryStatement)
return [""]
}





