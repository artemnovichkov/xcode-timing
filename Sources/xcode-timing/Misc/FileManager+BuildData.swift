//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

extension FileManager {

    private enum Constants {

        static let fileName: String = "xcode-times.json"
    }

    private var fileURL: URL {
        let documentURL = urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentURL.appendingPathComponent(Constants.fileName)
    }

    func makeBuildData() throws -> [BuildData] {
        guard let data = contents(atPath: fileURL.path) else {
            return []
        }
        return try JSONDecoder().decode([BuildData].self, from: data)
    }

    func write(_ buildData: [BuildData]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let fileData = try encoder.encode(buildData)
        createFile(atPath: fileURL.path,
                   contents: fileData,
                   attributes: nil)
    }
}
