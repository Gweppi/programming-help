struct Search: Codable {
    var query: [SearchResults]
}

struct SearchResults: Codable {
    var title: String?
    var snippet: String?
}

try JSONDecoder().decode(Search.self, from: data)
