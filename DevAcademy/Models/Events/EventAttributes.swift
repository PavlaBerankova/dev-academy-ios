import Foundation
// https://services6.arcgis.com/fUWVlHWZNxUvTUh8/arcgis/rest/services/Events/FeatureServer/0/query?where=1%3D1&outFields=categories,ID,name,text,tickets,tickets_info,images,url,organizer_email,tickets_url,date_from,date_to&outSR=4326&f=json

struct EventAttributes {
    let categories: String?
    let id: Int
    let name: String
    let text: String?
    let tickets: String?
    let ticketsInfo: String?
    let image: URL?
    let url: String?
    let email: String?
    let ticketsUrl: String?
    let timeStampFrom: Int
    let timeStampTo: Int

    enum CodingKeys: String, CodingKey {
        case categories
        case id = "ID"
        case name, text, tickets
        case ticketsInfo = "tickets_info"
        case image = "first_image"
        case url
        case email = "organizer_email"
        case ticketUrl = "tickets_url"
        case timeStampFrom = "date_from"
        case timeStampTo = "date_to"
    }
}

extension EventAttributes {
    var dateFrom: Date {
        Date(timeIntervalSince1970: TimeInterval(timeStampFrom) / 1_000)
    }

    var dateTo: Date {
        Date(timeIntervalSince1970: TimeInterval(timeStampTo) / 1_000)
    }
}
