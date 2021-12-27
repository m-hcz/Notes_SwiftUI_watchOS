//
//  ContentView.swift
//  NotesWatch WatchKit Extension
//
//  Created by M H on 26/12/2021.
//

import SwiftUI

struct ContentView: View {
	// MARK: props
	
	@AppStorage("lineCount") var lineCount: Int = 1
	
	
	@State private var notes: [Note] = [Note]()
	@State private var text: String = ""
	
	
	// MARK: func
	func getDocumentDirectory() -> URL {
		let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
		return path[0]
	}
	
	
	func save() {
		dump(notes)
		
		do {
			let data = try JSONEncoder().encode(notes)
			
			let url = getDocumentDirectory().appendingPathComponent("notes")
			
			try data.write(to: url)
		} catch {
			print("Saving data has failes: \(error)")
		}
	} // func
	
	func load(){
		do {
			let url = getDocumentDirectory().appendingPathComponent("notes")
			
			let data = try Data(contentsOf: url)
			
			notes = try JSONDecoder().decode([Note].self, from: data)
		} catch {
			// ----
		}
	}
	
	func delete(offsets: IndexSet){
		withAnimation {
			notes.remove(atOffsets: offsets)
			save()
		}
	}
	
	// MARK: body
	var body: some View {
		VStack {
			HStack(alignment: .center, spacing: 6, content: {
				TextField("Add New Note", text: $text)
				
				Button(action: {
					guard text.isEmpty == false else { return }
					
					let note = Note(id: UUID(), text: text)
					
					notes.append(note)
					
					text = ""
					
					save()
					
				}, label: {
					Image(systemName: "plus.circle")
						.font(.system(size: 42, weight: .semibold))
				}) // button
					.fixedSize()
					.buttonStyle(PlainButtonStyle())
					.foregroundColor(.accentColor)
				//					.buttonStyle(BorderedButtonStyle(tint: .accentColor))
			}) // hstack
			
			Spacer()
			
			if notes.count >= 1 {
				List{
					ForEach(0..<notes.count, id: \.self) { i in
						NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i), label: {
							HStack{
								Capsule()
									.frame(width: 4)
									.foregroundColor(.accentColor)
								Text(notes[i].text)
									.lineLimit(lineCount)
									.padding(.leading, 5)
							} // hstack
						}) // navlink
						
					} // for
					.onDelete(perform: delete)
				}
			} else {
				Spacer()
				Image(systemName: "note.text")
					.resizable()
					.scaledToFit()
					.foregroundColor(.gray)
					.opacity(0.25)
					.padding(25)
				Spacer()
			} // list
		} // vstack
		.navigationTitle("Notes")
		.onAppear(perform: {
			load()
		})
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
