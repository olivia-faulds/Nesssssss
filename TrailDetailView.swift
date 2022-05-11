//
//  TrailDetailView.swift
//  Ness Botanic Gardens App
//
//  Created by Olivia Faulds on 14/03/2022.
//

import SwiftUI

struct TrailDetailView: View {
    var trail: Trail
    
    var body: some View {
        VStack{
            if let image = trail.imageName, image == "map"{
                ImageZoom{
                    Image(trail.imageName)
                        .resizable()
                        .frame(width: 400.0, height: 350)
                }
            }else{
                ImageZoom{
                    Image(trail.imageName)
                        .resizable()
                        .frame(width: 700.0, height: 450)
                }
            }
            Text(trail.title)
                .fontWeight(.bold)
            
            Label(trail.duration, systemImage: "flag")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(trail.description)
                .fontWeight(.semibold)
                .padding()
                    
            
            
        }
    }
}

struct ImageZoom<Content: View>: UIViewRepresentable {
  private var content: Content

  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }

  func makeUIView(context: Context) -> UIScrollView {
    let zoom = UIScrollView()
    zoom.delegate = context.coordinator
    zoom.maximumZoomScale = 20
    zoom.minimumZoomScale = 1
    zoom.bouncesZoom = true

    // create a UIHostingController to hold our SwiftUI content  hostedView
    let hostController = context.coordinator.hostingController.view!
    hostController.translatesAutoresizingMaskIntoConstraints = true
    hostController.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    hostController.frame = zoom.bounds
    zoom.addSubview(hostController)

    return zoom
  }

  func makeCoordinator() -> Coordinator {
    return Coordinator(hostingController: UIHostingController(rootView: self.content))
  }

  func updateUIView(_ uiView: UIScrollView, context: Context) {
    // update the hosting controller's SwiftUI content
    context.coordinator.hostingController.rootView = self.content
    assert(context.coordinator.hostingController.view.superview == uiView)
  }

  class Coordinator: NSObject, UIScrollViewDelegate {
    var hostingController: UIHostingController<Content>

    init(hostingController: UIHostingController<Content>) {
      self.hostingController = hostingController
    }

    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
      return hostingController.view
    }
  }
}


struct TrailDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TrailDetailView(trail: TrailList.avaliableTrails.first!)
    }
}
