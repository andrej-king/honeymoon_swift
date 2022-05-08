import SwiftUI

struct InfoView: View {
    // MARK: - PROPERTY
    
    // MARK: - BODY
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Application").foregroundColor(Color.gray)
                    Spacer()
                    Text("Honeymoon")
                } //: HSTACK
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                HStack {
                    Text("Photos").foregroundColor(Color.gray)
                    Spacer()
                    Text("Unsplash")
                } //: HSTACK
                
                Spacer(minLength: 10)
                
                Button(action: {
                    // ACTION
                    print("A button was tapped")
                }) {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                } //: BUTTON
            } //: VSTACK
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

// MARK: - PREVIEW

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .previewDevice("iPhone 13 Pro")
    }
}
