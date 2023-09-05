//
//  SlideImage.swift
//  TestSlideImage
//
//  Created by Thanh Sau on 12/07/2023.
//

import Foundation
import SwiftUI
import MediaSlideshow
import MediaSlideshowKingfisher
import MediaSlideshowAlamofire
import MediaSlideshowSDWebImage

struct SlideImage: UIViewControllerRepresentable {
    typealias UIViewControllerType = FullScreenSlideshowViewController

    let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let videoSource = AVSource(
        url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!)

    
    

    func makeUIViewController(context: Context) -> UIViewControllerType {

        let controller = FullScreenSlideshowViewController()

        // can be used with other sample sources as `afNetworkingSource`, `alamofireSource` or `sdWebImageSource` or `kingfisherSource`
        let dataSource = ImageAndVideoSlideshowDataSource(
            sources: [.av(videoSource)] + localSource.map { .image($0) },
            onAVAppear: .play(muted: false))

//        controller.slideshow.slideshowInterval = 5.0
//        controller.slideshow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
//        controller.slideshow.contentScaleMode = UIViewContentMode.scaleAspectFill
//
//        controller.slideshow.pageIndicator = UIPageControl.withSlideshowColors()

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
//        controller.slideshow.activityIndicator = DefaultActivityIndicator()
//        controller.slideshow.delegate = context.coordinator

        controller.slideshow.dataSource = dataSource
        controller.slideshow.reloadData()

//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(didTap))
//        controller.slideshow.addGestureRecognizer(recognizer)
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
//        doubleTap.numberOfTapsRequired = 2
//        controller.slideshow.addGestureRecognizer(doubleTap)


        return controller
    }

//    func didTap() {
//        let fullScreenController = slideshow.presentFullScreenController(from: self)
//        // set the activity indicator for full screen controller (skipping the line will show no activity indicator)
//        fullScreenController.slideshow.activityIndicator = DefaultActivityIndicator(style: .white, color: nil)
//    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }


    class Coordinator: NSObject, MediaSlideshowDelegate {
        var parent: SlideImage

        init(parent: SlideImage) {
            self.parent = parent
        }

        func mediaSlideshow(_ mediaSlideshow: MediaSlideshow, didChangeCurrentPageTo page: Int) {
            print("current page:", page)
        }
    }
}
