//
//  Created by Artem Novichkov on 11.03.2023.
//

import ArgumentParser
import Foundation

struct End: ParsableCommand {

    static var configuration: CommandConfiguration = .init(abstract: "Write end data for current project. Should be run from Xcode build suceeds of fails behaviours.")

    func run() throws {
        let projectName = try projectName()

        let fileManager = FileManager.default
        var buildData = try fileManager.makeBuildData()
        let endDate = Date()
        if let index = buildData.firstIndex(of: projectName, for: endDate) {
            let buildDuration = buildData[index].lastStartDate.distance(to: endDate)
            buildData[index].totalBuildTime += buildDuration
            buildData[index].totalBuilds += 1
        }
        try fileManager.write(buildData)
    }
}
