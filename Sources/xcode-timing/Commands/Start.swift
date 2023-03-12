//
//  Created by Artem Novichkov on 11.03.2023.
//

import ArgumentParser
import Foundation

struct Start: ParsableCommand {

    static var configuration: CommandConfiguration = .init(abstract: "Write start data for current project. Should be run from Xcode build start behaviour.")

    func run() throws {
        let projectName = try projectName()
        let fileManager = FileManager.default
        var buildData = (try? fileManager.makeBuildData()) ?? []
        let startDate = Date()
        if let index = buildData.firstIndex(of: projectName, for: startDate) {
            buildData[index].lastStartDate = startDate
        } else {
            let newBuildData = BuildData(project: projectName,
                                         date: startDate,
                                         totalBuildTime: 0,
                                         lastStartDate: startDate,
                                         totalBuilds: 0)
            buildData.append(newBuildData)
        }
        try fileManager.write(buildData)
    }
}
