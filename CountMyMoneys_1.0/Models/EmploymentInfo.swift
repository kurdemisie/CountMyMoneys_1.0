//
//  EmploymentInfo.swift
//  CountMyMoneys_1.0
//
//  Created by Monika Herain on 3.10.2023.
//

import Foundation

class EmploymentInfo: Identifiable, Decodable {
    
//    var totalHours:Double
//    var totalWritings:Double
//    var totalSalary:Double
        
    var hourlyWage:Double
    var personalDiscount:Double
    var taxBracket1:Double
    var taxBracket2:Double
    var taxBracket3:Double
}
