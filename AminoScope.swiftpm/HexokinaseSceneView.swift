//
//  HexokinaseSceneView.swift
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


struct HexokinaseSceneView: View {
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
                                Text("Hexokinase")
                                    .font(.title)
                                    .foregroundStyle(Color.primary)
                                    .fontWeight(.bold)
                                
                                Spacer().frame(height: 20)

                                    Text("About Hexokinase")
                                        .font(.headline)
                                        .foregroundStyle(Color.secondary)
                                        .padding(.bottom, 1)

                                
                                    Text(
                                        "Hexokinase is a key regulatory enzyme in the glycolytic pathway, responsible for phosphorylating glucose to glucose-6-phosphate—a pivotal step that prevents glucose from leaving the cell and commits it to metabolic processes. It is a globular protein that undergoes a conformational change upon substrate binding, effectively “hugging” the glucose molecule and the ATP co-substrate, which facilitates efficient phosphate transfer. This induced-fit mechanism ensures specificity, high affinity, and effective control of the cell’s energy supply. By regulating the initial step in glucose metabolism, hexokinase plays a central role in energy production, cellular growth, and overall metabolic balance."
                                    )
                                    .font(.body)
                                    .foregroundStyle(Color.primary)
                                    
                                }
                                .padding(.leading, 8)

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
                                ARKitView5(mode: $mode) // AR view
                                    .ignoresSafeArea(.all)
                                    

                            } else {
                                ModelKitView5(mode: $mode) // 3D view
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
                    ARKitView5(mode: $mode) // AR view
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
    HexokinaseSceneView()
//    ContentView()
}


struct ModelKitView5: View {
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
        if let loadedScene = SCNScene(named: "hexokinase-model_1.scn") {
            scene = loadedScene
            scene?.background.contents = colorScheme == .dark ? UIColor.darkGray : UIColor.white
        } else {
            // // print("Could not load hexokinase-model_1.scn")
            scene = nil
        }
    }

}





struct ARKitView5: UIViewRepresentable {
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
        guard let scene = SCNScene(named: "hexokinase-model_1.scn") else {
            // // print("Failed to load the model.")
            return
        }

        // Clone the model node
        let modelNode = scene.rootNode.clone()
        modelNode.name = "HexokinaseModel" // Name the node for identification
        modelNode.scale = SCNVector3(1 / 75.0, 1 / 75.0, 1 / 75.0)

        // Set the position to move the model away from the center
        modelNode.position = SCNVector3(0.0, 0.0, -0.75) // Move 0.75 meters away from the camera
        

        // Add the model node to the scene
        arView.scene.rootNode.addChildNode(modelNode)
    }
    class Coordinator: NSObject, ARSCNViewDelegate {
        var parent: ARKitView5
        var lastScale: CGFloat = 1.0 // Track the last scale for smooth zooming

        init(_ parent: ARKitView5) {
            self.parent = parent
        }

        @objc func handlePinch(_ gesture: UIPinchGestureRecognizer) {
            guard let arView = gesture.view as? ARSCNView else { return }
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HexokinaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HexokinaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HexokinaseModel", recursively: true) else { return }

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
            guard let modelNode = arView.scene.rootNode.childNode(withName: "HexokinaseModel", recursively: true) else { return }

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

