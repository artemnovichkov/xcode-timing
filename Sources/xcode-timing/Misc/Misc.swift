//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

enum XcodeTimingError: Error {

    case missingProject
}

extension XcodeTimingError: CustomStringConvertible {

    var description: String {
        switch self {
        case .missingProject:
            return "There are no XcodeWorkspace or XcodeProject environment variable"
        }
    }
}

func projectName() throws -> String {
    let environment = ProcessInfo.processInfo.environment
    guard let projectName = environment["XcodeWorkspace"] ?? environment["XcodeProject"] else {
        throw XcodeTimingError.missingProject
    }
    return projectName
}
