import Foundation
import SwiftUI
import SpriteKit

public struct Scene2: View {
    
    public init() { }
   
    var viewModel = StoryBoard.instance
    
    public var body: some View {
        VStack {
            SpriteView(scene: SKScene(fileNamed: "SpriteScene/Scene2Animation")!)
        }.onAppear() {
            SoundManager.instance.playSound(sound: .crowdSound)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                withAnimation { viewModel.toogleTheScene() }}}
    }
}
