import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTY
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        VStack {
            HeaderView(showGuideView: $showGuide)
            
            Spacer()
            
            CardView(honeymoon: honeymoonData[2])
            // FIXME: Add padding to the cards later on.
                .padding()
            
            Spacer()
            
            FooterView(showBookingAlert: $showAlert)
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
