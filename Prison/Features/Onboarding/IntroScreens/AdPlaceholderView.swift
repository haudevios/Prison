//
//  AdPlaceholderView.swift
//  Prison
//
//  Created by umaxsoft on 23/6/25.
//

import SwiftUI
struct AdPlaceholderView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("intro_ads")
                Text("Demo Advertising: Google Ads")
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
       
            Text("Stay up to date with your Ads check how your ads are running")
                .font(.subheadline)
                .foregroundColor(.gray)
            
            Image("intro_demo_ads")
                .resizable()
                .scaledToFit()
            
            Image("intro_install")
                .resizable()
                .scaledToFit()
            
        }
        
    }
}


#Preview {
    AdPlaceholderView()
}
