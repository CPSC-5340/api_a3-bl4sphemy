//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct WhatsMyIP: View {
    var body: some View {
        NavigationView {
                Button(action: {
                    print("Say What")
                }) {
                    HStack {
                        Text("Get IP Info")
                            .fontWeight(.bold)
                            .font(.title)
                    }
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
                }
          .navigationTitle("What's My IP")
          .navigationBarTitleDisplayMode(.inline)
        }
 
        .padding()
    }
}

struct WhatsMyIP_Previews: PreviewProvider {
    static var previews: some View {
        WhatsMyIP()
            .preferredColorScheme(.light)
        WhatsMyIP()
            .preferredColorScheme(.dark)
    }
}
