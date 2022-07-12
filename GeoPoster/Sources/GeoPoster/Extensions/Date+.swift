import Foundation

extension Date {
    var epochTimestamp: Int64 {
        let roundedValue = timeIntervalSince1970.rounded(.toNearestOrEven)
        return Int64(exactly: roundedValue)!
    }
}
