//
//  File.swift
//  
//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

struct BuildData: Codable {
    
    let project: String
    let date: Date
    var totalBuildTime: TimeInterval
    var lastStartDate: Date
    var totalBuilds: Int

    var averageBuildTime: TimeInterval {
        totalBuildTime / Double(max(totalBuilds, 1))
    }
}
