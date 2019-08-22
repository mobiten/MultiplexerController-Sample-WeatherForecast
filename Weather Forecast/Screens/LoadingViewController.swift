import UIKit

class LoadingViewController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .groupTableViewBackground

        let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        activityIndicator.color = .gray
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        let label = UILabel(frame: .zero)
        label.text = "Loading your forecast"
        label.font = .preferredFont(forTextStyle: .body)
        label.translatesAutoresizingMaskIntoConstraints = false

        let stack = UIStackView(arrangedSubviews: [activityIndicator, label])
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
            container.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
        ])

        activityIndicator.startAnimating()
    }
}
