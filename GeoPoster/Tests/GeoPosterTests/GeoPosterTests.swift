import XCTest
@testable import GeoPoster

final class GeoPosterTests: XCTestCase {
    func testEnd2End() async throws {
        let service = GeoPosterService("123", host: "httpbin.org", endpoint: "/anything", networking: URLSession.shared)
        let response = try await service.log(.toronto)
        XCTAssertEqual(response, GeoPosterResponse())
    }
    
    func testBadResponse() async throws {
        let error1 = URLError(.badServerResponse)
        let networkingMock = NetworkingMock(.failure(error1))
        let service = GeoPosterService("123", networking: networkingMock)
        do {
            _ = try await service.log(.toronto)
            XCTFail("Expected to throw while awaiting, but succeeded")
        } catch {
            XCTAssertEqual(error as? URLError, error1)
        }
    }
    
    func testGoodResponse() async throws {
        let response1 = GeoPosterResponse(foo: "🦄")
        let data = try JSONEncoder().encode(response1)
        let networkingMock = NetworkingMock(.success(data))
        let service = GeoPosterService("123", networking: networkingMock)
        let response = try await service.log(.toronto)
        XCTAssertEqual(response, response1)
    }
}
