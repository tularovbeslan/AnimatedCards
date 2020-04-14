//
//  DraggableView.swift
//  AnimatedCards
//
//  Created by Beslan Tularov on 14.04.2020.
//  Copyright © 2020 Beslan Tularov. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct DraggableView: View {
    
    var user: UserElement
    
    var body: some View {
        VStack {
            WebImage(url: user.url, options: .progressiveLoad)
                .resizable()
                .scaledToFit()
            Text(user.name)
                .padding()
        }
        .frame(width: 200, height: 150, alignment: .center)
        .background(Color(hex: user.color))
    }
}

struct DraggableView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableView(user:
            UserElement(
                id: "f638bd58-e4cb-4576-8a05-06703ab26715",
                avatar: "https://robohash.org/nequeenimcum.bmp?size=50x50&set=set1",
                name: "Star Wormald",
                skills: "Kurdish",
                job: "Paralegal",
                color: "#f42e54"
            )
        )
    }
}
