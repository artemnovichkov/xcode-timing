//
//  Created by Artem Novichkov on 11.03.2023.
//

import ArgumentParser
import Foundation
import SwiftyTextTable

struct Show: ParsableCommand {

    static var configuration: CommandConfiguration = .init(abstract: "Show collected statistics for build times")

    @Option(name: [.customShort("n"), .long], help: "The name of the project.")
    var projectName: String?

    func run() throws {
        let buildData = try FileManager.default.makeBuildData()
        if buildData.isEmpty {
            print("No build data")
            return
        }

        var textTable: TextTable
        if let projectName {
            textTable = TextTable(columns: [
                .init(header: "Total Builds"),
                .init(header: "Total Build Time"),
                .init(header: "Average Build Time")
            ])
            let projectBuildData = buildData.filter({$0.project.lowercased() == projectName.lowercased() })
            if projectBuildData.isEmpty {
                print("No data for " + projectName)
                return
            }
            var totalBuilds = 0
            var totalBuildTime: TimeInterval = 0
            for data in projectBuildData {
                totalBuilds += data.totalBuilds
                totalBuildTime += data.totalBuildTime
            }
            let averageBuildTime: TimeInterval = totalBuildTime / Double(max(totalBuilds, 1))
            let firstBuildDateString = projectBuildData.first!.date.formatted(date: .numeric, time: .omitted)
            let lastBuildDateString = projectBuildData.last!.date.formatted(date: .numeric, time: .omitted)
            textTable.header = "Build statistics for \(projectName) (\(firstBuildDateString)-\(lastBuildDateString))"
            textTable.addRow(values: [totalBuilds,
                                      totalBuildTime.formatted,
                                      averageBuildTime.formatted])
        }
        else {
            textTable = TextTable(columns: [
                .init(header: "Date"),
                .init(header: "Project Name"),
                .init(header: "Total Build Time"),
                .init(header: "Average Build Time")
            ])
            for data in buildData {
                textTable.addRow(values: [data.date.formatted(date: .numeric, time: .omitted),
                                          data.project,
                                          data.totalBuildTime.formatted,
                                          data.averageBuildTime.formatted])
            }
        }

        print(textTable.render())
    }
}
