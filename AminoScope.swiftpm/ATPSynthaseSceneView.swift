//
//  ATPSynthaseSceneView.swift
//  AminoScope
//
//  Created by Prabhas Kumar on 21/12/24.
//  Edited by Aksh Singh, Prabhas Kumar.
//

import SwiftUI
import SceneKit
//import PlaygroundSupport
import UIKit
import ARKit
import AVFoundation


func checkCameraPermission() -> Bool {
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    switch status {
    case .authorized:
        return true
    case .notDetermined:
        // Request permission
        let semaphore = DispatchSemaphore(value: 0)
        var permissionGranted = false
        AVCaptureDevice.requestAccess(for: .video) { granted in
            permissionGranted = granted
            semaphore.signal()
        }
        semaphore.wait()
        return permissionGranted
    default:
        // Denied or restricted
        return false
    }
}


struct ATPSynthaseSceneView: View {
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
                                Text("ATPSynthase")
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
                                        mode == "Alpha Structure" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Alpha Structure" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Alpha Structure" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Alpha Structure"
                                    }
                                
                                
                                Text("Beta Structure")
                                    .foregroundStyle(
                                        mode == "Beta Structure" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Beta Structure" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Beta Structure" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Beta Structure"
                                    }
                                
                                
                                
                                Text("Gamma Structure")
                                    .foregroundStyle(
                                        mode == "Gamma" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Gamma" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Gamma" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Gamma"
                                    }
                                
                                
                                Text("Magnesium Ions")
                                    .foregroundStyle(
                                        mode == "Magnesium" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Magnesium" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Magnesium" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Magnesium"
                                    }
                                
                                
                                Text("Nucleotide Binding Sites")
                                    .foregroundStyle(
                                        mode == "Nucleotide" ? Color.accentColor : Color.primary
                                    )
                                    .fontWeight(
                                        mode == "Nucleotide" ? .medium : .regular
                                    )
                                    .padding(.horizontal, 8)
                                    .frame(width: 288, height: 44, alignment: .leading)
                                    .background(
                                        Group {
                                            if mode == "Nucleotide" {
                                                RoundedRectangle(cornerRadius: 11, style: .continuous)
                                                    .fill(Color(UIColor.systemGray5))
                                            } else {
                                                Color.clear
                                            }
                                        }
                                    )
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        mode = "Nucleotide"
                                    }
                                
                                
                                Spacer().frame(height: 40)
                                
                                Group {
                                    
                                    switch mode {
                                    case "Polymer":
                                        Text("About ATPSynthase")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "The bovine mitochondrial F1-ATPase is part of the ATP synthase complex embedded in the inner mitochondrial membrane, responsible for the cell’s primary energy currency production. While the F1 portion protrudes into the mitochondrial matrix, the entire ATP synthase harnesses the proton gradient generated by the electron transport chain. As protons flow down this gradient, the enzyme’s rotary mechanism couples their movement to the synthesis of ATP from ADP and inorganic phosphate. F1-ATPase’s intricate subunit arrangement and dynamic conformational changes underscore its role as a molecular motor that fuels nearly every energy-dependent process in the cell."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "Alpha Structure":
                                        
                                        Text("About Alpha Structures")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "In Bovine Mitochondrial F₁-ATPase, the alpha subunits, highlighted in orange, form part of the catalytic core of the enzyme. These alpha subunits work in tandem with beta subunits to facilitate the binding and conversion of ADP and inorganic phosphate into ATP. The arrangement of alpha subunits is critical for the proper alignment and function of the catalytic sites, ensuring efficient ATP synthesis during the enzyme’s rotary mechanism."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                    case "Beta Structure":
                                        
                                        Text("About Beta Structures")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "In Bovine Mitochondrial F₁-ATPase, the beta subunits, highlighted in blue, are directly involved in the catalytic activity of ATP synthesis. Each beta subunit contains a binding site for ADP and phosphate, where the actual formation of ATP occurs. The dynamic interaction between alpha and beta subunits is essential for the enzyme’s ability to undergo conformational changes that drive the rotational catalysis necessary for ATP production."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "Gamma":
                                        
                                        Text("About Gamma Structures")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "In Bovine Mitochondrial F₁-ATPase, the gamma subunit, highlighted in yellow, serves as the central shaft that connects the catalytic F₁ portion to the membrane-bound F₀ portion of the ATP synthase complex. The gamma subunit undergoes rotational movement as protons flow through the F₀ complex, inducing conformational changes in the alpha and beta subunits that drive ATP synthesis. Its pivotal role in the enzyme’s rotary mechanism is fundamental to the efficient production of ATP."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "Magnesium":
                                        
                                        Text("About Magnesium Ions")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "In Bovine Mitochondrial F₁-ATPase, the magnesium ions (Mg²⁺), highlighted in pink, are essential cofactors that stabilize the binding of ATP and ADP within the active sites of the beta subunits. Magnesium ions facilitate the proper orientation of phosphate groups during the phosphorylation process, enhancing the enzyme’s catalytic efficiency. Their presence is critical for the accurate and efficient synthesis of ATP, ensuring the enzyme operates effectively under physiological conditions."
                                        )
                                        .font(.body)
                                        .foregroundStyle(Color.primary)
                                        
                                        
                                    case "Nucleotide":
                                        
                                        Text("About Nucleotide Binding Sites")
                                            .font(.headline)
                                            .foregroundStyle(Color.secondary)
                                            .padding(.bottom, 1)
                                        
                                        
                                        Text(
                                            "In Bovine Mitochondrial F₁-ATPase, the nucleotide binding sites, highlighted in red, are specialized regions where ADP and inorganic phosphate bind to facilitate ATP synthesis. These binding sites are strategically located within the beta subunits, allowing for the precise alignment of substrates necessary for the phosphorylation reaction. The interaction between nucleotides and these binding sites is crucial for the enzyme’s ability to produce ATP efficiently, supporting the cell’s energy demands."
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
                                ARKitView8(mode: $mode) // AR view
                                    .ignoresSafeArea(.all)
                                    
                                
                            } else {
                                ModelKitView8(mode: $mode) // 3D view
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
                    ARKitView8(mode: $mode) // AR view
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
    ATPSynthaseSceneView()
//    ContentView()
}


struct ModelKitView8: View {
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
            loadScene()
        }
        .onChange(of: mode) { oldValue, newValue in
            loadScene()
        }
        .onChange(of: colorScheme) { oldValue, newValue in
            loadScene()
        }
    }

    func loadScene() {
        if let loadedScene = SCNScene(named: "bovine_mitochondrial_f1-atpase-model_1.scn") {
            scene = loadedScene
            scene?.background.contents = colorScheme == .dark ? UIColor.darkGray : UIColor.white
            applyColorScheme8(to: loadedScene, mode: mode)
        } else {
//            // // print("Could not load bovine_mitochondrial_f1-atpase-model_1.scn")
            scene = nil
        }
    }

}

struct ARKitView8: UIViewRepresentable {
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

        // Load the scene
        guard let scene = SCNScene(named: "bovine_mitochondrial_f1-atpase-model_1.scn") else {
//            // // print("Failed to load the model.")
            return
        }
        // Apply any customizations
        applyColorScheme8(to: scene, mode: mode)

        // Clone the model node
        let modelNode = scene.rootNode.clone()
        modelNode.name = "ATPSynthaseModel" // Name the node for identification
        modelNode.scale = SCNVector3(1 / 75.0, 1 / 75.0, 1 / 75.0)

        // Set the position to move the model away from the center
        modelNode.position = SCNVector3(0.0, 0.0, -0.75) // Move 0.75 meters away from the camera
        

        // Add the model node to the scene
        arView.scene.rootNode.addChildNode(modelNode)
    }
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARKitView8
        var lastScale: CGFloat = 1.0 // Track the last scale for smooth zooming

        init(_ parent: ARKitView8) {
            self.parent = parent
        }

        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "ATPSynthaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "ATPSynthaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "ATPSynthaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "ATPSynthaseModel", recursively: true) else { return }

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
//            // // print("AR session failed: \(error.localizedDescription)")
        }

        func sessionWasInterrupted(_ session: ARSession) {
//            // // print("AR session was interrupted.")
        }

        func sessionInterruptionEnded(_ session: ARSession) {
//            // // print("AR session interruption ended.")
        }
    }
}





func applyColorScheme8(to scene: SCNScene, mode: String) {
    let activeColors: [(Float, Float, Float)]
    let inactiveColors: [(Float, Float, Float)]
    let activeNewColor: (Float, Float, Float, Float)
    let showInactive: Bool
    // // print(mode)
    switch mode {
    case "Polymer":
        activeColors = [
            (0.3412, 0.3490, 0.3804), // lead
            (0.8784, 0.4000, 0.2000), // iron
            (0.2588, 0.5098, 0.5882), // radon
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.0902, 0.3294, 0.5294), // iridium
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        inactiveColors = [
            (0.3137, 0.8157, 0.3137), // nickel
            (0.6118, 0.4784, 0.7804)  // manganese
        ]
        activeNewColor = (0.1, 0.6, 0.6, 1.0) // deepteal
        showInactive = false
        
    case "Alpha Structure":
        activeColors = [
            (0.3412, 0.3490, 0.3804), // lead

        ]
        inactiveColors = [
            (0.3137, 0.8157, 0.3137), // nickel
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804), // Titanium
            (0.8784, 0.4000, 0.2000), // iron
            (0.2588, 0.5098, 0.5882), // radon
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (1, 0.5, 0, 1) // orange
        showInactive = true
        
    case "Beta Structure":
        activeColors = [
            (0.8784, 0.4000, 0.2000), // iron

        ]
        inactiveColors = [
            (0.2588, 0.5098, 0.5882), // radon
            (0.3137, 0.8157, 0.3137), // nickel
            (0.3412, 0.3490, 0.3804), // lead
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804), // Titanium
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (0.0, 0.5, 1.0, 1) // marine
        showInactive = true
        
    case "Gamma":
        activeColors = [
            (0.0902, 0.3294, 0.5294), // iridium

        ]
        inactiveColors = [
            (0.3137, 0.8157, 0.3137), // nickel
            (0.7490, 0.7608, 0.7804), // Titanium
            (0.2588, 0.5098, 0.5882), // radon
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.8784, 0.4000, 0.2000), // iron
            (0.3412, 0.3490, 0.3804), // lead
            (0.6118, 0.4784, 0.7804), // manganese
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (1, 1, 0, 1) // yellow
        showInactive = true
        
    case "Magnesium":
        activeColors = [
            (0.6118, 0.4784, 0.7804), // manganese
        ]
        inactiveColors = [
            (0.3137, 0.8157, 0.3137), // nickel
            (0.8784, 0.4000, 0.2000), // iron
            (0.0902, 0.3294, 0.5294), // iridium
            (0.3412, 0.3490, 0.3804), // lead
            (0.2588, 0.5098, 0.5882), // radon
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (0.85, 0.2, 0.5, 1) // warmpink
        showInactive = true
        
    case "Nucleotide":
        activeColors = [
            (0.3137, 0.8157, 0.3137), // nickel
        ]
        inactiveColors = [
            (0.6118, 0.4784, 0.7804), // manganese
            (0.0902, 0.3294, 0.5294), // iridium
            (0.8784, 0.4000, 0.2000), // iron
            (0.3412, 0.3490, 0.3804), // lead
            (0.2588, 0.5098, 0.5882), // radon
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (1, 0, 0, 1) // red
        showInactive = true

        
    default:
        // Default scheme, no changes
        // // print("here")
        activeColors = []
        inactiveColors = [
            (0.3412, 0.3490, 0.3804), // lead
            (0.8784, 0.4000, 0.2000), // iron
            (0.3137, 0.8157, 0.3137), // nickel
            (0.2588, 0.5098, 0.5882), // radon
            (0.0902, 0.3294, 0.5294), // iridium
            (0.6118, 0.4784, 0.7804), // manganese
            (0.4902, 0.502, 0.6902),  // Zinc
            (0.7490, 0.7608, 0.7804)  // Titanium

        ]
        activeNewColor = (0.1, 0.6, 0.6, 1.0) // doesn't matter
        showInactive = true
    }
    
    modifyVertexColors8(
        in: scene,
        activeColors: activeColors,
        inactiveColors: inactiveColors,
        activeNewColor: activeNewColor,
        showInactive: showInactive
    )
}

func modifyVertexColors8(
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
                
                if floatColorMatchesOneOf8(r, g, b, in: activeColors) {
                    floatPtr[baseIndex + 0] = activeNewColor.0
                    floatPtr[baseIndex + 1] = activeNewColor.1
                    floatPtr[baseIndex + 2] = activeNewColor.2
                    floatPtr[baseIndex + 3] = activeNewColor.3
                    activeChangedVertices.insert(i)
                } else if floatColorMatchesOneOf8(r, g, b, in: inactiveColors) {
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
            var foundGamma = false
            var foundInactive = false
            
            element.data.withUnsafeBytes { (indexPtr: UnsafeRawBufferPointer) in
                let bytesPerIndex = element.bytesPerIndex
                if bytesPerIndex == 2 {
                    let shortPtr = indexPtr.bindMemory(to: UInt16.self)
                    for i in 0..<indexCount {
                        let vertIndex = Int(shortPtr[i])
                        if activeChangedVertices.contains(vertIndex) {
                            foundGamma = true
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
                            foundGamma = true
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
            if foundGamma {
                newGeometry.materials[elementIndex].transparency = CGFloat(activeNewColor.3)
            } else if foundInactive {
                newGeometry.materials[elementIndex].transparency = CGFloat(inactiveNewColor.3)
            }
        }
        
        node.geometry = newGeometry
    }
}


func floatColorMatchesOneOf8(_ r: Float, _ g: Float, _ b: Float,
                            in targets: [(Float, Float, Float)],
                            tolerance: Float = 0.001) -> Bool {
    for (R, G, B) in targets {
        if abs(R - r) < tolerance && abs(G - g) < tolerance && abs(B - b) < tolerance {
            return true
        }
    }
    return false
}






