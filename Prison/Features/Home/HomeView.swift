import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            GeometryReader { geometry in
                ZStack {
                    Image("home_back")
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            Spacer()
                            Image("home_set")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * (32/360)) // responsive size
                        }
                        .padding()
                        
                        Image("home_logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * (294/360))
                            .padding()
                        
                        NavigationLink(destination: FakeViewListView()) {
                            Image("home_call")
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * (304/360))
                                .padding(.top, 20)
                        }
                        
                           
                        Image("home_mess")
                            .resizable()
                            .scaledToFit()
                            .frame(width: geometry.size.width * (304/360))
                            .padding(.top, 20)
                        Spacer()
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
