//
//  ExerciseModel.swift
//  MyFit
//
//  Created by Rithul Kamesh on 11/04/23.
//

import SwiftUI

struct Exercise: Codable, Identifiable {
    enum ExType: String, Codable {
        case cardio
        case chest
        case back
        case legs
        case arms
    }
    
    let id: Int
    
    let name: String
    let icon: String
    let description: String
    let type: ExType
    let routine: String
}

class ExerciseModel : ObservableObject {
    @Published var exercises : [Exercise] = [Exercise]();
    
    init() {
        /// Get the file and load it. If it is not found, Throw an error
        guard let fileURL = Bundle.main.url(forResource: "exercise", withExtension: "json") else {
            fatalError("Exercise data not found. Is it in a different location?")
        }
        guard let data = try? Data(contentsOf: fileURL) else {
            fatalError("Could not load exercise file. Is it corrupted?")
        }
        /// Due to human errors, there may be errors in decoding, if there exists, throw it.
        let decoder = JSONDecoder()
        guard let decoded = try? decoder.decode([Exercise].self, from: data) else {
            fatalError("Could not decode exercise file. Are there JSON errors?")
        }

        exercises = decoded
    }

    var cardioExercises: [Exercise] {
        exercises.filter({$0.type == .cardio})
    }
    var chestExercises: [Exercise] {
        exercises.filter({$0.type == .chest})
    }
    
    var backExercises: [Exercise] {
        exercises.filter({$0.type == .back})
    }
    var legExercises: [Exercise] {
        exercises.filter({$0.type == .legs})
    }
    var armExercises: [Exercise] {
        exercises.filter({$0.type == .arms})
    }
}
