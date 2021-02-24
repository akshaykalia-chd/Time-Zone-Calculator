//
//  MyTimeOps.swift
//  Time Zone Calculator
//
//  Created by Akshay Kalia on 23/02/21.
//

import Foundation
import SQLite3

func getUtcOffet(timeZoneValue:String, dayOfMonth:Int, monthNum:Int) -> Int {
    var intUtcOffset = 0, intDst = 0, intDstEndDay = 0, intDstStartDay = 0, intDstEndMonth = 0, intDstStartMonth = 0, intUtcOffsetDst = 0
    let intCurrentMonth = monthNum
    let intCurrentDay = dayOfMonth
    var name = timeZoneValue.split(separator: ":")[1]
    name = "'"+name+"'"
    let dbHandle = openDb()
    if let unwrappeddbHandle = dbHandle{
        var sqlStatment = "SELECT dst FROM tzData WHERE name ="+name+";"
        let dst = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT utcOffset FROM tzData WHERE name ="+name+";"
        let utcOffset = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT utcOffsetDst FROM tzData WHERE name ="+name+";"
        let utcOffsetDst = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT dstStartMonth FROM tzData WHERE name ="+name+";"
        let dstStartMonth = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT dstEndMonth FROM tzData WHERE name ="+name+";"
        let dstEndMonth = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT dstStartDay FROM tzData WHERE name ="+name+";"
        let dstStartDay = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlStatment = "SELECT dstEndDay FROM tzData WHERE name ="+name+";"
        let dstEndDay = query(dbPointer: unwrappeddbHandle, queryStatementString: sqlStatment)[0]
        sqlite3_close(unwrappeddbHandle)
        intUtcOffset = Int(utcOffset) ?? 0
        intDst = Int(dst) ?? 0
        intDstEndDay = Int(dstEndDay) ?? 0
        intDstStartDay = Int(dstStartDay) ?? 0
        intDstEndMonth  = Int(dstEndMonth) ?? 0
        intDstStartMonth = Int(dstStartMonth) ?? 0
        intUtcOffsetDst = Int(utcOffsetDst) ?? 0
    }
    print("Current Month:\(intCurrentMonth)")
    print("Current Day:\(intCurrentDay)")
    print("DST Start Month:\(intDstStartMonth)")
    print("DST Start Day:\(intDstStartDay)")
    print("DST End Month:\(intDstEndMonth)")
    print("DST End Day:\(intDstEndDay)")
   
    if intDst == 0{
        print ("Time Zone does not follow DST returing UTC offset")
        return intUtcOffset
        }
    if intDstEndMonth > intDstStartMonth {
        if intCurrentMonth > intDstStartMonth {
                print ("DST Case Month > Start Month")
                return intUtcOffsetDst
        }
        if intCurrentMonth == intDstStartMonth && intCurrentDay >= intDstStartDay{
            print ("DST Case Month = Start Month and Day >= Start day")
            return intUtcOffsetDst
        }
    }
    if intDstEndMonth < intDstStartMonth {
        if intCurrentMonth > intDstStartMonth {
                print ("DST Case Next Year End. Month > Start Month")
                return intUtcOffsetDst
        }
        if intCurrentMonth == intDstStartMonth && intCurrentDay >= intDstStartDay {
            print ("DST Case Next Year End. Month = Start Month and day >= Start day")
            return intUtcOffsetDst
        }
        if intCurrentMonth < intDstEndMonth {
            print ("DST Case Next Year End. DST Case Month < End Month ")
            return intUtcOffsetDst
        }
        if intCurrentMonth == intDstEndMonth && intCurrentDay <= intDstEndDay{
            print ("DST Case Next Year End.DST Case Month = End Month and Day <= End Day")
            return intUtcOffsetDst
        }
    }
print ("No Match -- No DST")
return intUtcOffset
}












