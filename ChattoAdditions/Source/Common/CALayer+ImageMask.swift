//
// The MIT License (MIT)
//
// Copyright (c) 2015-present Badoo Trading Limited.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


import UIKit

extension CALayer {
    public static func bma_maskLayer(from maskImage: UIImage) -> CALayer {
        let layer = CALayer()
        layer.contents = maskImage.cgImage
        layer.contentsScale = maskImage.scale
        layer.contentsCenter = .contentsCenter(relativeTo: maskImage.size,
                                               capInsets: maskImage.capInsets)
        return layer
    }
}

private extension CGRect {

    private static func centerContentsCenter(for size: CGSize) -> CGRect {
        let horizontalPointSize = 1 / size.width
        let verticalPointSize = 1 / size.height
        return CGRect(
            x: 0.5,
            y: 0.5,
            width: horizontalPointSize,
            height: verticalPointSize
        )
    }

    static func contentsCenter(relativeTo size: CGSize, capInsets: UIEdgeInsets) -> CGRect {
        guard capInsets != .zero else { return .centerContentsCenter(for: size) }

        var relative = capInsets

        relative.left /= size.width
        relative.right /= size.width
        relative.top /= size.height
        relative.bottom /= size.height

        return CGRect(
            x: relative.top,
            y: relative.left,
            width: 1 - (relative.left + relative.right),
            height: 1 - (relative.top + relative.bottom)
        )
    }
}
