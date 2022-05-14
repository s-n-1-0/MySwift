//
//  Date.swift
//  
//
//  Created by Mac10 on 2022/05/14.
//

import Foundation
extension Date{
    /**
      時間以下を切り落とします。
     */
    func truncateHms() -> Date{
        let cal = Calendar.gregorianCalendar
        let comps = cal.dateComponents([.year, .month, .day], from: self)
        return cal.date(from: comps)!
    }
}
