//
//  ExerciseView.swift
//  MyFit
//
//  Created by Rithul Kamesh on 11/04/23.
//

import SwiftUI

struct ExerciseView: View {
    @EnvironmentObject var exerciseModel: ExerciseModel
    let exercise: Exercise
    
    var body: some View {
        Form {
            VStack {
                Image(systemName: exercise.icon)
                    .font(.system(size: 50))
                    .padding()
                Text(exercise.description)
                    .frame(alignment: .leading)
                    .padding(.bottom)
            }
            .navigationTitle(exercise.name)
            .navigationBarTitleDisplayMode(.inline)

            RoutineSection(exercise: exercise)
            Footer()
        }
    }
    
    struct RoutineSection: View {
        let exercise: Exercise
        
        var body: some View {
            Section {
                VStack{
                    Text(exercise.routine)
                        .padding(.vertical, 5.0)
                }
            } header: {
                Text("Routine")
            }
        }
    }
}
