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
                
                AppInfoView()
                
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

// MARK: - EXTRACTED SUBVIEW

struct AppInfoView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            RowAppInfoView(itemOne: "Application", itemTwo: "Honeymoon")
            RowAppInfoView(itemOne: "Compatibility", itemTwo: "iPhone and iPad")
            RowAppInfoView(itemOne: "Developer", itemTwo: "John Doe")
            RowAppInfoView(itemOne: "Designer", itemTwo: "John Doe")
            RowAppInfoView(itemOne: "Website", itemTwo: "example.com")
            RowAppInfoView(itemOne: "Version", itemTwo: "1.0.0")
        } //: VSTACK
    }
}

struct RowAppInfoView: View {
    // MARK: - PROPERTY
    
    var itemOne: String
    var itemTwo: String
    
    var body: some View {
        VStack {
            HStack {
                Text(itemOne).foregroundColor(Color.gray)
                Spacer()
                Text(itemTwo)
            } //: HSTACK
        } //: VSTACK
        Divider()
    }
}
