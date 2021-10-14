import Foundation
import SwiftUI
import UIKit

public struct Poster: View {

    public init() { }

    var viewModel = StoryBoard.instance

    private let scene = Scene1Animation(size: CGSize(width: 375, height: 812))

    public var body: some View {
        VStack {
            ZStack {
                Image(uiImage: UIImage(named: "poster")!)
                    .resizable()
                    .frame(width: 375, height: 812)
                Image(uiImage: UIImage(named: "posterButton")!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .position(x: 300, y: 460)
                    .onTapGesture { withAnimation { viewModel.toogleTheScene() }}
            }
        }
    }
}

