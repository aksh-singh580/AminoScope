//
//  ContentView.swift
//  AminoScope
//
//  Created by XCode on 17/12/24.
//

import SwiftUI


struct Protein {
    let name: String
    let description: String
    let available: Bool
}


struct ContentView: View {
    var body: some View {
        NavigationStack {
            TabView {
                GlobularProteinsOptions()
                    .tabItem {
                        Text("Globular")
                    }
                
                FibrousProteinsOptions()
                    .tabItem {
                        Text("Fibrous")
                    }
                
                MembraneProteinsOptions()
                    .tabItem {
                        Text("Membrane")
                }
            }
        }
    }
}



struct GlobularProteinsOptions: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            let proteins: [Protein] = [
                Protein(
                    name: "Myoglobin",
                    description: "A compact protein storing oxygen in muscle tissue, ready for energy demands when oxygen levels drop. Its globular structure facilitates a quick release, supporting high metabolic activities in muscles like the heart, enhancing endurance, and ensuring survival under oxygen-limited conditions.",
                    available: true
                ),
                Protein(
                    name: "Hemoglobin",
                    description: "A red blood cell protein carrying oxygen from lungs to tissues and returning carbon dioxide. Its four-subunit structure enables cooperative oxygen binding and release, adapting to varied needs during exertion and rest, ensuring efficient oxygen delivery critical for sustained cellular respiration.",
                    available: true
                ),
                Protein(
                    name: "Lysozyme",
                    description: "An antimicrobial enzyme present in tears and saliva that specializes in breaking bacterial cell walls. Its globular structure precisely positions active residues for highly efficient catalysis, offering strong protection against pathogens, boosting immunity, and maintaining microbial homeostasis.",
                    available: true
                ),
                Protein(
                    name: "Hexokinase",
                    description: "An enzyme kickstarting glycolysis by phosphorylating glucose, effectively trapping it in cells. Its flexible structure dynamically shifts to embrace substrates, optimizing catalysis, enabling efficient energy production under diverse metabolic conditions, and supporting sustained cellular activity.",
                    available: true
                ),
                Protein(
                    name: "Insulin",
                    description: "A vital hormone regulating blood sugar by binding to specific cell receptors and promoting glucose uptake. Its precise folding ensures reliable signaling for metabolic balance, critical for energy storage, tissue growth, and maintaining overall homeostasis in dynamic physiological states.",
                    available: true
                ),
                
                
                
                Protein(
                    name: "Alcohol Dehydrogenase",
                    description: "An enzyme converting alcohols to aldehydes or ketones, key for ethanol metabolism. Its structured globular shape precisely positions cofactors for oxidation, crucial for detoxification and energy production, adapting to diverse dietary alcohol levels while safeguarding metabolic integrity.",
                    available: false
                ),
                Protein(
                    name: "DNA Polymerase",
                    description: "An essential enzyme duplicating DNA for cell division, meticulously preserving genetic fidelity. Its dynamic subunits ensure accurate nucleotide pairing and robust error correction, absolutely critical for genomic stability and successful adaptation to diverse environmental challenges.",
                    available: false
                ),
                Protein(
                    name: "Carbonic Anhydrase",
                    description: "A fast enzyme balancing pH and CO2 transport by converting carbon dioxide to bicarbonate. Its compact, zinc-coordinated structure drives reactions at remarkable speeds essential for respiratory function, buffering blood effectively and supporting vital physiological processes under stress.",
                    available: false
                )
            ]
            
            
            /// We will base our card calculaiton on landscape
//            let height = min(geometry.size.width, geometry.size.height)
            let width = max(geometry.size.width, geometry.size.height)
            
            
            /// Constatnts that define padding & seperation
            
            let HorizontalPadding: CGFloat = 80
            let HorizontalSeperation: CGFloat = 46
            
            let VerticalPadding: CGFloat = 55
            let VerticalSeperation: CGFloat = 46
            let TopSpace: CGFloat = 10
            
            
            /// Card width is based on having 2 cards in row with set padding and seperation.
            /// So it is equal to total width - 2 x padding (left and right) - 1 card gap (as there are 2). And divide by 2 to get card width of 1
            let cardWidth = (width - (HorizontalPadding * CGFloat(2)) - HorizontalSeperation) / CGFloat(2)
            
            /// Card height is such that we can pack 6 cards, ie. 3 rows with set padding and seperation.
            /// So it equals to total height - top space to make it below tabbar - 2 x padding (top & bottom) - 2 row gap (as there are 3 rows). And divide by 3 to get row height, or of a card, of 1
            /// We can simplyfy bu taking 2 out
//            let cardHeight = (height - TopSpace - ((VerticalPadding + VerticalSeperation) * CGFloat(2))) / CGFloat(3)
            
            let cols = [
                GridItem(
                    .adaptive(minimum: cardWidth, maximum: cardWidth),
                    spacing: HorizontalSeperation)
            ]
            
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: cols, spacing: VerticalSeperation) {
                        Spacer().frame(height: TopSpace / 2)
                        Spacer().frame(height: TopSpace / 2)
                        ForEach(proteins, id: \.name) { protein in
                            Group {
                                if protein.available {
                                    NavigationLink {
                                        ProteinView(model: protein.name)
                                    } label: {
                                        ProteinsCard(
                                            Name: protein.name,
                                            description: protein.description,
                                            cardWidth: cardWidth,
                                            colorScheme: colorScheme,
                                            available: protein.available
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                                else {
                                    ProteinsCard(
                                        Name: protein.name,
                                        description: protein.description,
                                        cardWidth: cardWidth,
                                        colorScheme: colorScheme,
                                        available: protein.available
                                    )
                                }
                            }
                        }
                        Spacer().frame(height: TopSpace)
                    }
                }
                .padding(.top, VerticalPadding)
                
            }

        }
        .ignoresSafeArea(.all)
        .background(
            Group {
                if colorScheme == .light {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                    } else {
                        Color.clear
                    }
                } else if colorScheme == .dark {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                            .colorInvert()
                    } else {
                        Color.clear
                    }
                } else {
                    Color.clear
                }
            }
        )
    }
}





struct FibrousProteinsOptions: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            let proteins: [Protein] = [
                Protein(
                    name: "Collagen",
                    description: "A triple-helical protein forming fibers that strengthen skin, bone, and tissues. Its elongated structure interlocks tightly to create resilient networks, providing durability, flexibility, and structural integrity under mechanical stresses across various connective tissues, ensuring cohesion and stability.",
                    available: true
                ),
                Protein(
                    name: "Keratin",
                    description: "A structural protein in hair, nails, and skin, shielding against physical stress and damage. Its fibrous coils interlink tightly to create toughness, enhancing durability, elasticity, and tensile strength, essential for resilience in harsh environmental conditions and constant mechanical wear.",
                    available: true
                ),

                

                Protein(
                    name: "Elastin",
                    description: "A stretchy protein imparting resilience to tissues like arteries, lungs, and skin. Its elastic coils recoil efficiently after stretching, maintaining tissue shape, flexibility, and structural integrity, while adapting effectively to mechanical stresses, dynamic pressures, and long-term functional demands.",
                    available: false
                ),
                Protein(
                    name: "Actin",
                    description: "A filamentous protein forming the cytoskeleton, supporting shape, movement, and division. Its dynamic strands assemble into sturdy filaments, guiding intracellular transport, muscle action, and cellular stability, adapting effectively to diverse environmental signals for responsiveness.",
                    available: false
                ),
                Protein(
                    name: "Myosin",
                    description: "A motor protein interacting with actin to convert chemical energy into mechanical force. Its fibrous tail and globular heads effectively drive muscle contraction, intracellular cargo movement, and cellular force generation, enabling coordinated and robust physiological activity throughout tissues.",
                    available: false
                ),
                Protein(
                    name: "Fibrin",
                    description: "A fibrous protein forming wound-healing clots, stabilizing damaged areas. Its interlinked fibers create a durable scaffold for tissue repair, protecting against further injury and enabling structural integrity, critical for effective healing, rapid recovery, and maintaining homeostasis under stress.",
                    available: false
                ),
                Protein(
                    name: "Tropomyosin",
                    description: "A regulatory protein spiraling around actin filaments, controlling muscle contraction. Its extended coils efficiently block myosin-binding sites, enabling precise and dynamic regulation of contraction, critical for coordinated muscle activity and maintaining long-term energy efficiency.",
                    available: false
                ),
                Protein(
                    name: "Fibroin",
                    description: "A silk protein spun by silkworms and spiders, prized for tensile strength and natural sheen. Its fibrous sheets yield a soft yet durable material, advancing textiles, biomaterials, and enabling significant innovation in biocompatible applications and sustainable industrial processes.",
                    available: false
                )
            ]
            
            
            /// We will base our card calculaiton on landscape
//            let height = min(geometry.size.width, geometry.size.height)
            let width = max(geometry.size.width, geometry.size.height)
            
            
            /// Constatnts that define padding & seperation
            
            let HorizontalPadding: CGFloat = 80
            let HorizontalSeperation: CGFloat = 46
            
            let VerticalPadding: CGFloat = 55
            let VerticalSeperation: CGFloat = 46
            let TopSpace: CGFloat = 10
            
            
            /// Card width is based on having 2 cards in row with set padding and seperation.
            /// So it is equal to total width - 2 x padding (left and right) - 1 card gap (as there are 2). And divide by 2 to get card width of 1
            let cardWidth = (width - (HorizontalPadding * CGFloat(2)) - HorizontalSeperation) / CGFloat(2)
            
            /// Card height is such that we can pack 6 cards, ie. 3 rows with set padding and seperation.
            /// So it equals to total height - top space to make it below tabbar - 2 x padding (top & bottom) - 2 row gap (as there are 3 rows). And divide by 3 to get row height, or of a card, of 1
            /// We can simplyfy bu taking 2 out
//            let cardHeight = (height - TopSpace - ((VerticalPadding + VerticalSeperation) * CGFloat(2))) / CGFloat(3)
            
            let cols = [
                GridItem(
                    .adaptive(minimum: cardWidth, maximum: cardWidth),
                    spacing: HorizontalSeperation)
            ]
            
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: cols, spacing: VerticalSeperation) {
                        Spacer().frame(height: TopSpace / 2)
                        Spacer().frame(height: TopSpace / 2)
                        ForEach(proteins, id: \.name) { protein in
                            Group {
                                if protein.available {
                                    NavigationLink {
                                        ProteinView(model: protein.name)
                                    } label: {
                                        ProteinsCard(
                                            Name: protein.name,
                                            description: protein.description,
                                            cardWidth: cardWidth,
                                            colorScheme: colorScheme,
                                            available: protein.available
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                                else {
                                    ProteinsCard(
                                        Name: protein.name,
                                        description: protein.description,
                                        cardWidth: cardWidth,
                                        colorScheme: colorScheme,
                                        available: protein.available
                                    )
                                }
                            }
                        }
                        Spacer().frame(height: TopSpace)
                    }
                }
                .padding(.top, VerticalPadding)
            }

        }
        .ignoresSafeArea(.all)
        .background(
            Group {
                if colorScheme == .light {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                    } else {
                        Color.clear
                    }
                } else if colorScheme == .dark {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                            .colorInvert()
                    } else {
                        Color.clear
                    }
                } else {
                    Color.clear
                }
            }
        )
    }
}







struct MembraneProteinsOptions: View {
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        GeometryReader { geometry in
            let proteins: [Protein] = [
                Protein(
                    name: "Bovine Mitochondrial F1-ATPase",
                    description: "A mitochondrial ATP synthase component producing essential cellular energy. Its rotary mechanism, powered by a proton gradient, efficiently and effectively converts chemical energy into ATP, which is critical for sustaining vital metabolic activity across diverse and highly demanding physiological conditions.",
                    available: true
                ),

                

                Protein(
                    name: "Na+/K+ ATPase",
                    description: "A membrane pump exchanging sodium and potassium ions, maintaining essential cellular gradients. Its ATP-driven conformational shifts reliably underpin nerve impulses, muscle contractions, and precise electrolyte balance, vital for sustaining electrical signaling and overall physiological stability.",
                    available: false
                ),
                Protein(
                    name: "GPCR (G-Protein Coupled Receptor)",
                    description: "A versatile receptor detecting hormones, odors, and neurotransmitters. Its seven-transmembrane structure efficiently activates specific G-proteins, relaying intracellular signals and regulating pathways critical for adaptation, cellular communication, and numerous diverse and essential physiological functionalities.",
                    available: false
                ),
                Protein(
                    name: "Integrins",
                    description: "Transmembrane receptors linking the cytoskeleton to the extracellular matrix. Their dynamic binding regulates cell adhesion, migration, and intracellular signaling, enabling tissue integrity, immune responses, and effective cellular communication under changing environmental conditions and mechanical stresses.",
                    available: false
                ),
                Protein(
                    name: "Rhodopsin",
                    description: "A light-sensitive retinal receptor efficiently converting photons into electrical signals for vision. Its seven-transmembrane structure, bound to a specific retinal pigment, initiates visual signal processing, enabling responses to varying light across diverse environmental intensities and phototransduction-related conditions.",
                    available: false
                )
            ]
            
            
            /// We will base our card calculaiton on landscape
//            let height = min(geometry.size.width, geometry.size.height)
            let width = max(geometry.size.width, geometry.size.height)
            
            
            /// Constatnts that define padding & seperation
            
            let HorizontalPadding: CGFloat = 80
            let HorizontalSeperation: CGFloat = 46
            
            let VerticalPadding: CGFloat = 55
            let VerticalSeperation: CGFloat = 46
            let TopSpace: CGFloat = 10
            
            
            /// Card width is based on having 2 cards in row with set padding and seperation.
            /// So it is equal to total width - 2 x padding (left and right) - 1 card gap (as there are 2). And divide by 2 to get card width of 1
            let cardWidth = (width - (HorizontalPadding * CGFloat(2)) - HorizontalSeperation) / CGFloat(2)
            
            /// Card height is such that we can pack 6 cards, ie. 3 rows with set padding and seperation.
            /// So it equals to total height - top space to make it below tabbar - 2 x padding (top & bottom) - 2 row gap (as there are 3 rows). And divide by 3 to get row height, or of a card, of 1
            /// We can simplyfy bu taking 2 out
//            let cardHeight = (height - TopSpace - ((VerticalPadding + VerticalSeperation) * CGFloat(2))) / CGFloat(3)
            
            let cols = [
                GridItem(
                    .adaptive(minimum: cardWidth, maximum: cardWidth),
                    spacing: HorizontalSeperation)
            ]
            
            
            VStack {
                ScrollView {
                    LazyVGrid(columns: cols, spacing: VerticalSeperation) {
                        Spacer().frame(height: TopSpace / 2)
                        Spacer().frame(height: TopSpace / 2)
                        ForEach(proteins, id: \.name) { protein in
                            Group {
                                if protein.available {
                                    NavigationLink {
                                        ProteinView(model: protein.name)
                                    } label: {
                                        ProteinsCard(
                                            Name: protein.name,
                                            description: protein.description,
                                            cardWidth: cardWidth,
                                            colorScheme: colorScheme,
                                            available: protein.available
                                        )
                                    }
                                    .buttonStyle(PlainButtonStyle())
                                }
                                
                                else {
                                    ProteinsCard(
                                        Name: protein.name,
                                        description: protein.description,
                                        cardWidth: cardWidth,
                                        colorScheme: colorScheme,
                                        available: protein.available
                                    )
                                }
                            }
                        }
                        Spacer().frame(height: TopSpace)
                    }
                }
                .padding(.vertical, VerticalPadding)
            }

        }
        .ignoresSafeArea(.all)
        .background(
            Group {
                if colorScheme == .light {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                    } else {
                        Color.clear
                    }
                } else if colorScheme == .dark {
                    if let uiImage = UIImage(named: "home_background-light.jpg") { // The image was puchased from https://www.rawpixel.com/image/2620215/free-illustration-image-gradient-background-abstract
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .edgesIgnoringSafeArea(.all)
                            .opacity(1)
                            .colorInvert()
                    } else {
                        Color.clear
                    }
                } else {
                    Color.clear
                }
            }
        )
    }
}








struct ProteinsCard: View {
    let Name: String
    let description: String
    let cardWidth: CGFloat
    let colorScheme: ColorScheme
    let available: Bool
    
    @State private var showAlert = false
    
    var body: some View {
        let cardVerticalPadding: CGFloat = 13
        let cardHorizontalPadding: CGFloat = 15
//        let cardContentHorizontalSeperation: CGFloat = 10
        let cardContentVerticalSeperation: CGFloat = 13

        Group {
            if !available {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: cardContentVerticalSeperation) {
                        Text(Name)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.accentColor)
                        
                        Text(description)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.title2)
                        .foregroundStyle(
                            available ? Color.accentColor : Color.clear
                        )
                }
                .padding(.vertical, cardVerticalPadding)
                .padding(.horizontal, cardHorizontalPadding)
                .frame(width: cardWidth)
                .background(
                    Group {
                        if available {
                            RoundedRectangle(
                                cornerRadius: 17,
                                style: .continuous
                            )
                            .fill(
                                colorScheme == .dark ? Color.black : Color.white
                            )
                            .shadow(
                                color: Color(red: 0, green: 0, blue: 0.137, opacity: 0.1), // #000023 with 10% opacity
                                radius: 60, // Blur radius
                                x: 0, // X offset
                                y: 5  // Y offset
                            )
                        } else {
                            RoundedRectangle(
                                cornerRadius: 17,
                                style: .continuous
                            )
                            .fill(
                                colorScheme == .dark
                                ? Color(UIColor.systemGray6)
                                : Color(UIColor.systemGray5)
                            )
                        }
                    }
                )
                .onTapGesture {
                    if !available {
                        showAlert = true
                    }
                }
                .alert("Model Not Available Offline", isPresented: $showAlert) {
                    Button("OK", role: .cancel) { }
                } message: {
                    Text("The protein model you are attempting to access is unavailable in offline mode. To proceed, the necessary resources need to be downloaded.")
                }
            } else {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: cardContentVerticalSeperation) {
                        Text(Name)
                            .font(.title2)
                            .fontWeight(.medium)
                            .foregroundStyle(Color.accentColor)
                        
                        Text(description)
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "chevron.forward")
                        .font(.title2)
                        .foregroundStyle(
                            available ? Color.accentColor : Color.clear
                        )
                }
                .padding(.vertical, cardVerticalPadding)
                .padding(.horizontal, cardHorizontalPadding)
                .frame(width: cardWidth)
                .background(
                    Group {
                        if available {
                            RoundedRectangle(
                                cornerRadius: 17,
                                style: .continuous
                            )
                            .fill(
                                colorScheme == .dark ? Color.black : Color.white
                            )
                            .shadow(
                                color: Color(red: 0, green: 0, blue: 0.137, opacity: 0.1), // #000023 with 10% opacity
                                radius: 60, // Blur radius
                                x: 0, // X offset
                                y: 5  // Y offset
                            )
                        } else {
                            RoundedRectangle(
                                cornerRadius: 17,
                                style: .continuous
                            )
                            .fill(
                                colorScheme == .dark
                                ? Color(UIColor.systemGray6)
                                : Color(UIColor.systemGray5)
                            )
                        }
                    }
                )
            }
        }
    }
}








#Preview {
    ContentView()
}
