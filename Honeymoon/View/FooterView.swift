import SwiftUI

struct FooterView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    
    var body: some View {
        HStack {
            Image(systemName: "xmark.circle")
                .font(.system(size: 42, weight: .light))
            
            Spacer()
            
            Button(action: {
                // ACTION
                print("Success")
            }) {
                Text("Book destinaton".uppercased())
                    .font(.system(.subheadline, design: .rounded))
                    .fontWeight(.heavy)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 12)
                    .accentColor(Color.pink)
                    .background(
                        Capsule()
                            .stroke(Color.pink, lineWidth: 2)
                    )
            } //: BUTTON
            
            Spacer()
            
            Image(systemName: "heart.circle")
                .font(.system(size: 42, weight: .light))
        } //: HSTACK
        .padding()
    }
}

// MARK: - PREVIEW

struct FooterView_Previews: PreviewProvider {
    static var previews: some View {
        FooterView()
            .previewLayout(.fixed(width: 375, height: 80))
            .previewDevice("iPhone 13 Pro")
    }
}
