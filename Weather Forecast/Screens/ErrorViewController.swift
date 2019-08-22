import UIKit

class ErrorViewController: UIViewController {
    weak var delegate: ErrorViewControllerDelegate?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .groupTableViewBackground

        let icon = UILabel(frame: .zero)
        icon.text = "🔥"
        icon.font = .systemFont(ofSize: 72.0)
        icon.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel(frame: .zero)
        label.text = "Something went wrong. \nPlease try again later."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView(arrangedSubviews: [icon, label])
        stack.axis = .vertical
        stack.alignment = .center
        stack.spacing = 8.0
        stack.translatesAutoresizingMaskIntoConstraints = false

        let button = FilledButton(title: "Retry")
        button.addTarget(self, action: #selector(didSelectRetry), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false

        let container = UIView(frame: .zero)
        container.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(container)
        container.addSubview(stack)
        container.addSubview(button)

        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: stack.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: stack.centerYAnchor),
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            container.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            container.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            container.layoutMarginsGuide.leftAnchor.constraint(equalTo: button.leftAnchor),
            container.layoutMarginsGuide.rightAnchor.constraint(equalTo: button.rightAnchor),
            container.bottomAnchor.constraint(equalTo: button.bottomAnchor)
        ])

    }

    @objc private func didSelectRetry() {
        delegate?.didSelectRetry()
    }
}

protocol ErrorViewControllerDelegate: class {
    func didSelectRetry()
}
