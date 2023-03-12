//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

extension Date {

    func isSameDay(with date: Date) -> Bool {
        let diff = Calendar.current.dateComponents([.day], from: self, to: date)
        return diff.day == 0
    }
}
