import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    
    // MARK: - CARD VIEWS
    
    var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0..<2 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
    }()
    
    // MARK: - TOP CARD
    
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        
        return index == 0
    }
    
    // MARK: - DRAG STATES
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .pressing, .inactive:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            // MARK: - HEADER
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
            
            Spacer()
            
            // MARK: - CARDS
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        .overlay(
                            ZStack {
                                // X-MARK SYMBOL
                                Image(systemName: "x.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(
                                        self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView)
                                        ? 1.0
                                        : 0.0
                                    )
                                
                                // HEART SYMBOL
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(
                                        self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView)
                                        ? 1.0
                                        : 0.0
                                    )
                            }
                        )
                        .offset(
                            x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0,
                            y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0
                        )
                        .scaleEffect(
                            self.dragState.isDragging && self.isTopCard(cardView: cardView)
                            ? 0.85
                            : 1.0
                        )
                        .rotationEffect(
                            Angle(
                                degrees: self.isTopCard(cardView: cardView)
                                ? Double(self.dragState.translation.width / 12)
                                : 0
                            )
                        )
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120), value: dragState.isDragging)
                        .gesture(LongPressGesture(minimumDuration: 0.01)
                            .sequenced(before: DragGesture())
                            .updating(self.$dragState, body: { (value, state, transaction) in
                                switch value {
                                case .first(true):
                                    state = .pressing
                                case .second(true, let drag):
                                    state = .dragging(translation: drag?.translation ?? .zero)
                                default:
                                    break
                                }
                            })
                        )
                } //: LOOP
            } //: ZSTACK
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - FOOTER
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default, value: dragState.isDragging)
        } //: VSTACK
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("SUCCESS"),
                message: Text("Wishing a lovely and most previous of the times together for the amazing couple."),
                dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

// MARK: - PREVIEW

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro")
    }
}
