import UIKit
import MultiplexerController

class HomeController: UIViewController {
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private weak var multiplexer: MultiplexerController<State>!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupNavigationBar()
        setupData()
        
        loader.refresh()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        let multiplexer = MultiplexerController(initialState: State.loaded(weather: "🌤", temperature: 26))
        multiplexer.setDataSource(self)
        
        view.addSubview(multiplexer.view)
        multiplexer.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            multiplexer.view.topAnchor.constraint(equalTo: view.topAnchor),
            multiplexer.view.leftAnchor.constraint(equalTo: view.leftAnchor),
            multiplexer.view.rightAnchor.constraint(equalTo: view.rightAnchor),
            multiplexer.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        
        
        addChild(multiplexer)
        multiplexer.didMove(toParent: self)
        
        self.multiplexer = multiplexer
    }
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(didSelectRetry))
        navigationItem.title = "Weather Forecast: Paris, France"
    }
    
    private var loader = ForecastLoader()
    private func setupData() {
        loader.delegate = self
    }
}

extension HomeController: MultiplexerControllerDataSource {
    func controller(for controller: MultiplexerController<State>, inState state: State) -> UIViewController {
        switch state {
        case .loading:
            return LoadingViewController()
        case .error:
            let vc = ErrorViewController()
            vc.delegate = self
            
            return vc
        case .loaded(weather: let weather, temperature: let temperature):
            return ForecastViewController(weather, temperature: temperature)
        }
    }
}

extension HomeController: ForecastLoaderDelegate {
    func didChange(state: State) {
        multiplexer.set(state, animated: true)
    }
}

extension HomeController: ErrorViewControllerDelegate {
    @objc func didSelectRetry() {
        loader.refresh()
    }
}
