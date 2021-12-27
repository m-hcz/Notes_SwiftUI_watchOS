//
//  Note.swift
//  NotesWatch WatchKit Extension
//
//  Created by M H on 26/12/2021.
//

import Foundation

struct Note:Identifiable,Codable {
	let id: UUID
	let text: String
}
