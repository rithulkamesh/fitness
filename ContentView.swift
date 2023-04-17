import SwiftUI

struct ContentView: View {
    @EnvironmentObject var exerciseModel: ExerciseModel
    var body: some View {
        NavigationView {
            List {
                InstructionsSection()
                ExerciseSection(exercises: exerciseModel.cardioExercises, header: "Cardiovascular exercises")
                ExerciseSection(exercises: exerciseModel.chestExercises, header: "Chest Training")
                ExerciseSection(exercises: exerciseModel.backExercises, header: "Back Training")
                ExerciseSection(exercises: exerciseModel.legExercises, header: "Leg Days")
                ExerciseSection(exercises: exerciseModel.armExercises, header: "Arm Training")
                Footer()
            }
            .navigationTitle("Fitness")
        }
    }
    
    struct ExerciseOption: View {
        let exercise: Exercise
        
        var body: some View {
            NavigationLink {
                ExerciseView(exercise: exercise)
            } label: {
                Text(exercise.name)
            }
        }
    }
    
    
    struct ExerciseSection : View {
        let exercises: [Exercise]
        let header: String
        
        var body: some View {
            Section {
                ForEach(exercises) { exercise in
                    ExerciseOption(exercise: exercise)
                }
            } header: {
                Text(header)
            }
        }
    }
    
    struct InstructionsSection : View {
        var body: some View {
            Section {
                VStack{
                    Text("I strongly recommend warming up with a cardiovascular excercise before starting your workout and saving the latter for your cooldown. Do not over exert.")
                        .padding(.vertical, 5.0)
                }
                Text("I usually swim for 2km (1.25 miles) after my workout, as that provides cardiovascular activity as well. It also helps calm my body down.")
                    .padding(.vertical, 5.0)
                Text("⚠ Warning: This is my own workout, and the magnitude can be reduced according to your needs. Please do not attempt this workout if you are a beginner.")
                    .foregroundColor(.red)
                    .padding(.vertical, 5.0)
            } header: {
                Text("Instructions")
            }
        }
    }
}

struct Footer: View {
    var body: some View {
        VStack {
            Text("Made with ❤️ by Rithul Kamesh")
                .frame(width: UIScreen.main.bounds.width, height: 20, alignment: .center)
            Text("https://rithul.dev")
                .frame(width: UIScreen.main.bounds.width, height: 20, alignment: .center)
        }
    }
}

struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
