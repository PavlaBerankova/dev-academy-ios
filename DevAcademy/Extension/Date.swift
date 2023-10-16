import Foundation

extension Date {
    func dateFormat() -> String {
        DateFormatter.localizedString(from: self, dateStyle: .long, timeStyle: .short)
    }
}
