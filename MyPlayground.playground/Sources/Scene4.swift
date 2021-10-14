import Foundation
import SwiftUI
import SpriteKit

public struct Scene4: View {

    public init() { }

    var viewModel = StoryBoard.instance

    public var body: some View {
        VStack {
            SpriteView(scene: SKScene(fileNamed: "SpriteScene/Scene4Animation")!)
        }.onAppear() {
            SoundManager.instance.stopPlaying()
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() ) {
                AdditionalSoundsEffect.instance.playSound(sound: .notif2)
            }
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 4.2) {
                SoundManager.instance.playSound(sound: .whatIsLoveCut)
            }
        }
    }
}



