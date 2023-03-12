//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

extension Array where Element == BuildData {


    func firstIndex(of projectName: String, for date: Date) -> Int? {
        firstIndex(where: { $0.project == projectName && $0.date.isSameDay(with: date) })
    }
}
