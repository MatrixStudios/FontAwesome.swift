// FontAwesome.swift
//
// Copyright (c) 2014 Doan Truong Thi
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
import CoreText

private class FontLoader {
  class func loadFont(name: String) {
    let bundle = NSBundle.mainBundle()
    let fontURL = bundle.URLForResource(name, withExtension: "otf")
    
    let data = NSData(contentsOfURL: fontURL!)!
    
    let provider = CGDataProviderCreateWithCFData(data)
    let font = CGFontCreateWithDataProvider(provider)!
    
    var error: Unmanaged<CFError>?
    if !CTFontManagerRegisterGraphicsFont(font, &error) {
      let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
      let nsError = error!.takeUnretainedValue() as AnyObject as NSError
      NSException(name: NSInternalInconsistencyException, reason: errorDescription, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
    }
  }
}

public extension UIFont {
  public class func fontAwesomeOfSize(fontSize: CGFloat) -> UIFont {
    struct Static {
      static var onceToken : dispatch_once_t = 0
    }
    
    let name = "FontAwesome"
    if (UIFont.fontNamesForFamilyName(name).count == 0) {
      dispatch_once(&Static.onceToken) {
        FontLoader.loadFont(name)
      }
    }

    return UIFont(name: name, size: fontSize)!
  }
}

public extension String {
  public static func fontAwesomeIconWithName(name: String) -> String {
    var icons: [String: String]?
    var token: dispatch_once_t = 0
    
    dispatch_once(&token) {
      icons = [
        "fa-adjust":"\u{f042}",
        "fa-adn":"\u{f170}",
        "fa-align-center":"\u{f037}",
        "fa-align-justify":"\u{f039}",
        "fa-align-left":"\u{f036}",
        "fa-align-right":"\u{f038}",
        "fa-ambulance":"\u{f0f9}",
        "fa-anchor":"\u{f13d}",
        "fa-android":"\u{f17b}",
        "fa-angellist":"\u{f209}",
        "fa-angle-double-down":"\u{f103}",
        "fa-angle-double-left":"\u{f100}",
        "fa-angle-double-right":"\u{f101}",
        "fa-angle-double-up":"\u{f102}",
        "fa-angle-down":"\u{f107}",
        "fa-angle-left":"\u{f104}",
        "fa-angle-right":"\u{f105}",
        "fa-angle-up":"\u{f106}",
        "fa-apple":"\u{f179}",
        "fa-archive":"\u{f187}",
        "fa-area-chart":"\u{f1fe}",
        "fa-arrow-circle-down":"\u{f0ab}",
        "fa-arrow-circle-left":"\u{f0a8}",
        "fa-arrow-circle-o-down":"\u{f01a}",
        "fa-arrow-circle-o-left":"\u{f190}",
        "fa-arrow-circle-o-right":"\u{f18e}",
        "fa-arrow-circle-o-up":"\u{f01b}",
        "fa-arrow-circle-right":"\u{f0a9}",
        "fa-arrow-circle-up":"\u{f0aa}",
        "fa-arrow-down":"\u{f063}",
        "fa-arrow-left":"\u{f060}",
        "fa-arrow-right":"\u{f061}",
        "fa-arrow-up":"\u{f062}",
        "fa-arrows":"\u{f047}",
        "fa-arrows-alt":"\u{f0b2}",
        "fa-arrows-h":"\u{f07e}",
        "fa-arrows-v":"\u{f07d}",
        "fa-asterisk":"\u{f069}",
        "fa-at":"\u{f1fa}",
        "fa-automobile (alias)":"\u{f1b9}",
        "fa-backward":"\u{f04a}",
        "fa-ban":"\u{f05e}",
        "fa-bank (alias)":"\u{f19c}",
        "fa-bar-chart":"\u{f080}",
        "fa-bar-chart-o (alias)":"\u{f080}",
        "fa-barcode":"\u{f02a}",
        "fa-bars":"\u{f0c9}",
        "fa-bed":"\u{f236}",
        "fa-beer":"\u{f0fc}",
        "fa-behance":"\u{f1b4}",
        "fa-behance-square":"\u{f1b5}",
        "fa-bell":"\u{f0f3}",
        "fa-bell-o":"\u{f0a2}",
        "fa-bell-slash":"\u{f1f6}",
        "fa-bell-slash-o":"\u{f1f7}",
        "fa-bicycle":"\u{f206}",
        "fa-binoculars":"\u{f1e5}",
        "fa-birthday-cake":"\u{f1fd}",
        "fa-bitbucket":"\u{f171}",
        "fa-bitbucket-square":"\u{f172}",
        "fa-bitcoin (alias)":"\u{f15a}",
        "fa-bold":"\u{f032}",
        "fa-bolt":"\u{f0e7}",
        "fa-bomb":"\u{f1e2}",
        "fa-book":"\u{f02d}",
        "fa-bookmark":"\u{f02e}",
        "fa-bookmark-o":"\u{f097}",
        "fa-briefcase":"\u{f0b1}",
        "fa-btc":"\u{f15a}",
        "fa-bug":"\u{f188}",
        "fa-building":"\u{f1ad}",
        "fa-building-o":"\u{f0f7}",
        "fa-bullhorn":"\u{f0a1}",
        "fa-bullseye":"\u{f140}",
        "fa-bus":"\u{f207}",
        "fa-buysellads":"\u{f20d}",
        "fa-cab (alias)":"\u{f1ba}",
        "fa-calculator":"\u{f1ec}",
        "fa-calendar":"\u{f073}",
        "fa-calendar-o":"\u{f133}",
        "fa-camera":"\u{f030}",
        "fa-camera-retro":"\u{f083}",
        "fa-car":"\u{f1b9}",
        "fa-caret-down":"\u{f0d7}",
        "fa-caret-left":"\u{f0d9}",
        "fa-caret-right":"\u{f0da}",
        "fa-caret-square-o-down":"\u{f150}",
        "fa-caret-square-o-left":"\u{f191}",
        "fa-caret-square-o-right":"\u{f152}",
        "fa-caret-square-o-up":"\u{f151}",
        "fa-caret-up":"\u{f0d8}",
        "fa-cart-arrow-down":"\u{f218}",
        "fa-cart-plus":"\u{f217}",
        "fa-cc":"\u{f20a}",
        "fa-cc-amex":"\u{f1f3}",
        "fa-cc-discover":"\u{f1f2}",
        "fa-cc-mastercard":"\u{f1f1}",
        "fa-cc-paypal":"\u{f1f4}",
        "fa-cc-stripe":"\u{f1f5}",
        "fa-cc-visa":"\u{f1f0}",
        "fa-certificate":"\u{f0a3}",
        "fa-chain (alias)":"\u{f0c1}",
        "fa-chain-broken":"\u{f127}",
        "fa-check":"\u{f00c}",
        "fa-check-circle":"\u{f058}",
        "fa-check-circle-o":"\u{f05d}",
        "fa-check-square":"\u{f14a}",
        "fa-check-square-o":"\u{f046}",
        "fa-chevron-circle-down":"\u{f13a}",
        "fa-chevron-circle-left":"\u{f137}",
        "fa-chevron-circle-right":"\u{f138}",
        "fa-chevron-circle-up":"\u{f139}",
        "fa-chevron-down":"\u{f078}",
        "fa-chevron-left":"\u{f053}",
        "fa-chevron-right":"\u{f054}",
        "fa-chevron-up":"\u{f077}",
        "fa-child":"\u{f1ae}",
        "fa-circle":"\u{f111}",
        "fa-circle-o":"\u{f10c}",
        "fa-circle-o-notch":"\u{f1ce}",
        "fa-circle-thin":"\u{f1db}",
        "fa-clipboard":"\u{f0ea}",
        "fa-clock-o":"\u{f017}",
        "fa-close (alias)":"\u{f00d}",
        "fa-cloud":"\u{f0c2}",
        "fa-cloud-download":"\u{f0ed}",
        "fa-cloud-upload":"\u{f0ee}",
        "fa-cny (alias)":"\u{f157}",
        "fa-code":"\u{f121}",
        "fa-code-fork":"\u{f126}",
        "fa-codepen":"\u{f1cb}",
        "fa-coffee":"\u{f0f4}",
        "fa-cog":"\u{f013}",
        "fa-cogs":"\u{f085}",
        "fa-columns":"\u{f0db}",
        "fa-comment":"\u{f075}",
        "fa-comment-o":"\u{f0e5}",
        "fa-comments":"\u{f086}",
        "fa-comments-o":"\u{f0e6}",
        "fa-compass":"\u{f14e}",
        "fa-compress":"\u{f066}",
        "fa-connectdevelop":"\u{f20e}",
        "fa-copy (alias)":"\u{f0c5}",
        "fa-copyright":"\u{f1f9}",
        "fa-credit-card":"\u{f09d}",
        "fa-crop":"\u{f125}",
        "fa-crosshairs":"\u{f05b}",
        "fa-css3":"\u{f13c}",
        "fa-cube":"\u{f1b2}",
        "fa-cubes":"\u{f1b3}",
        "fa-cut (alias)":"\u{f0c4}",
        "fa-cutlery":"\u{f0f5}",
        "fa-dashboard (alias)":"\u{f0e4}",
        "fa-dashcube":"\u{f210}",
        "fa-database":"\u{f1c0}",
        "fa-dedent (alias)":"\u{f03b}",
        "fa-delicious":"\u{f1a5}",
        "fa-desktop":"\u{f108}",
        "fa-deviantart":"\u{f1bd}",
        "fa-diamond":"\u{f219}",
        "fa-digg":"\u{f1a6}",
        "fa-dollar (alias)":"\u{f155}",
        "fa-dot-circle-o":"\u{f192}",
        "fa-download":"\u{f019}",
        "fa-dribbble":"\u{f17d}",
        "fa-dropbox":"\u{f16b}",
        "fa-drupal":"\u{f1a9}",
        "fa-edit (alias)":"\u{f044}",
        "fa-eject":"\u{f052}",
        "fa-ellipsis-h":"\u{f141}",
        "fa-ellipsis-v":"\u{f142}",
        "fa-empire":"\u{f1d1}",
        "fa-envelope":"\u{f0e0}",
        "fa-envelope-o":"\u{f003}",
        "fa-envelope-square":"\u{f199}",
        "fa-eraser":"\u{f12d}",
        "fa-eur":"\u{f153}",
        "fa-euro (alias)":"\u{f153}",
        "fa-exchange":"\u{f0ec}",
        "fa-exclamation":"\u{f12a}",
        "fa-exclamation-circle":"\u{f06a}",
        "fa-exclamation-triangle":"\u{f071}",
        "fa-expand":"\u{f065}",
        "fa-external-link":"\u{f08e}",
        "fa-external-link-square":"\u{f14c}",
        "fa-eye":"\u{f06e}",
        "fa-eye-slash":"\u{f070}",
        "fa-eyedropper":"\u{f1fb}",
        "fa-facebook":"\u{f09a}",
        "fa-facebook-f (alias)":"\u{f09a}",
        "fa-facebook-official":"\u{f230}",
        "fa-facebook-square":"\u{f082}",
        "fa-fast-backward":"\u{f049}",
        "fa-fast-forward":"\u{f050}",
        "fa-fax":"\u{f1ac}",
        "fa-female":"\u{f182}",
        "fa-fighter-jet":"\u{f0fb}",
        "fa-file":"\u{f15b}",
        "fa-file-archive-o":"\u{f1c6}",
        "fa-file-audio-o":"\u{f1c7}",
        "fa-file-code-o":"\u{f1c9}",
        "fa-file-excel-o":"\u{f1c3}",
        "fa-file-image-o":"\u{f1c5}",
        "fa-file-movie-o (alias)":"\u{f1c8}",
        "fa-file-o":"\u{f016}",
        "fa-file-pdf-o":"\u{f1c1}",
        "fa-file-photo-o (alias)":"\u{f1c5}",
        "fa-file-picture-o (alias)":"\u{f1c5}",
        "fa-file-powerpoint-o":"\u{f1c4}",
        "fa-file-sound-o (alias)":"\u{f1c7}",
        "fa-file-text":"\u{f15c}",
        "fa-file-text-o":"\u{f0f6}",
        "fa-file-video-o":"\u{f1c8}",
        "fa-file-word-o":"\u{f1c2}",
        "fa-file-zip-o (alias)":"\u{f1c6}",
        "fa-files-o":"\u{f0c5}",
        "fa-film":"\u{f008}",
        "fa-filter":"\u{f0b0}",
        "fa-fire":"\u{f06d}",
        "fa-fire-extinguisher":"\u{f134}",
        "fa-flag":"\u{f024}",
        "fa-flag-checkered":"\u{f11e}",
        "fa-flag-o":"\u{f11d}",
        "fa-flash (alias)":"\u{f0e7}",
        "fa-flask":"\u{f0c3}",
        "fa-flickr":"\u{f16e}",
        "fa-floppy-o":"\u{f0c7}",
        "fa-folder":"\u{f07b}",
        "fa-folder-o":"\u{f114}",
        "fa-folder-open":"\u{f07c}",
        "fa-folder-open-o":"\u{f115}",
        "fa-font":"\u{f031}",
        "fa-forumbee":"\u{f211}",
        "fa-forward":"\u{f04e}",
        "fa-foursquare":"\u{f180}",
        "fa-frown-o":"\u{f119}",
        "fa-futbol-o":"\u{f1e3}",
        "fa-gamepad":"\u{f11b}",
        "fa-gavel":"\u{f0e3}",
        "fa-gbp":"\u{f154}",
        "fa-ge (alias)":"\u{f1d1}",
        "fa-gear (alias)":"\u{f013}",
        "fa-gears (alias)":"\u{f085}",
        "fa-genderless (alias)":"\u{f1db}",
        "fa-gift":"\u{f06b}",
        "fa-git":"\u{f1d3}",
        "fa-git-square":"\u{f1d2}",
        "fa-github":"\u{f09b}",
        "fa-github-alt":"\u{f113}",
        "fa-github-square":"\u{f092}",
        "fa-gittip (alias)":"\u{f184}",
        "fa-glass":"\u{f000}",
        "fa-globe":"\u{f0ac}",
        "fa-google":"\u{f1a0}",
        "fa-google-plus":"\u{f0d5}",
        "fa-google-plus-square":"\u{f0d4}",
        "fa-google-wallet":"\u{f1ee}",
        "fa-graduation-cap":"\u{f19d}",
        "fa-gratipay":"\u{f184}",
        "fa-group (alias)":"\u{f0c0}",
        "fa-h-square":"\u{f0fd}",
        "fa-hacker-news":"\u{f1d4}",
        "fa-hand-o-down":"\u{f0a7}",
        "fa-hand-o-left":"\u{f0a5}",
        "fa-hand-o-right":"\u{f0a4}",
        "fa-hand-o-up":"\u{f0a6}",
        "fa-hdd-o":"\u{f0a0}",
        "fa-header":"\u{f1dc}",
        "fa-headphones":"\u{f025}",
        "fa-heart":"\u{f004}",
        "fa-heart-o":"\u{f08a}",
        "fa-heartbeat":"\u{f21e}",
        "fa-history":"\u{f1da}",
        "fa-home":"\u{f015}",
        "fa-hospital-o":"\u{f0f8}",
        "fa-hotel (alias)":"\u{f236}",
        "fa-html5":"\u{f13b}",
        "fa-ils":"\u{f20b}",
        "fa-image (alias)":"\u{f03e}",
        "fa-inbox":"\u{f01c}",
        "fa-indent":"\u{f03c}",
        "fa-info":"\u{f129}",
        "fa-info-circle":"\u{f05a}",
        "fa-inr":"\u{f156}",
        "fa-instagram":"\u{f16d}",
        "fa-institution (alias)":"\u{f19c}",
        "fa-ioxhost":"\u{f208}",
        "fa-italic":"\u{f033}",
        "fa-joomla":"\u{f1aa}",
        "fa-jpy":"\u{f157}",
        "fa-jsfiddle":"\u{f1cc}",
        "fa-key":"\u{f084}",
        "fa-keyboard-o":"\u{f11c}",
        "fa-krw":"\u{f159}",
        "fa-language":"\u{f1ab}",
        "fa-laptop":"\u{f109}",
        "fa-lastfm":"\u{f202}",
        "fa-lastfm-square":"\u{f203}",
        "fa-leaf":"\u{f06c}",
        "fa-leanpub":"\u{f212}",
        "fa-legal (alias)":"\u{f0e3}",
        "fa-lemon-o":"\u{f094}",
        "fa-level-down":"\u{f149}",
        "fa-level-up":"\u{f148}",
        "fa-life-bouy (alias)":"\u{f1cd}",
        "fa-life-buoy (alias)":"\u{f1cd}",
        "fa-life-ring":"\u{f1cd}",
        "fa-life-saver (alias)":"\u{f1cd}",
        "fa-lightbulb-o":"\u{f0eb}",
        "fa-line-chart":"\u{f201}",
        "fa-link":"\u{f0c1}",
        "fa-linkedin":"\u{f0e1}",
        "fa-linkedin-square":"\u{f08c}",
        "fa-linux":"\u{f17c}",
        "fa-list":"\u{f03a}",
        "fa-list-alt":"\u{f022}",
        "fa-list-ol":"\u{f0cb}",
        "fa-list-ul":"\u{f0ca}",
        "fa-location-arrow":"\u{f124}",
        "fa-lock":"\u{f023}",
        "fa-long-arrow-down":"\u{f175}",
        "fa-long-arrow-left":"\u{f177}",
        "fa-long-arrow-right":"\u{f178}",
        "fa-long-arrow-up":"\u{f176}",
        "fa-magic":"\u{f0d0}",
        "fa-magnet":"\u{f076}",
        "fa-mail-forward (alias)":"\u{f064}",
        "fa-mail-reply (alias)":"\u{f112}",
        "fa-mail-reply-all (alias)":"\u{f122}",
        "fa-male":"\u{f183}",
        "fa-map-marker":"\u{f041}",
        "fa-mars":"\u{f222}",
        "fa-mars-double":"\u{f227}",
        "fa-mars-stroke":"\u{f229}",
        "fa-mars-stroke-h":"\u{f22b}",
        "fa-mars-stroke-v":"\u{f22a}",
        "fa-maxcdn":"\u{f136}",
        "fa-meanpath":"\u{f20c}",
        "fa-medium":"\u{f23a}",
        "fa-medkit":"\u{f0fa}",
        "fa-meh-o":"\u{f11a}",
        "fa-mercury":"\u{f223}",
        "fa-microphone":"\u{f130}",
        "fa-microphone-slash":"\u{f131}",
        "fa-minus":"\u{f068}",
        "fa-minus-circle":"\u{f056}",
        "fa-minus-square":"\u{f146}",
        "fa-minus-square-o":"\u{f147}",
        "fa-mobile":"\u{f10b}",
        "fa-mobile-phone (alias)":"\u{f10b}",
        "fa-money":"\u{f0d6}",
        "fa-moon-o":"\u{f186}",
        "fa-mortar-board (alias)":"\u{f19d}",
        "fa-motorcycle":"\u{f21c}",
        "fa-music":"\u{f001}",
        "fa-navicon (alias)":"\u{f0c9}",
        "fa-neuter":"\u{f22c}",
        "fa-newspaper-o":"\u{f1ea}",
        "fa-openid":"\u{f19b}",
        "fa-outdent":"\u{f03b}",
        "fa-pagelines":"\u{f18c}",
        "fa-paint-brush":"\u{f1fc}",
        "fa-paper-plane":"\u{f1d8}",
        "fa-paper-plane-o":"\u{f1d9}",
        "fa-paperclip":"\u{f0c6}",
        "fa-paragraph":"\u{f1dd}",
        "fa-paste (alias)":"\u{f0ea}",
        "fa-pause":"\u{f04c}",
        "fa-paw":"\u{f1b0}",
        "fa-paypal":"\u{f1ed}",
        "fa-pencil":"\u{f040}",
        "fa-pencil-square":"\u{f14b}",
        "fa-pencil-square-o":"\u{f044}",
        "fa-phone":"\u{f095}",
        "fa-phone-square":"\u{f098}",
        "fa-photo (alias)":"\u{f03e}",
        "fa-picture-o":"\u{f03e}",
        "fa-pie-chart":"\u{f200}",
        "fa-pied-piper":"\u{f1a7}",
        "fa-pied-piper-alt":"\u{f1a8}",
        "fa-pinterest":"\u{f0d2}",
        "fa-pinterest-p":"\u{f231}",
        "fa-pinterest-square":"\u{f0d3}",
        "fa-plane":"\u{f072}",
        "fa-play":"\u{f04b}",
        "fa-play-circle":"\u{f144}",
        "fa-play-circle-o":"\u{f01d}",
        "fa-plug":"\u{f1e6}",
        "fa-plus":"\u{f067}",
        "fa-plus-circle":"\u{f055}",
        "fa-plus-square":"\u{f0fe}",
        "fa-plus-square-o":"\u{f196}",
        "fa-power-off":"\u{f011}",
        "fa-print":"\u{f02f}",
        "fa-puzzle-piece":"\u{f12e}",
        "fa-qq":"\u{f1d6}",
        "fa-qrcode":"\u{f029}",
        "fa-question":"\u{f128}",
        "fa-question-circle":"\u{f059}",
        "fa-quote-left":"\u{f10d}",
        "fa-quote-right":"\u{f10e}",
        "fa-ra (alias)":"\u{f1d0}",
        "fa-random":"\u{f074}",
        "fa-rebel":"\u{f1d0}",
        "fa-recycle":"\u{f1b8}",
        "fa-reddit":"\u{f1a1}",
        "fa-reddit-square":"\u{f1a2}",
        "fa-refresh":"\u{f021}",
        "fa-remove (alias)":"\u{f00d}",
        "fa-renren":"\u{f18b}",
        "fa-reorder (alias)":"\u{f0c9}",
        "fa-repeat":"\u{f01e}",
        "fa-reply":"\u{f112}",
        "fa-reply-all":"\u{f122}",
        "fa-retweet":"\u{f079}",
        "fa-rmb (alias)":"\u{f157}",
        "fa-road":"\u{f018}",
        "fa-rocket":"\u{f135}",
        "fa-rotate-left (alias)":"\u{f0e2}",
        "fa-rotate-right (alias)":"\u{f01e}",
        "fa-rouble (alias)":"\u{f158}",
        "fa-rss":"\u{f09e}",
        "fa-rss-square":"\u{f143}",
        "fa-rub":"\u{f158}",
        "fa-ruble (alias)":"\u{f158}",
        "fa-rupee (alias)":"\u{f156}",
        "fa-save (alias)":"\u{f0c7}",
        "fa-scissors":"\u{f0c4}",
        "fa-search":"\u{f002}",
        "fa-search-minus":"\u{f010}",
        "fa-search-plus":"\u{f00e}",
        "fa-sellsy":"\u{f213}",
        "fa-send (alias)":"\u{f1d8}",
        "fa-send-o (alias)":"\u{f1d9}",
        "fa-server":"\u{f233}",
        "fa-share":"\u{f064}",
        "fa-share-alt":"\u{f1e0}",
        "fa-share-alt-square":"\u{f1e1}",
        "fa-share-square":"\u{f14d}",
        "fa-share-square-o":"\u{f045}",
        "fa-shekel (alias)":"\u{f20b}",
        "fa-sheqel (alias)":"\u{f20b}",
        "fa-shield":"\u{f132}",
        "fa-ship":"\u{f21a}",
        "fa-shirtsinbulk":"\u{f214}",
        "fa-shopping-cart":"\u{f07a}",
        "fa-sign-in":"\u{f090}",
        "fa-sign-out":"\u{f08b}",
        "fa-signal":"\u{f012}",
        "fa-simplybuilt":"\u{f215}",
        "fa-sitemap":"\u{f0e8}",
        "fa-skyatlas":"\u{f216}",
        "fa-skype":"\u{f17e}",
        "fa-slack":"\u{f198}",
        "fa-sliders":"\u{f1de}",
        "fa-slideshare":"\u{f1e7}",
        "fa-smile-o":"\u{f118}",
        "fa-soccer-ball-o (alias)":"\u{f1e3}",
        "fa-sort":"\u{f0dc}",
        "fa-sort-alpha-asc":"\u{f15d}",
        "fa-sort-alpha-desc":"\u{f15e}",
        "fa-sort-amount-asc":"\u{f160}",
        "fa-sort-amount-desc":"\u{f161}",
        "fa-sort-asc":"\u{f0de}",
        "fa-sort-desc":"\u{f0dd}",
        "fa-sort-down (alias)":"\u{f0dd}",
        "fa-sort-numeric-asc":"\u{f162}",
        "fa-sort-numeric-desc":"\u{f163}",
        "fa-sort-up (alias)":"\u{f0de}",
        "fa-soundcloud":"\u{f1be}",
        "fa-space-shuttle":"\u{f197}",
        "fa-spinner":"\u{f110}",
        "fa-spoon":"\u{f1b1}",
        "fa-spotify":"\u{f1bc}",
        "fa-square":"\u{f0c8}",
        "fa-square-o":"\u{f096}",
        "fa-stack-exchange":"\u{f18d}",
        "fa-stack-overflow":"\u{f16c}",
        "fa-star":"\u{f005}",
        "fa-star-half":"\u{f089}",
        "fa-star-half-empty (alias)":"\u{f123}",
        "fa-star-half-full (alias)":"\u{f123}",
        "fa-star-half-o":"\u{f123}",
        "fa-star-o":"\u{f006}",
        "fa-steam":"\u{f1b6}",
        "fa-steam-square":"\u{f1b7}",
        "fa-step-backward":"\u{f048}",
        "fa-step-forward":"\u{f051}",
        "fa-stethoscope":"\u{f0f1}",
        "fa-stop":"\u{f04d}",
        "fa-street-view":"\u{f21d}",
        "fa-strikethrough":"\u{f0cc}",
        "fa-stumbleupon":"\u{f1a4}",
        "fa-stumbleupon-circle":"\u{f1a3}",
        "fa-subscript":"\u{f12c}",
        "fa-subway":"\u{f239}",
        "fa-suitcase":"\u{f0f2}",
        "fa-sun-o":"\u{f185}",
        "fa-superscript":"\u{f12b}",
        "fa-support (alias)":"\u{f1cd}",
        "fa-table":"\u{f0ce}",
        "fa-tablet":"\u{f10a}",
        "fa-tachometer":"\u{f0e4}",
        "fa-tag":"\u{f02b}",
        "fa-tags":"\u{f02c}",
        "fa-tasks":"\u{f0ae}",
        "fa-taxi":"\u{f1ba}",
        "fa-tencent-weibo":"\u{f1d5}",
        "fa-terminal":"\u{f120}",
        "fa-text-height":"\u{f034}",
        "fa-text-width":"\u{f035}",
        "fa-th":"\u{f00a}",
        "fa-th-large":"\u{f009}",
        "fa-th-list":"\u{f00b}",
        "fa-thumb-tack":"\u{f08d}",
        "fa-thumbs-down":"\u{f165}",
        "fa-thumbs-o-down":"\u{f088}",
        "fa-thumbs-o-up":"\u{f087}",
        "fa-thumbs-up":"\u{f164}",
        "fa-ticket":"\u{f145}",
        "fa-times":"\u{f00d}",
        "fa-times-circle":"\u{f057}",
        "fa-times-circle-o":"\u{f05c}",
        "fa-tint":"\u{f043}",
        "fa-toggle-down (alias)":"\u{f150}",
        "fa-toggle-left (alias)":"\u{f191}",
        "fa-toggle-off":"\u{f204}",
        "fa-toggle-on":"\u{f205}",
        "fa-toggle-right (alias)":"\u{f152}",
        "fa-toggle-up (alias)":"\u{f151}",
        "fa-train":"\u{f238}",
        "fa-transgender":"\u{f224}",
        "fa-transgender-alt":"\u{f225}",
        "fa-trash":"\u{f1f8}",
        "fa-trash-o":"\u{f014}",
        "fa-tree":"\u{f1bb}",
        "fa-trello":"\u{f181}",
        "fa-trophy":"\u{f091}",
        "fa-truck":"\u{f0d1}",
        "fa-try":"\u{f195}",
        "fa-tty":"\u{f1e4}",
        "fa-tumblr":"\u{f173}",
        "fa-tumblr-square":"\u{f174}",
        "fa-turkish-lira (alias)":"\u{f195}",
        "fa-twitch":"\u{f1e8}",
        "fa-twitter":"\u{f099}",
        "fa-twitter-square":"\u{f081}",
        "fa-umbrella":"\u{f0e9}",
        "fa-underline":"\u{f0cd}",
        "fa-undo":"\u{f0e2}",
        "fa-university":"\u{f19c}",
        "fa-unlink (alias)":"\u{f127}",
        "fa-unlock":"\u{f09c}",
        "fa-unlock-alt":"\u{f13e}",
        "fa-unsorted (alias)":"\u{f0dc}",
        "fa-upload":"\u{f093}",
        "fa-usd":"\u{f155}",
        "fa-user":"\u{f007}",
        "fa-user-md":"\u{f0f0}",
        "fa-user-plus":"\u{f234}",
        "fa-user-secret":"\u{f21b}",
        "fa-user-times":"\u{f235}",
        "fa-users":"\u{f0c0}",
        "fa-venus":"\u{f221}",
        "fa-venus-double":"\u{f226}",
        "fa-venus-mars":"\u{f228}",
        "fa-viacoin":"\u{f237}",
        "fa-video-camera":"\u{f03d}",
        "fa-vimeo-square":"\u{f194}",
        "fa-vine":"\u{f1ca}",
        "fa-vk":"\u{f189}",
        "fa-volume-down":"\u{f027}",
        "fa-volume-off":"\u{f026}",
        "fa-volume-up":"\u{f028}",
        "fa-warning (alias)":"\u{f071}",
        "fa-wechat (alias)":"\u{f1d7}",
        "fa-weibo":"\u{f18a}",
        "fa-weixin":"\u{f1d7}",
        "fa-whatsapp":"\u{f232}",
        "fa-wheelchair":"\u{f193}",
        "fa-wifi":"\u{f1eb}",
        "fa-windows":"\u{f17a}",
        "fa-won (alias)":"\u{f159}",
        "fa-wordpress":"\u{f19a}",
        "fa-wrench":"\u{f0ad}",
        "fa-xing":"\u{f168}",
        "fa-xing-square":"\u{f169}",
        "fa-yahoo":"\u{f19e}",
        "fa-yelp":"\u{f1e9}",
        "fa-yen (alias)":"\u{f157}",
        "fa-youtube":"\u{f167}",
        "fa-youtube-play":"\u{f16a}"
      ]
    }
    
    return icons![name]!
  }
}
