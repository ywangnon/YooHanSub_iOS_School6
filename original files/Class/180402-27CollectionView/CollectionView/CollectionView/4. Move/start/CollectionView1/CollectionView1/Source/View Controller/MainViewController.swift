import UIKit

final class MainViewController: UIViewController {
  
  private struct Metric {
    // collectionView
    static let numberOfItem: CGFloat = 3
    
    static let leftPadding: CGFloat = 10.0
    static let rightPadding: CGFloat = 10.0
    static let topPadding: CGFloat = 10.0
    static let bottomPadding: CGFloat = 10.0
    
    static let itemSpacing: CGFloat = 5.0
    static let lineSpacing: CGFloat = 5.0
  }
  
  // MARK: Properties
  @IBOutlet weak var collectionView: UICollectionView!
  var source: [Cards] = [] {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  // MARK: View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(
      UINib(nibName: "CardCell", bundle: nil),
      forCellWithReuseIdentifier: "CardCell"
    )
    let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
    layout.sectionHeadersPinToVisibleBounds = true
    fetchData()
  }
  
}

// MARK: - Fetch
extension MainViewController {
  private func fetchData() {
    ImageService.image { [weak self] result in
      guard let `self` = self else { return }
      switch result {
      case .success(let cards):
        self.source = cards
      case .failure(let error):
        print(error)
      }
    }
  }
}

extension MainViewController {
  
  @IBAction private func moveGesture(_ sender: UILongPressGestureRecognizer) {
   
    let location = sender.location(in: collectionView)
    
    switch sender.state {
    case .began:
        let path = collectionView.indexPathForItem(at: location)!
        collectionView.beginInteractiveMovementForItem(at: path)
    case .changed:
        collectionView.updateInteractiveMovementTargetPosition(location)
    case .ended:
        collectionView.endInteractiveMovement()
    case .cancelled:
        collectionView.cancelInteractiveMovement()
    default:
        break
    }
  }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return source.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return source[section].cards.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
    let cellData = source[indexPath.section].cards[indexPath.item]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
    cell.nameLabel.text = cellData.name
    cell.imageView.image = UIImage(named: cellData.image)
    return cell
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    viewForSupplementaryElementOfKind kind: String,
    at indexPath: IndexPath
  ) -> UICollectionReusableView {
    let data = source[indexPath.section]
    
    switch kind {
    case UICollectionElementKindSectionHeader:
      let header = collectionView.dequeueReusableSupplementaryView(
        ofKind: kind,
        withReuseIdentifier: "CustomHeaderView",
        for: indexPath
      ) as! CustomHeaderView
      header.headerImageView.image = UIImage(named: data.state)
      header.headerNameLabel.text = data.state
      return header
    default:
      return UICollectionReusableView()
    }
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    moveItemAt sourceIndexPath: IndexPath,
    to destinationIndexPath: IndexPath
  ) {
    guard sourceIndexPath != destinationIndexPath else {
        return
    }
    
    let newElement = source[sourceIndexPath.section].cards.remove(at: sourceIndexPath.item)
    
  }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    let spacing = Metric.itemSpacing * (Metric.numberOfItem - 1)
    let padding = Metric.leftPadding + Metric.rightPadding
    let totalSpacing = spacing + padding
    let width = (collectionView.frame.width - totalSpacing) / Metric.numberOfItem
    return CGSize(width: width, height: width)
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    return Metric.lineSpacing
  }
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    return Metric.itemSpacing
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    return UIEdgeInsetsMake(Metric.topPadding, Metric.leftPadding,
                            Metric.bottomPadding, Metric.rightPadding)
  }
}

