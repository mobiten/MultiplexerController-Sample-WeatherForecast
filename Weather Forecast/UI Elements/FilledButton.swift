import UIKit

class FilledButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)

        setTitle(title, for: .normal)
        titleLabel?.font = UIFont.systemFont(ofSize: 17.0, weight: .semibold)
        setTitleColor(UIColor.white, for: .normal)

        clipsToBounds = true
        layer.cornerRadius = 8

        backgroundColor = tintColor
    }

    override var intrinsicContentSize: CGSize {
        var newSize = super.intrinsicContentSize
        newSize.height += 12 * 2
        newSize.width += 16 * 2

        return newSize
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func tintColorDidChange() {
        super.tintColorDidChange()

        updateBackground()
    }

    private func updateBackground() {
        self.backgroundColor = self.tintColor
    }
}
