
import UIKit

class StackViewProgramatically: UIViewController {
    var propotionalStackView: UIStackView!
    let redView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
        view.backgroundColor = .red
        return view
    }()
    let greenView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: UIScreen.main.bounds.width/3, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
        view.backgroundColor = .green
        return view
    }()
    let blueView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 2*UIScreen.main.bounds.width/3, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
        view.backgroundColor = .blue
        return view
    }()

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {

        print(UIScreen.main.bounds.width)
        redView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
        greenView.frame = CGRect(x: UIScreen.main.bounds.width/3, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
        blueView.frame = CGRect(x: 2*UIScreen.main.bounds.width/3, y: 0, width: UIScreen.main.bounds.width/3, height: UIScreen.main.bounds.height)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        propotionalStackView = UIStackView()
        view.addSubview(propotionalStackView)

        propotionalStackView.addArrangedSubview(redView)
        propotionalStackView.addArrangedSubview(greenView)
        propotionalStackView.addArrangedSubview(blueView)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setStackView()
    }
    func setStackView() {
        propotionalStackView?.translatesAutoresizingMaskIntoConstraints = false
        let guide = self.view.safeAreaLayoutGuide
        propotionalStackView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        propotionalStackView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        propotionalStackView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        propotionalStackView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true

        propotionalStackView.spacing = 1
        propotionalStackView.axis = .horizontal
        propotionalStackView.distribution = .fillProportionally
        propotionalStackView.alignment = .fill

    }

}
