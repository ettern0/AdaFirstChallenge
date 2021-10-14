import Foundation

struct Scenario {
    
    enum Scenes: Int {
        case poster = 0, scene1 = 1, scene2 = 2, scene3 = 3, scene4 = 4, theEnd = 5
    }

    var scene: Scenes = .poster
    
    mutating func toogleTheScene(to scene: Scenes) {
        self.scene = scene
        
    }
}
