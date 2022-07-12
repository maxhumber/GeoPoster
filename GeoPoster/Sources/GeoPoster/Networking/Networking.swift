import Foundation

public protocol Networking {
    @available(macOS 12.0, iOS 13.0, *)
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}
