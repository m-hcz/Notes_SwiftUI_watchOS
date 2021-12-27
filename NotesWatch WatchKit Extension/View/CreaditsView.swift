//
//  CreaditsView.swift
//  NotesWatch WatchKit Extension
//
//  Created by M H on 26/12/2021.
//

import SwiftUI

struct CreaditsView: View {
    var body: some View {
		VStack(alignment: .center, spacing: 3, content: {
			
			Image("developer-no1")
				.resizable()
				.scaledToFit()
				.layoutPriority(1)
			
			HeaderView(title: "Credits")
			
			Text("M H")
				.foregroundColor(.primary)
				.fontWeight(.bold)
			
			Text("Developer")
				.font(.footnote)
				.foregroundColor(.secondary)
				.fontWeight(.light)
			
		}) // vstack
    }
}

struct CreaditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreaditsView()
    }
}
