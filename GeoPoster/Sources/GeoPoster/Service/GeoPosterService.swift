import Foundation
import CoreLocation

public class GeoPosterService {
    private let userAgent = "GeoPoster iOS 1.0"
    private let host: String
    private let endpoint: String
    private let apiKey: String
    private let networking: Networking
    
    /// Initialize the service
    /// - Parameter apiKey: Please contact sales/support to get an API Key
    public init(_ apiKey: String) {
        self.host = "api.eqworks.com"
        self.endpoint = "/v1/geoposter"
        self.networking = URLSession.shared
        self.apiKey = apiKey
    }
    
    init(_ apiKey: String, host: String = "httpbin.org", endpoint: String = "/anything", networking: Networking = URLSession.shared) {
        self.host = host
        self.endpoint = endpoint
        self.networking = networking
        self.apiKey = apiKey
    }
    
    /// Log a location as a POST Request to the server
    /// - Parameters:
    ///   - location: The user's location
    ///   - timestamp: Datetime of location
    ///   - extra: Extra information/notes about location
    /// - Returns: GeoPosterResponse
    @available(iOS 13.0, macOS 12.0, *)
    public func log(_ location: CLLocationCoordinate2D = .zero, timestamp: Date = .init(), extra: String? = nil) async throws -> GeoPosterResponse {
        let payload = GeoPosterPayload(location, time: timestamp, ext: extra)
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = endpoint
        guard let url = components.url else { throw URLError(.badURL) }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue(userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(apiKey, forHTTPHeaderField: "API-Key")
        request.httpBody = try? JSONEncoder().encode(payload)
        let (data, _) = try await networking.data(for: request)
        let response = try JSONDecoder().decode(GeoPosterResponse.self, from: data)
        return response
    }
}
