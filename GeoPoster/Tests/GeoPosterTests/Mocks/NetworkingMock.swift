@testable import GeoPoster
import Foundation

class NetworkingMock: Networking {
    private var result: Result<Data, Error>
    
    init(_ result: Result<Data, Error>) {
        self.result = result
    }
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try (result.get(), URLResponse())
    }
}
