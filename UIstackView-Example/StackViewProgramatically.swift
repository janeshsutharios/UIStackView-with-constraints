import UIKit
class StackViewProgramatically: UIViewController {
    var propotionalStackView: UIStackView!
    let redView: UIView = {
        let view = UIView()//taking 42 % initially
        view.frame = CGRect(x: 0, y: 0, width: 42 * UIScreen.main.bounds.width/100, height: UIScreen.main.bounds.height)
        view.backgroundColor = .red
        return view
    }()

    let greenView: UIView = {
        let view = UIView()//taking 42* initially
        view.frame = CGRect(x: 42 * UIScreen.main.bounds.width/100, y: 0, width: 25 * UIScreen.main.bounds.width/100, height: UIScreen.main.bounds.height)
        view.backgroundColor = .green
        return view
    }()
    let blueView: UIView = {
        let view = UIView()//taking 33*initially
        view.frame = CGRect(x: 67 * UIScreen.main.bounds.width/100, y: 0, width: 33 * UIScreen.main.bounds.width/100, height: UIScreen.main.bounds.height)
        view.backgroundColor = .blue
        return view
    }()

    //Changing UIView frame to supports landscape mode.
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        DispatchQueue.main.async {
            self.redView.frame = CGRect(x: 0, y: 0, width: 42 * self.widthPercent, height: self.screenHeight)
            self.greenView.frame = CGRect(x: 42 * self.widthPercent, y: 0, width: 25 * self.widthPercent, height: self.screenHeight)
            self.blueView.frame = CGRect(x: 67 * self.widthPercent, y: 0, width: 33 * self.widthPercent, height: self.screenHeight)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Adding subViews to the stackView
        propotionalStackView = UIStackView()
        propotionalStackView.addSubview(redView)
        propotionalStackView.addSubview(greenView)
        propotionalStackView.addSubview(blueView)
        propotionalStackView.spacing = 0
        propotionalStackView.axis = .horizontal
        propotionalStackView.distribution = .fillProportionally
        propotionalStackView.alignment = .fill
        view.addSubview(propotionalStackView)
    }
}
//MARK: UIscreen helper extension
extension NSObject {

    var widthPercent: CGFloat {
        return UIScreen.main.bounds.width/100
    }
    
    var screenHeight: CGFloat {
        return UIScreen.main.bounds.height
    }
}
