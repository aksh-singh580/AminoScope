//
//  ProteinView.swift
//  AminoScope
//
//  Created by Prabhas Kumar on 20/12/24.
//


import SwiftUI



struct ProteinView: View {
    let model: String
    var body: some View {
        Group {
            switch model {
            case "Myoglobin":
                MyoglobinSceneView()
            case "Lysozyme":
                LysozymeSceneView()
            case "Insulin":
                InsulinSceneView()
            case "Hemoglobin":
                HemoglobinSceneView()
            case "Hexokinase":
                HexokinaseSceneView()
            
            case "Collagen":
                CollagenSceneView()
            case "Keratin":
                KeratinSceneView()

            case "Bovine Mitochondrial F1-ATPase":
                ATPSynthaseSceneView()
            default:
                Text("No Scene Found")
            }
        }
    }
}


#Preview {
    ContentView()
}
