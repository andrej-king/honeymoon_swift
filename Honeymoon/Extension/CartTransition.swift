import SwiftUI

extension AnyTransition {
    static var trailingButtom:  AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .trailing)
                .combined(with: .move(edge: .bottom))
        )
    }
    
    static var leadingBottom: AnyTransition {
        AnyTransition.asymmetric(
            insertion: .identity,
            removal: AnyTransition.move(edge: .leading)
                .combined(with: .move(edge: .bottom))
        )
    }
}
