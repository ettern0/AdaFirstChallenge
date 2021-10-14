
import PlaygroundSupport
import SwiftUI

/*
 ++Extension to animate transition
 */

struct SpinTransitionModifier: ViewModifier {
    let angle: Double
    let anchor: UnitPoint
    let scale: CGSize
    func body(content: Content) -> some View {
        content
            .rotationEffect(Angle(degrees: angle), anchor: anchor)
    }
}

public extension AnyTransition {
    static func spinIn(anchor: UnitPoint) -> AnyTransition {
        withAnimation {
            .modifier(
                active: SpinTransitionModifier(angle: 90, anchor: anchor, scale: CGSize(width: 0, height: 0)),
                identity: SpinTransitionModifier(angle: 0, anchor: anchor, scale: CGSize(width: 1, height: 1)))
        }
    }

    static func spinOut(anchor: UnitPoint) -> AnyTransition {
        withAnimation {
            .modifier(
                active: SpinTransitionModifier(angle: -90, anchor: anchor, scale: CGSize(width: 1, height: 1)),
                identity: SpinTransitionModifier(angle: 0, anchor: anchor, scale: CGSize(width: 0, height: 0)))
        }
    }
}

/*
 --Extension to animate transition
 */

struct ContentView: View {

    @ObservedObject var viewModel = StoryBoard.instance

    let views = [AnyView(Poster().body), AnyView(Scene1().body), AnyView(Scene2().body), AnyView(Scene3().body), AnyView(Scene4().body)]
    
    var body: some View {
        ForEach(views.indices, id: \.self){(ind: Int) in
            Group {
                if ind == viewModel.currentIndexOfView {
                    withAnimation {
                        self.views[ind]
                            .transition(.asymmetric(insertion: .spinIn(anchor: .bottomTrailing),
                                                    removal: .spinOut(anchor: .bottomTrailing)))
                    }
                }
            }
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

