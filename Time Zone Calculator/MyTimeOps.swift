//
//  MyTimeOps.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 23/02/21.
//

import Foundation
import SQLite3

func getUtcOffet(timeZoneValue:String) -> Int {
    var name = timeZoneValue.split(separator: ":")[1]
    name = "'"+name+"'"
    let dbHandle = openDb()
    if let unwrappeddbHandle = dbHandle{
        var sqlStatment = "SELECT dst FROM tzData WHERE name ="+name+";"
        let dst = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT utcOffset FROM tzData WHERE name ="+name+";"
        let utcOffset = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        
        let intUtcOffset = Int(utcOffset)!
        let intDst = Int(dst)
        
        if intDst == 0{
            sqlite3_close(unwrappeddbHandle)
            return intUtcOffset
        }
        else {
            sqlStatment = "SELECT utcOffsetDst FROM tzData WHERE name ="+name+";"
            let utcOffsetDst = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
            sqlStatment = "SELECT dstStartMonth FROM tzData WHERE name ="+name+";"
            let dstStartMonth = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
            sqlStatment = "SELECT dstEndtMonth FROM tzData WHERE name ="+name+";"
            let dstEndMonth = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
            
            let intDstEndMonth  = Int(dstEndMonth) ?? 0
            let intDstStartMonth = Int(dstStartMonth) ?? 0
            let intUtcOffsetDst = Int(utcOffsetDst) ?? 0
            let date = Date()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "m"
            let currentMonth = dateFormatter.string(from: date)
            let intCurrentMonth = Int(currentMonth) ?? 0
            if intCurrentMonth > intDstStartMonth {
                return intUtcOffsetDst
                
            }
            
            if intCurrentMonth == intDstStartMonth {
                sqlStatment = "SELECT dstStartDay FROM tzData WHERE name ="+name+";"
                let dstStartDay = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
                let intDstStartDay = Int(dstStartDay) ?? 0
                dateFormatter.dateFormat = "d"
                let currentDay = dateFormatter.string(from: date)
                let intCurrentDay = Int(currentDay) ?? 0
                    if intCurrentDay >= intDstStartDay{
                    return intUtcOffsetDst
                    }
                    else {return intUtcOffset}
            }
            
            if intCurrentMonth < intDstEndMonth  {
                return intUtcOffsetDst
            }
            
            if intCurrentMonth == intDstEndMonth  {
                sqlStatment = "SELECT dstEndDay FROM tzData WHERE name ="+name+";"
                let dstEndDay = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
                let intDstEndDay = Int(dstEndDay) ?? 0
                dateFormatter.dateFormat = "d"
                let currentDay = dateFormatter.string(from: date)
                let intCurrentDay = Int(currentDay) ?? 0
                    if intCurrentDay <= intDstEndDay{
                    return intUtcOffsetDst
                    }
                    else {return intUtcOffset}
                
            }
                        
        }
            
    sqlite3_close(unwrappeddbHandle)
    }
    return 0
}

