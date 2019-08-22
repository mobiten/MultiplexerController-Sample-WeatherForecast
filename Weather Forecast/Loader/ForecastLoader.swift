import UIKit

class ForecastLoader {
    weak var delegate: ForecastLoaderDelegate?

    private weak var timer: Timer?

    func refresh() {
        timer?.invalidate()

        delegate?.didChange(state: .loading)

        let randomTime = Int.random(in: 0...3)
        timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(randomTime), repeats: false) { (_) in
            DispatchQueue.main.async { [weak self] in
                let success = Int.random(in: 0...5) != 0
                let weather = ["⚡️", "🌤", "☁️", "🌧", "❄️"].randomElement()!
                let temperature = Int.random(in: -8...38)

                if (success) {
                    self?.delegate?.didChange(state: .loaded(weather: weather, temperature: temperature))
                } else {
                    self?.delegate?.didChange(state: .error)
                }
            }
        }
    }
}

protocol ForecastLoaderDelegate: class {
    func didChange(state: State)
}
