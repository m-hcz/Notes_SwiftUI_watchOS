//
//  DetailView.swift
//  NotesWatch WatchKit Extension
//
//  Created by M H on 26/12/2021.
//

import SwiftUI

struct DetailView: View {
	// MARK: props
	
	let note: Note
	let count: Int
	let index: Int
	
	@State private var isCreditsPresented: Bool = false
	@State private var isSettingsPresented: Bool = false
	
	// MARK: body
    var body: some View {
		VStack(alignment: .center, spacing: 3, content: {
			
			HeaderView(title: "")
			
			Spacer()
			
			ScrollView(.vertical) {
				Text(note.text)
					.font(.title3)
					.fontWeight(.semibold)
					.multilineTextAlignment(.center)
			} // scr
			
			Spacer()
			
			HStack(alignment: .center) {
				Image(systemName: "gear")
					.imageScale(.large)
					.onTapGesture {
						isSettingsPresented.toggle()
					}
					.sheet(isPresented: $isSettingsPresented, onDismiss: nil, content: {
						SettingsView()
					})
				
				Spacer()
				
				Text("\(index + 1) / \(count)")
				
				Spacer()
				
				Image(systemName: "info.circle")
					.imageScale(.large)
					.onTapGesture {
						isCreditsPresented.toggle()
					}
					.sheet(isPresented: $isCreditsPresented, onDismiss: nil, content: {
						CreaditsView()
					})
			} // hstack
			.foregroundColor(.secondary)
			
		}) // vstack
			.padding(3)
    }
}

struct DetailView_Previews: PreviewProvider {
	
	static var sample: Note = Note(id: UUID(), text: "sample note")
	
    static var previews: some View {
		DetailView(note: sample, count: 5, index: 1)
    }
}
