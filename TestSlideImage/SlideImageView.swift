//
//  SlideImageView.swift
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

struct SlideImageView: UIViewRepresentable {
    typealias UIViewType = MediaSlideshow

//    var dataSource: ImageAndVideoSlideshowDataSource
//    var selectedIndex: Int
    
    let localSource = [BundleImageSource(imageString: "img1"), BundleImageSource(imageString: "img2"), BundleImageSource(imageString: "img3"), BundleImageSource(imageString: "img4")]
    let alamofireSource = [AlamofireSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, AlamofireSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let sdWebImageSource = [SDWebImageSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, SDWebImageSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let kingfisherSource = [KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1447746249824-4be4e1b76d66?w=1080")!, KingfisherSource(urlString: "https://images.unsplash.com/photo-1463595373836-6e0b0a8ee322?w=1080")!]
    let videoSource = AVSource(
        url: URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4")!)

    let test = [KingfisherSource](repeating: KingfisherSource(urlString: "https://images.unsplash.com/photo-1432679963831-2dab49187847?w=1080")!, count: 100)


//    lazy var dataSource = ImageAndVideoSlideshowDataSource(
//        sources: [.av(videoSource)] + localSource.map { .image($0) },
//        onAVAppear: .paused)

    func makeUIView(context: Context) -> MediaSlideshow {
        let slideShow = MediaSlideshow()

//        slideShow.slideshowInterval = 5.0
        slideShow.pageIndicatorPosition = .init(horizontal: .center, vertical: .under)
        slideShow.contentScaleMode = UIViewContentMode.scaleAspectFill

        slideShow.pageIndicator = UIPageControl.withSlideshowColors()

        // optional way to show activity indicator during image load (skipping the line will show no activity indicator)
//        slideShow.activityIndicator = DefaultActivityIndicator()
//        slideShow.delegate = self
        
        let dataSource = ImageAndVideoSlideshowDataSource(
            sources: test.map { .image($0) },
            onAVAppear: .paused)

        slideShow.dataSource = dataSource
        slideShow.reloadData()

//        let recognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
//        controller.slideshow.addGestureRecognizer(recognizer)
//        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap))
//        doubleTap.numberOfTapsRequired = 2
//        controller.slideshow.addGestureRecognizer(doubleTap)


        return slideShow
    }

    func updateUIView(_ uiView: MediaSlideshow, context: Context) {

    }

}
