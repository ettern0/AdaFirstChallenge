import Foundation
import SwiftUI

public class StoryBoard: ObservableObject {
    
    static public let instance = StoryBoard()
    @Published private(set) var model: Scenario = Scenario()

    public var currentIndexOfView: Int { model.scene.rawValue }
    
    public func toogleTheScene() {
        switch model.scene {
        case .poster:
            model.toogleTheScene(to: .scene1)
        case .scene1:
            model.toogleTheScene(to: .scene2)
        case .scene2:
            model.toogleTheScene(to: .scene3)
        case .scene3:
            model.toogleTheScene(to: .scene4)
        default:
            model.toogleTheScene(to: .theEnd)
        }
    }
}
