import Foundation

extension String {
    func filteringWhiteSpace() -> String {
        self.filter { !$0.isWhitespace }
    }

    // CHECK URL ADDRESS
    func checkAndFixHasprefix() -> String {
        let httpProtocol = "https://"
        if self.hasPrefix("http://") || self.hasPrefix("https://") {
            return self.filteringWhiteSpace()
        } else {
            return httpProtocol + self.filteringWhiteSpace()
        }
    }

    func simpleStringFromUrl() -> String {
        if self == "-" {
            return self
        } else {
            let urlComponents = URLComponents(string: self)! // --> http//www.example.com
            let prefixToRemove = "www."
            let relativeURL = urlComponents.host ?? "" // --> www.example.com
            if relativeURL.hasPrefix(prefixToRemove) {
                return String(relativeURL.dropFirst(prefixToRemove.count)) // --> example.com
            }
            return relativeURL
        }
    }
}
