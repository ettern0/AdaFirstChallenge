import Foundation
import SwiftUI
import SpriteKit

public struct Scene3: View {

    public init() { }

    var viewModel = StoryBoard.instance

    public var body: some View {
        VStack {
            SpriteView(scene: SKScene(fileNamed: "SpriteScene/Scene3Animation")!)
        }.onAppear() {
            SoundManager.instance.playSound(sound: .trainAmbienceSound)
            AdditionalSoundsEffect.instance.playSound(sound: .notif2)
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 5) {
                withAnimation { viewModel.toogleTheScene() }}}
    }
}
