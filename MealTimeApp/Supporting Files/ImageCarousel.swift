
import UIKit

class ImageCarouselView: UIView {
    
    private let meals: [CategorizedMeal?]
    private var images: [UIImage?]
    private var index = 0
    private let screenWidth = UIScreen.main.bounds.width

    var delegate: ImageCarouselViewDelegate?

    lazy var previousImageView = imageView(image: nil, contentMode: .scaleAspectFit)
    lazy var currentImageView = imageView(image: nil, contentMode: .scaleAspectFit)
    lazy var nextImageView = imageView(image: nil, contentMode: .scaleAspectFit)

    lazy var previousImageLeadingConstraint: NSLayoutConstraint = {
        return previousImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -screenWidth)
    }()

    lazy var currentImageLeadingConstraint: NSLayoutConstraint = {
        return currentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
    }()

    lazy var nextImageLeadingConstraint: NSLayoutConstraint = {
        return nextImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth)
    }()
    
    init(_ meals: [CategorizedMeal?]) {
        self.meals = meals
        self.images = [UIImage()]
        
        super.init(frame: .zero)

        self.images = []
        for item in meals {
            let iv = UIImageView()
            iv.loadImageWithURL(item?.imageURL)
            self.images.append(iv.image)
        }
        
        self.translatesAutoresizingMaskIntoConstraints = false

        setupLayout()
        setupImages()
        setupSwipeRecognizer()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        self.subviews.forEach({ $0.removeFromSuperview() })

        addSubview(previousImageView)
        addSubview(currentImageView)
        addSubview(nextImageView)

        previousImageLeadingConstraint = previousImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -screenWidth)
        currentImageLeadingConstraint = currentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
        nextImageLeadingConstraint = nextImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth)

        NSLayoutConstraint.activate([
            previousImageLeadingConstraint,
            previousImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            previousImageView.widthAnchor.constraint(equalToConstant: screenWidth),

            currentImageLeadingConstraint,
            currentImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            currentImageView.widthAnchor.constraint(equalToConstant: screenWidth),

            nextImageLeadingConstraint,
            nextImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            nextImageView.widthAnchor.constraint(equalToConstant: screenWidth),
        ])
    }

    private func setupImages() {

        guard images.count > 1 else { return }

        if (index == 0) {
            previousImageView.image = images[images.count - 1]
            nextImageView.image = images[index + 1]
        }

        if (index == (images.count - 1)) {
            previousImageView.image = images[index - 1]
            nextImageView.image = images[0]
        }
    }

    private func setupSwipeRecognizer() {
        guard images.count > 1 else { return }

        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))

        leftSwipe.direction = .left
        rightSwipe.direction = .right

        self.addGestureRecognizer(leftSwipe)
        self.addGestureRecognizer(rightSwipe)
    }

    @objc private func handleSwipes(_ sender: UISwipeGestureRecognizer) {
        if (sender.direction == .left) {
            showNextImage()
        }

        if (sender.direction == .right) {
            showPreviousImage()
        }
    }

    private func showPreviousImage() {
        previousImageLeadingConstraint.constant = 0
        currentImageLeadingConstraint.constant = screenWidth

        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.layoutIfNeeded()
        }, completion: { _ in
            self.nextImageView = self.currentImageView
            self.currentImageView = self.previousImageView
            self.previousImageView = self.imageView(image: nil, contentMode: .scaleAspectFit)

            self.index = self.index == 0 ? self.images.count - 1 : self.index - 1
            self.delegate?.imageCarouselView(self, didShowImageAt: self.index)
            self.previousImageView.image = self.index == 0 ? self.images[self.images.count - 1] : self.images[self.index - 1]

            self.setupLayout()
        })
    }

    private func showNextImage() {
        nextImageLeadingConstraint.constant = 0
        currentImageLeadingConstraint.constant = -screenWidth

        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.layoutIfNeeded()
        }, completion: { _ in
            self.previousImageView = self.currentImageView
            self.currentImageView = self.nextImageView
            self.nextImageView = self.imageView(image: nil, contentMode: .scaleAspectFit)

            self.index = self.index == (self.images.count - 1) ? 0 : self.index + 1
            self.delegate?.imageCarouselView(self, didShowImageAt: self.index)
            self.nextImageView.image = self.index == (self.images.count - 1) ? self.images[0] : self.images[self.index + 1]

            self.setupLayout()
        })
    }

    func imageView(image: UIImage? = nil, contentMode: UIImageView.ContentMode) -> UIImageView {
        let view = UIImageView()

        view.image = image
        view.contentMode = contentMode
        view.translatesAutoresizingMaskIntoConstraints = false

        return view
    }
    
    
}
//    //private let images: [UIImage?]
//    private let categoryMeals: [CategorizedMeal?]
//
//    private var index = 0
//    private let screenWidth = UIScreen.main.bounds.width
//
//    var delegate: ImageCarouselViewDelegate?
//
//    lazy var previousImageView = UIImageView()
//
//    lazy var currentImageView = UIImageView()
//    lazy var nextImageView = UIImageView()
//
////    lazy var previousImageView = imageView(image: nil, contentMode: .scaleAspectFit)
////    lazy var currentImageView = imageView(image: nil, contentMode: .scaleAspectFit)
////    lazy var nextImageView = imageView(image: nil, contentMode: .scaleAspectFit)
//
//    lazy var previousImageLeadingConstraint: NSLayoutConstraint = {
//        return previousImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -screenWidth)
//    }()
//
//    lazy var currentImageLeadingConstraint: NSLayoutConstraint = {
//        return currentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
//    }()
//
//    lazy var nextImageLeadingConstraint: NSLayoutConstraint = {
//        return nextImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth)
//    }()
//
//    init(_ meals: [CategorizedMeal]) {
//
//        self.categoryMeals = meals
//
//        super.init(frame: .zero)
//
//        self.translatesAutoresizingMaskIntoConstraints = false
//
//        setupLayout()
//        setupImages()
//        setupSwipeRecognizer()
//
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    private func setupLayout() {
//        self.subviews.forEach({ $0.removeFromSuperview() })
//
//        addSubview(previousImageView)
//        addSubview(currentImageView)
//        addSubview(nextImageView)
//
//        previousImageLeadingConstraint = previousImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -screenWidth)
//        currentImageLeadingConstraint = currentImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0)
//        nextImageLeadingConstraint = nextImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: screenWidth)
//
//        NSLayoutConstraint.activate([
//            previousImageLeadingConstraint,
//            previousImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            previousImageView.widthAnchor.constraint(equalToConstant: screenWidth),
//
//            currentImageLeadingConstraint,
//            currentImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            currentImageView.widthAnchor.constraint(equalToConstant: screenWidth),
//
//            nextImageLeadingConstraint,
//            nextImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
//            nextImageView.widthAnchor.constraint(equalToConstant: screenWidth),
//        ])
//    }
//
//    private func setupImages() {
//        guard categoryMeals.count > 1 else { return }
//
//        let iv = UIImageView(frame: .zero)
//        iv.loadImageWithURL(categoryMeals[self.index]?.imageURL)
//        currentImageView = iv
//        iv.backgroundColor = .blue
//
//        if (index == 0) {
//            let prevIv = UIImageView()
//            prevIv.loadImageWithURL(categoryMeals[categoryMeals.count - 1]?.imageURL)
//            previousImageView = prevIv
//
//            let nextIv = UIImageView()
//            nextIv.loadImageWithURL(categoryMeals[index + 1]?.imageURL)
//            nextImageView = nextIv
//        }
//
//        if (index == (categoryMeals.count - 1)) {
//            let prevIv = UIImageView()
//            prevIv.loadImageWithURL(categoryMeals[categoryMeals.count - 1]?.imageURL)
//            previousImageView = prevIv
//
//            let nextIv = UIImageView()
//            nextIv.loadImageWithURL(categoryMeals[0]?.imageURL)
//            nextImageView = nextIv
//        }
//    }
//
//    private func setupSwipeRecognizer() {
//        guard categoryMeals.count > 1 else { return }
//
//        let leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
//        let rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes))
//
//        leftSwipe.direction = .left
//        rightSwipe.direction = .right
//
//        self.addGestureRecognizer(leftSwipe)
//        self.addGestureRecognizer(rightSwipe)
//    }
//
//    @objc private func handleSwipes(_ sender: UISwipeGestureRecognizer) {
//        if (sender.direction == .left) {
//            showNextImage()
//        }
//
//        if (sender.direction == .right) {
//            showPreviousImage()
//        }
//    }
//
//    private func showPreviousImage() {
//        previousImageLeadingConstraint.constant = 0
//        currentImageLeadingConstraint.constant = screenWidth
//
//        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
//            self.layoutIfNeeded()
//        }, completion: { _ in
//            self.nextImageView = self.currentImageView
//            self.currentImageView = self.previousImageView
//            self.previousImageView = UIImageView()
//
//            self.index = self.index == 0 ? self.categoryMeals.count - 1 : self.index - 1
//            self.delegate?.imageCarouselView(self, didShowImageAt: self.index)
//
//
//            if self.index == 0 {
//                let prevIv = UIImageView()
//                prevIv.loadImageWithURL(self.categoryMeals[self.categoryMeals.count - 1]?.imageURL)
//                self.previousImageView = prevIv
//            }
//            else {
//                let prevIv = UIImageView()
//                prevIv.loadImageWithURL(self.categoryMeals[self.index - 1]?.imageURL)
//                self.previousImageView = prevIv
//            }
//
//            self.setupLayout()
//        })
//    }
//
//    private func showNextImage() {
//        nextImageLeadingConstraint.constant = 0
//        currentImageLeadingConstraint.constant = -screenWidth
//
//        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
//            self.layoutIfNeeded()
//        }, completion: { _ in
//            self.previousImageView = self.currentImageView
//            self.currentImageView = self.nextImageView
//            self.nextImageView = UIImageView()
//
//
//            if self.index == self.categoryMeals.count - 1{
//                self.index = 0
//            }
//            else {
//                self.index += 1
//            }
//
//
//            self.delegate?.imageCarouselView(self, didShowImageAt: self.index)
//
//
//            if self.index == self.categoryMeals.count - 1 {
//                let nextIv = UIImageView()
//                nextIv.loadImageWithURL(self.categoryMeals[0]?.imageURL)
//                self.nextImageView = nextIv
//            }
//            else {
//                let nextIv = UIImageView()
//                nextIv.loadImageWithURL(self.categoryMeals[self.index + 1]?.imageURL)
//                self.nextImageView = nextIv
//            }
//
//            self.setupLayout()
//        })
//    }
//
//    func imageView(image: UIImage? = nil, contentMode: UIImageView.ContentMode) -> UIImageView {
//        let view = UIImageView()
//        view.image = image
//        view.contentMode = contentMode
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }
//}

// ImageCarouselViewDelegate

protocol ImageCarouselViewDelegate: NSObjectProtocol {
    func imageCarouselView(_ imageCarouselView: ImageCarouselView, didShowImageAt index: Int)
}
