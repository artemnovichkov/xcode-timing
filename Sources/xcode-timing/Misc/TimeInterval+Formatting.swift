//
//  Created by Artem Novichkov on 11.03.2023.
//

import Foundation

extension TimeInterval {

    var formatted: String {
        let timeFormatter = DateComponentsFormatter()
        timeFormatter.allowedUnits = [.hour, .minute, .second]
        timeFormatter.unitsStyle = .abbreviated
        return timeFormatter.string(from: self)!
    }
}
