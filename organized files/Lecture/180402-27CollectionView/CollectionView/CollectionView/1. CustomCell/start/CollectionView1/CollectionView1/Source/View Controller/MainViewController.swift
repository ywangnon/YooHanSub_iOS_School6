import UIKit

final class MainViewController: UIViewController {
  
  // MARK: Properties
  @IBOutlet weak var collectionView: UICollectionView!
  var source: [Card] = [] {
    didSet {
      self.collectionView.reloadData()
    }
  }
  
  // MARK: View Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    
    collectionView.register(UINib(nibName: "CardCell", bundle: nil), forCellWithReuseIdentifier: "CardCell")
    
    fetc()
  }
  
}

// MARK: - Fetch
extension MainViewController {
  
    private func fetc() {
        ImageService.image { result in
            switch result {
            case .success(let value):
                self.source = value
            case .failure(let error):
                print("")
            }
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController: UICollectionViewDataSource {
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 1
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    numberOfItemsInSection section: Int
  ) -> Int {
    return source.count
  }
  
  func collectionView(
    _ collectionView: UICollectionView,
    cellForItemAt indexPath: IndexPath
  ) -> UICollectionViewCell {
//    let cellData = source[indexPath.item]
//    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! imageCell
//    return cell
    
    
//    커스텀 셀
    let cellData = source[indexPath.item]
    
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath) as! CardCell
    cell.imageView.image = UIImage(named: cellData.image)
    
    return cell
  }
}
