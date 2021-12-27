//
//  HeaderView.swift
//  NotesWatch WatchKit Extension
//
//  Created by M H on 26/12/2021.
//

import SwiftUI

struct HeaderView: View {
	
	let title: String
	
    var body: some View {
		VStack{
			Text(title)
				.font(.title2)
				.fontWeight(.bold)
				.foregroundColor(.accentColor)
			HStack{
				Capsule()
					.frame(height: 1)
				
				Image(systemName: "note.text")
				
				Capsule()
					.frame(height: 1)
			} // hstack
			.foregroundColor(.accentColor)
		} // vstack
	
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title")
    }
}
