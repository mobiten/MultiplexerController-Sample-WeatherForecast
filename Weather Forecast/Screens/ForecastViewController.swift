import UIKit

class ForecastViewController: UIViewController {
    let weather: String
    let temperature: Int

    init(_ weather: String, temperature: Int) {
        self.weather = weather
        self.temperature = temperature

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        let icon = UILabel(frame: .zero)
        icon.text = weather
        icon.font = .systemFont(ofSize: 72.0)
        icon.translatesAutoresizingMaskIntoConstraints = false

        let temperatureLabel = UILabel(frame: .zero)
        temperatureLabel.text = "\(temperature)°"
        temperatureLabel.font = .preferredFont(forTextStyle: .largeTitle)
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView(arrangedSubviews: [icon, temperatureLabel])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8.0
        stack.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(container)
        container.addSubview(stack)

        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: stack.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: stack.centerYAnchor),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            container.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
        ])

    }
}
