import Foundation

enum State {
    case loading
    case error
    case loaded(weather: String, temperature: Int)
}
