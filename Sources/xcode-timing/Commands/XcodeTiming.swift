//
//  Created by Artem Novichkov on 11.03.2023.
//

import ArgumentParser

struct XcodeTiming: ParsableCommand {

    static var configuration = CommandConfiguration(
        abstract: "An utility for tracking Xcode build times.",
        version: "0.1",
        subcommands: [Start.self, End.self, Show.self])
}
