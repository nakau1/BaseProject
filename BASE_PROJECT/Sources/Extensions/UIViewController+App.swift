//
//  BASE_PROJECT
//  Copyright Nakayasu Yuichi All rights reserved.
//
import UIKit

extension UIViewController {
    
    /// ストーリーボードからインスタンスを生成する
    /// - Parameters:
    ///   - type: インタンス化する型(原則としてselfを渡す)
    ///   - name: ストーリーボード名(省略した場合はクラス名から"ViewController"を削除した名前)
    ///   - identifier: ストーリーボード上のID(省略した場合はイニシャルビューコントローラを使用する)
    /// - Returns: 生成されたビューコントローラ
    class func instantiate<T: UIViewController>(_ type: T.Type, name: String? = nil, identifier: String? = nil) -> T {
        let className = String(describing: type)
        let storyboardName = name ?? className.replacingOccurrences(of: "ViewController", with: "")
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        if let identifier = identifier, let vc = storyboard.instantiateViewController(withIdentifier: identifier) as? T {
            return vc
        } else if let vc = storyboard.instantiateInitialViewController() as? T {
            return vc
        } else {
            fatalError("can not instantiate. \(className)")
        }
    }
    
    /// ナビゲーションコントローラの配下に置いた状態で返す
    /// - Parameter navigationBarHidden: ナビゲーションバーを非表示にするかどうか
    /// - Returns: ビューコントローラ(ナビゲーションコントローラ)
    func withinNavigation(navigationBarHidden: Bool = false) -> UIViewController {
        let navi = UINavigationController(rootViewController: self)
        navi.isNavigationBarHidden = navigationBarHidden
        return navi
    }
}
