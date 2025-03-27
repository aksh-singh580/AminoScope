//
//  HemoglobinSceneView.swift
//  AminoScope
//
//  Created by Prabhas Kumar on 21/12/24.
//  Edited by Aksh Singh, Prabhas Kumar
//

import SwiftUI
import SceneKit
//import PlaygroundSupport
import UIKit
import ARKit
import AVFoundation

struct HemoglobinSceneView: View {
    @State var mode = "Polymer"
    @State var showAR = false
    @State var showAlert = false
    @State var HaveCameraPermission: Bool? = nil
    @State var showInfo = false

    var body: some View {
        Group {
            if !showAR {

                NavigationSplitView {
                    ScrollView {
                        HStack(alignment: .top) {
                            VStack(alignment: .leading) {
                                Text("Hemoglobin")
                                    .font(.title)
                                    .foregroundStyle(Color.primary)
                                    .fontWeight(.bold)
                                    .padding(.leading, 8)
                                
                                Spacer().frame(height: 20)

                                Text("Models")
                                    .font(.headline)
                                    .foregroundStyle(Color.secondary)
                                    .padding(.leading, 8)
                                
                                Text("Protein")
                                    .foregroundStyle(
                                        mode == "Polymer" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Polymer" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Polymer" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Polymer"
                                    }
                                
                                
                                Text("Alpha Structure")
                                    .foregroundStyle(
                                        mode == "Alpha" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Alpha" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Alpha" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Alpha"
                                    }
                                
                                
                                Text("Beta Structure")
                                    .foregroundStyle(
                                        mode == "Beta" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Beta" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Beta" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Beta"
                                    }

                                
                                
                                Text("Functional HEME")
                                    .foregroundStyle(
                                        mode == "Functional" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Functional" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Functional" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Functional"
                                    }
                                
                                
                                Text("O2 Binding")
                                    .foregroundStyle(
                                        mode == "O2" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "O2" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "O2" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "O2"
                                    }
                                
                                Text("Iron in HEME")
                                    .foregroundStyle(
                                        mode == "iron" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "iron" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "iron" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "iron"
                                    }

                                
                                
                                Spacer().frame(height: 40)

                                Group {
                                    
                                    switch mode {
                                        case "Polymer":
                                        Text("About Hemoglobin")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)

                                    
                                        Text(
                                            "Hemoglobin is a prominent red blood cell protein responsible for carrying oxygen from the lungs to tissues throughout the body and ferrying carbon dioxide back for removal. Composed of four globin subunits, each containing a heme prosthetic group, hemoglobin’s quaternary structure enables cooperative binding—its affinity for oxygen increases as more oxygen molecules bind. This cooperative effect ensures efficient oxygen uptake in high-oxygen environments (like the lungs) and controlled release in oxygen-poor tissues. Variations in pH, temperature, and CO2 concentration can influence hemoglobin’s oxygen affinity, adapting its function to the body’s metabolic needs and playing a pivotal role in maintaining proper oxygen distribution and overall physiological balance."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                            
                                        case "Alpha":
                                            
                                        Text("About Alpha Structure")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)

                                
                                        Text(
                                            "In Hemoglobin, the alpha chains, highlighted in orange, form two of the four polypeptide subunits that make up the protein. These alpha chains provide structural stability and play a crucial role in maintaining the overall quaternary structure of hemoglobin, enabling it to effectively bind and release oxygen molecules."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "Beta":
                                        
                                    Text("About Beta Structure")
                                        .font(.headline)
                                        .foregroundStyle(Color.secondary)
                                        .padding(.bottom, 1)

                            
                                    Text(
                                        "In Hemoglobin, the beta chains, highlighted in blue, constitute the remaining two polypeptide subunits. The beta chains work in conjunction with the alpha chains to create a functional protein capable of reversible oxygen binding. Their precise arrangement ensures that hemoglobin can efficiently transport oxygen throughout the bloodstream."
                                    )
                                    .font(.body)
                                    .foregroundStyle(Color.primary)
                                        
                                            
                                        case "Functional":
                                            
                                        Text("About Functional Regions")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)

                                
                                        Text(
                                            "In Hemoglobin, the heme groups, highlighted in red, are essential components that enable oxygen binding. Each heme group contains an iron atom that directly interacts with oxygen molecules, allowing hemoglobin to capture and transport oxygen efficiently. The heme groups are critical for the protein’s ability to carry oxygen and play a key role in its overall functionality."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                    
                                            
                                        case "O2":
                                        
                                        Text("About O2 Binding Spots")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)

                                
                                        Text(
                                            "In Hemoglobin, the O₂ binding spots, highlighted in pink, are specific sites located within each subunit where oxygen molecules attach. These binding sites allow hemoglobin to pick up oxygen in the lungs and release it in tissues that need it, facilitating effective gas exchange and ensuring that cells receive the oxygen necessary for energy production."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "iron":
                                    
                                    Text("About iron in HEME")
                                        .font(.headline)
                                        .foregroundStyle(Color.secondary)
                                        .padding(.bottom, 1)

                            
                                    Text(
                                        "In Hemoglobin, the iron atoms within the heme groups, highlighted in pink, are pivotal for oxygen binding. Each iron atom serves as the binding site for an oxygen molecule, facilitating the reversible attachment and release of oxygen. This interaction between iron and oxygen is fundamental to hemoglobin’s role in oxygen transport and ensures that oxygen is delivered effectively to tissues throughout the body."
                                    )
                                    .font(.body)
                                    .foregroundStyle(Color.primary)
                                        
                                        
                                        default:
                                            EmptyView()
                                        
                                    }
                                }
                                .padding(.leading, 8)

                                
                            }
                            
                            Spacer()
                        }
                        .padding(.leading, 10)
                        .padding(.top)
                        .padding(.top, -3)

                    }
                    .background(Color(UIColor.systemGray6))
                } detail: {
                    ZStack(alignment: .bottomTrailing){
                        Group{
                            if showAR {
                                ARKitView4(mode: $mode) // AR view
                                    .ignoresSafeArea(.all)
                                    

                            } else {
                                ModelKitView4(mode: $mode) // 3D view
                            }
                        }
                        
                        Button(action: {
                            showAR.toggle() // Toggle the AR view
                            if showAR {
                                // print(HaveCameraPermission)
                                if !(HaveCameraPermission ?? false) {
                                    if HaveCameraPermission == nil {
                                        HaveCameraPermission = checkCameraPermission()
                                        if HaveCameraPermission! {
                                            showAlert = false
                                            showAR = true
                                        } else {
                                            showAlert = true
                                            showAR = false
                                        }
                                    } else {
                                        showAlert = true
                                        showAR = false
                                    }
                                } else {
                                    showAlert = false
                                }
                            }
                        }) {
                            Image(systemName: showAR ? "cube" : "arkit") // Icon changes based on the view
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.primary)
                                .padding(8)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(UIColor.systemGray6))
                        )
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        .alert("Camera Access Denied", isPresented: $showAlert) {
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("To use AR features, this app requires access to your camera. You’ve denied camera permissions. Please enable them in your device settings to proceed.")
                        }
                    }
                }
            } else {
                ZStack(alignment: .bottomTrailing) {
                    ARKitView4(mode: $mode) // AR view
                        .ignoresSafeArea(.all)
                        
            
                    HStack {
                        Button(action: {
                            showInfo = true // Toggle the AR view
                        }) {
                            Image(systemName: "info.circle") // Icon changes based on the view
                                .resizable()
                                .scaledToFit()
                                .frame(width: 26, height: 26)
                                .foregroundStyle(Color.primary)
                                .padding(10)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(UIColor.systemGray6))
                        )
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 10)
                        .padding(.trailing, 2)
                        .alert("Welcome to AR View", isPresented: $showInfo) {
                            Button("OK", role: .cancel) { }
                        } message: {
                            Text("To zoom in or out: pinch with two fingers.\nTo rotate the model: use one finger.\nTo move across: drag with two fingers.\nTo adjust depth: swipe with three fingers.")
                        }
                        
                        Button(action: {
                            showAR.toggle() // Toggle the AR view
                            if showAR {
                                // print(HaveCameraPermission)
                                if !(HaveCameraPermission ?? false) {
                                    if HaveCameraPermission == nil {
                                        HaveCameraPermission = checkCameraPermission()
                                        if HaveCameraPermission! {
                                            showAlert = false
                                            showAR = true
                                        } else {
                                            showAlert = true
                                            showAR = false
                                        }
                                    } else {
                                        showAlert = true
                                        showAR = false
                                    }
                                } else {
                                    showAlert = false
                                }
                            }
                        }) {
                            Image(systemName: showAR ? "cube" : "arkit") // Icon changes based on the view
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundStyle(Color.primary)
                                .padding(8)
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 8, style: .continuous)
                                .fill(Color(UIColor.systemGray6))
                        )
                        .buttonStyle(PlainButtonStyle())
                        .padding(.top, 10)
                        .padding(.trailing, 10)
                        .alert("Camera Access Denied", isPresented: $showAlert) {
                            Button("Cancel", role: .cancel) { }
                        } message: {
                            Text("To use AR features, this app requires access to your camera. You’ve denied camera permissions. Please enable them in your device settings to proceed.")
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    HemoglobinSceneView()
//    ContentView()
}


struct ModelKitView4: View {
    @Binding var mode: String
    @State private var scene: SCNScene?
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        SceneView(
            scene: scene,
            options: [.autoenablesDefaultLighting, .allowsCameraControl]
        )
        .ignoresSafeArea(.all)
        
        .onAppear {
            loadScene(mode: mode)
        }
        .onChange(of: mode) { oldValue, newValue in
            loadScene(mode: mode)
        }
        .onChange(of: colorScheme) { oldValue, newValue in
            loadScene(mode: mode)
        }
    }

    func loadScene(mode: String) {
        if mode == "iron" {
            if let loadedScene = SCNScene(named: "hemoglobin-model_2.scn") {
                scene = loadedScene
                scene?.background.contents = colorScheme == .dark ? UIColor.darkGray : UIColor.white
            } else {
                // // print("Could not load hemoglobin-model_2.scn")
                scene = nil
            }
        } else {
            if let loadedScene = SCNScene(named: "hemoglobin-model_1.scn") {
                scene = loadedScene
                scene?.background.contents = colorScheme == .dark ? UIColor.darkGray : UIColor.white
                applyColorScheme4(to: loadedScene, mode: mode)
            } else {
                // // print("Could not load hemoglobin-model_1.scn")
                scene = nil
            }
        }
    }
}


struct ARKitView4: UIViewRepresentable {
    @Binding var mode: String

    func makeUIView(context: Context) -> ARSCNView {
        let arView = ARSCNView()
        arView.delegate = context.coordinator
        arView.scene = SCNScene()
        arView.autoenablesDefaultLighting = true
        
        // Start AR session
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = [.horizontal, .vertical]
        arView.session.run(configuration)
        
        // Add pinch gesture for scaling
        let pinchGesture = UIPinchGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePinch(_:)))
        arView.addGestureRecognizer(pinchGesture)
        
        // Add pan gesture for two-finger movement
        let panGestureForMovement = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handlePan(_:)))
        panGestureForMovement.minimumNumberOfTouches = 2 // Require two fingers
        panGestureForMovement.maximumNumberOfTouches = 2 // Only allow two fingers
        arView.addGestureRecognizer(panGestureForMovement)
        
        // Add pan gesture for one-finger rotation
        let panGestureForRotation = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleRotation(_:)))
        panGestureForRotation.minimumNumberOfTouches = 1 // Require one finger
        panGestureForRotation.maximumNumberOfTouches = 1 // Only allow one finger
        arView.addGestureRecognizer(panGestureForRotation)
        
        // Add pan gesture for three-finger forward/backward movement
        let panGestureForDepth = UIPanGestureRecognizer(target: context.coordinator, action: #selector(context.coordinator.handleDepthPan(_:)))
        panGestureForDepth.minimumNumberOfTouches = 3
        panGestureForDepth.maximumNumberOfTouches = 3
        arView.addGestureRecognizer(panGestureForDepth)



        
        return arView
    }

    func updateUIView(_ uiView: ARSCNView, context: Context) {
        // Load and update the model
        updateModel(for: mode, in: uiView)
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    // Load and update the model in the AR scene
    func updateModel(for mode: String, in arView: ARSCNView) {
        let scene: SCNScene

        if mode == "iron" {
            // Load the scene
            guard let loadedscene = SCNScene(named: "hemoglobin-model_2.scn") else {
                // // print("Failed to load the model.")
                return
            }
            scene = loadedscene
        } else {
            // Load the scene
            guard let loadedscene = SCNScene(named: "hemoglobin-model_1.scn") else {
                // // print("Failed to load the model.")
                return
            }
            scene = loadedscene
            // Apply any customizations
            applyColorScheme4(to: scene, mode: mode)
        }

        // Clone the model node
        let modelNode = scene.rootNode.clone()
        modelNode.name = "HemoglobinModel" // Name the node for identification
        modelNode.scale = SCNVector3(1 / 75.0, 1 / 75.0, 1 / 75.0)

        // Set the position to move the model away from the center
        modelNode.position = SCNVector3(0.0, 0.0, -0.75) // Move 0.75 meters away from the camera
        

        // Add the model node to the scene
        arView.scene.rootNode.addChildNode(modelNode)
    }
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARKitView4
        var lastScale: CGFloat = 1.0 // Track the last scale for smooth zooming

        init(_ parent: ARKitView4) {
            self.parent = parent
        }

        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HemoglobinModel", recursively: true) else { return }

            if gesture.state == .began {
                lastScale = gesture.scale
            } else if gesture.state == .changed {
                let scale = Float(gesture.scale / lastScale)
                modelNode.scale = SCNVector3(
                    modelNode.scale.x * scale,
                    modelNode.scale.y * scale,
                    modelNode.scale.z * scale
                )
                lastScale = gesture.scale
            }
        }
        
        @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HemoglobinModel", recursively: true) else { return }

            let translation = gesture.translation(in: arView)

            if gesture.state == .changed {
                let translationScale: Float = 0.001 // Adjust sensitivity
                let deltaX = Float(translation.x) * translationScale
                let deltaY = Float(-translation.y) * translationScale // Inverted Y-axis

                modelNode.position = SCNVector3(
                    modelNode.position.x + deltaX,
                    modelNode.position.y + deltaY,
                    modelNode.position.z
                )

                // Reset translation to prevent accumulation
                gesture.setTranslation(.zero, in: arView)
            }
        }
        
        @objc func handleRotation(_ gesture: UIPanGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HemoglobinModel", recursively: true) else { return }

            let translation = gesture.translation(in: arView)

            if gesture.state == .changed {
                let rotationScale: Float = 0.01 // Adjust sensitivity
                let deltaX = Float(translation.x) * rotationScale // Horizontal rotation (Y-axis)
                let deltaY = Float(translation.y) * rotationScale // Vertical rotation (X-axis)

                modelNode.eulerAngles = SCNVector3(
                    modelNode.eulerAngles.x + deltaY,
                    modelNode.eulerAngles.y + deltaX,
                    modelNode.eulerAngles.z
                )

                // Reset translation to prevent accumulation
                gesture.setTranslation(.zero, in: arView)
            }
        }
        
        
        @objc func handleDepthPan(_ gesture: UIPanGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HemoglobinModel", recursively: true) else { return }

            let translation = gesture.translation(in: arView)

            if gesture.state == .changed {
                let depthScale: Float = 0.005 // Adjust sensitivity for forward/backward movement
                let deltaZ = Float(translation.y) * depthScale // Use Y-axis to move in Z direction

                // Update the model's position in the Z-axis
                modelNode.position = SCNVector3(
                    modelNode.position.x,
                    modelNode.position.y,
                    modelNode.position.z + deltaZ
                )

                // Reset the gesture translation
                gesture.setTranslation(.zero, in: arView)
            }
        }
        
        

        func session(_ session: ARSession, didFailWithError error: Error) {
            // // print("AR session failed: \(error.localizedDescription)")
        }

        func sessionWasInterrupted(_ session: ARSession) {
            // // print("AR session was interrupted.")
        }

        func sessionInterruptionEnded(_ session: ARSession) {
            // // print("AR session interruption ended.")
        }
    }
}



func applyColorScheme4(to scene: SCNScene, mode: String) {
    let activeColors: [(Float, Float, Float)]
    let inactiveColors: [(Float, Float, Float)]
    let activeNewColor: (Float, Float, Float, Float)
    let showInactive: Bool
    // // print(mode)
    switch mode {
    case "Polymer":
        activeColors = [
            (0.3412, 0.3490, 0.3804), // lead
            (0.3137, 0.8157, 0.3137), // nickel
            (0.0902, 0.3294, 0.5294)  // iridium

        ]
        inactiveColors = [
            (0.8784, 0.4000, 0.2000), // iron
            (0.6118, 0.4784, 0.7804)  // manganese
        ]
        activeNewColor = (0.1, 0.6, 0.6, 1.0) // deepteal
        showInactive = false
        
    case "Alpha":
        activeColors = [
            (0.3412, 0.3490, 0.3804), // lead
            (0.8784, 0.4000, 0.2000), // iron

        ]
        inactiveColors = [
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese
            (0.3137, 0.8157, 0.3137)  // nickel

        ]
        activeNewColor = (1, 0.5, 0, 1) // orange
        showInactive = true
        
    case "Beta":
        activeColors = [
            (0.6118, 0.4784, 0.7804), // manganese
            (0.0902, 0.3294, 0.5294), // iridium

        ]
        inactiveColors = [
            (0.8784, 0.4000, 0.2000), // iron
            (0.3137, 0.8157, 0.3137), // nickel
            (0.3412, 0.3490, 0.3804), // lead

        ]
        activeNewColor = (0.0, 0.5, 1.0, 1) // marine
        showInactive = true
        
    case "Functional":
        activeColors = [
            (0.6118, 0.4784, 0.7804), // manganese
            (0.8784, 0.4000, 0.2000), // iron

        ]
        inactiveColors = [
            (0.3137, 0.8157, 0.3137), // nickel
            (0.0902, 0.3294, 0.5294), // iridium
            (0.3412, 0.3490, 0.3804), // lead

        ]
        activeNewColor = (1, 0, 0, 1) // red
        showInactive = true
        
    case "O2":
        activeColors = [
            (0.3137, 0.8157, 0.3137), // nickel
        ]
        inactiveColors = [
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese
            (0.3412, 0.3490, 0.3804), // lead
            (0.8784, 0.4000, 0.2000)  // iron

        ]
        activeNewColor = (0.85, 0.2, 0.5, 1) // warmpink
        showInactive = true
        
    case "iron":
        // Irrevelent
        activeColors = [
            (0.6118, 0.4784, 0.7804)  // manganese
        ]
        inactiveColors = [
            (0.0902, 0.3294, 0.5294), // iridium
            (0.3137, 0.8157, 0.3137), // nickel
            (0.8784, 0.4000, 0.2000), // iron
            (0.3412, 0.3490, 0.3804), // lead

        ]
        activeNewColor = (1, 1, 0, 1) // yellow
        showInactive = true

        
    default:
        // Default scheme, no changes
        // // print("here")
        activeColors = []
        inactiveColors = [
            (0.3412, 0.3490, 0.3804), // lead
            (0.8784, 0.4000, 0.2000), // iron
            (0.3137, 0.8157, 0.3137), // nickel
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese

        ]
        activeNewColor = (0.1, 0.6, 0.6, 1.0) // doesn't matter
        showInactive = true
    }
    
    modifyVertexColors4(
        in: scene,
        activeColors: activeColors,
        inactiveColors: inactiveColors,
        activeNewColor: activeNewColor,
        showInactive: showInactive
    )
}

func modifyVertexColors4(
    in scene: SCNScene,
    activeColors: [(Float, Float, Float)],
    inactiveColors: [(Float, Float, Float)],
    activeNewColor: (Float, Float, Float, Float),
    showInactive: Bool
) {
    let inactiveNewColor: (Float, Float, Float, Float) = (0.5, 0.5, 0.5, (showInactive) ? 1.0 : 0.0) // gray
    
    scene.rootNode.enumerateChildNodes { (node, _) in
        guard let geometry = node.geometry else { return }
        guard let colorSource = geometry.sources(for: .color).first else { return }
        
        let vectorCount = colorSource.vectorCount
        guard colorSource.usesFloatComponents,
              colorSource.componentsPerVector == 4,
              colorSource.bytesPerComponent == MemoryLayout<Float>.size else {
            // // print("Vertex colors not in expected RGBA float format.")
            return
        }
        
        let stride = colorSource.dataStride
        let offset = colorSource.dataOffset
        let bytesPerComponent = colorSource.bytesPerComponent
        
        let originalData = colorSource.data
        var newData = originalData
        
        // Separate sets to track which vertices changed to active and which to inactive
        var activeChangedVertices = Set<Int>()
        var inactiveChangedVertices = Set<Int>()
        
        newData.withUnsafeMutableBytes { (ptr: UnsafeMutableRawBufferPointer) in
            let floatPtr = ptr.bindMemory(to: Float.self)
            let floatsPerVertex = stride / bytesPerComponent
            let offsetFloats = offset / bytesPerComponent
            
            for i in 0..<vectorCount {
                let baseIndex = i * floatsPerVertex + offsetFloats
                let r = floatPtr[baseIndex + 0]
                let g = floatPtr[baseIndex + 1]
                let b = floatPtr[baseIndex + 2]
                
                if floatColorMatchesOneOf4(r, g, b, in: activeColors) {
                    floatPtr[baseIndex + 0] = activeNewColor.0
                    floatPtr[baseIndex + 1] = activeNewColor.1
                    floatPtr[baseIndex + 2] = activeNewColor.2
                    floatPtr[baseIndex + 3] = activeNewColor.3
                    activeChangedVertices.insert(i)
                } else if floatColorMatchesOneOf4(r, g, b, in: inactiveColors) {
                    floatPtr[baseIndex + 0] = inactiveNewColor.0
                    floatPtr[baseIndex + 1] = inactiveNewColor.1
                    floatPtr[baseIndex + 2] = inactiveNewColor.2
                    floatPtr[baseIndex + 3] = inactiveNewColor.3
                    inactiveChangedVertices.insert(i)
                }
            }
        }
        
        let newColorSource = SCNGeometrySource(
            data: newData,
            semantic: .color,
            vectorCount: vectorCount,
            usesFloatComponents: true,
            componentsPerVector: 4,
            bytesPerComponent: bytesPerComponent,
            dataOffset: offset,
            dataStride: stride
        )
        
        let otherSources = geometry.sources.filter { $0.semantic != .color }
        let newGeometry = SCNGeometry(sources: otherSources + [newColorSource], elements: geometry.elements)
        newGeometry.materials = geometry.materials
        
        // Now set material transparency based on which type of changed vertex an element contains
        for (elementIndex, element) in newGeometry.elements.enumerated() {
            let indexCount = element.primitiveCount * (element.primitiveType == .triangles ? 3 : 1)
            var foundActive = false
            var foundInactive = false
            
            element.data.withUnsafeBytes { (indexPtr: UnsafeRawBufferPointer) in
                let bytesPerIndex = element.bytesPerIndex
                if bytesPerIndex == 2 {
                    let shortPtr = indexPtr.bindMemory(to: UInt16.self)
                    for i in 0..<indexCount {
                        let vertIndex = Int(shortPtr[i])
                        if activeChangedVertices.contains(vertIndex) {
                            foundActive = true
                            break
                        } else if inactiveChangedVertices.contains(vertIndex) {
                            foundInactive = true
                            // Don't break yet, check if active also present
                        }
                    }
                } else if bytesPerIndex == 4 {
                    let intPtr = indexPtr.bindMemory(to: UInt32.self)
                    for i in 0..<indexCount {
                        let vertIndex = Int(intPtr[i])
                        if activeChangedVertices.contains(vertIndex) {
                            foundActive = true
                            break
                        } else if inactiveChangedVertices.contains(vertIndex) {
                            foundInactive = true
                        }
                    }
                } else {
                    // // // print("Unexpected index size: \(bytesPerIndex)")
                }
            }
            
            // Decide material transparency:
            // If active changed vertices found, set transparency to activeNewColor alpha
            // Else if inactive changed vertices found, set transparency to inactiveNewColor alpha
            if foundActive {
                newGeometry.materials[elementIndex].transparency = CGFloat(activeNewColor.3)
            } else if foundInactive {
                newGeometry.materials[elementIndex].transparency = CGFloat(inactiveNewColor.3)
            }
        }
        
        node.geometry = newGeometry
    }
}


func floatColorMatchesOneOf4(_ r: Float, _ g: Float, _ b: Float,
                            in targets: [(Float, Float, Float)],
                            tolerance: Float = 0.001) -> Bool {
    for (R, G, B) in targets {
        if abs(R - r) < tolerance && abs(G - g) < tolerance && abs(B - b) < tolerance {
            return true
        }
    }
    return false
}







