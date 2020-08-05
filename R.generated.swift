//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try font.validate()
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.segue` struct is generated, and contains static references to 1 view controllers.
  struct segue {
    /// This struct is generated for `RootViewController`, and contains static references to 1 segues.
    struct rootViewController {
      /// Segue identifier `goToSplash`.
      static let goToSplash: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, RootViewController, SplashViewController> = Rswift.StoryboardSegueIdentifier(identifier: "goToSplash")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `goToSplash`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func goToSplash(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, RootViewController, SplashViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.rootViewController.goToSplash, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 3 storyboards.
  struct storyboard {
    /// Storyboard `Home`.
    static let home = _R.storyboard.home()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Root`.
    static let root = _R.storyboard.root()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Home", bundle: ...)`
    static func home(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.home)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "Root", bundle: ...)`
    static func root(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.root)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.file` struct is generated, and contains static references to 3 files.
  struct file {
    /// Resource file `SourceSansPro-Bold.ttf`.
    static let sourceSansProBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SourceSansPro-Bold", pathExtension: "ttf")
    /// Resource file `SourceSansPro-Light.ttf`.
    static let sourceSansProLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SourceSansPro-Light", pathExtension: "ttf")
    /// Resource file `SourceSansPro-Regular.ttf`.
    static let sourceSansProRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "SourceSansPro-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "SourceSansPro-Bold", withExtension: "ttf")`
    static func sourceSansProBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sourceSansProBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SourceSansPro-Light", withExtension: "ttf")`
    static func sourceSansProLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sourceSansProLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "SourceSansPro-Regular", withExtension: "ttf")`
    static func sourceSansProRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.sourceSansProRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `SourceSansPro-Bold`.
    static let sourceSansProBold = Rswift.FontResource(fontName: "SourceSansPro-Bold")
    /// Font `SourceSansPro-Light`.
    static let sourceSansProLight = Rswift.FontResource(fontName: "SourceSansPro-Light")
    /// Font `SourceSansPro-Regular`.
    static let sourceSansProRegular = Rswift.FontResource(fontName: "SourceSansPro-Regular")

    /// `UIFont(name: "SourceSansPro-Bold", size: ...)`
    static func sourceSansProBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sourceSansProBold, size: size)
    }

    /// `UIFont(name: "SourceSansPro-Light", size: ...)`
    static func sourceSansProLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sourceSansProLight, size: size)
    }

    /// `UIFont(name: "SourceSansPro-Regular", size: ...)`
    static func sourceSansProRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: sourceSansProRegular, size: size)
    }

    static func validate() throws {
      if R.font.sourceSansProBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SourceSansPro-Bold' could not be loaded, is 'SourceSansPro-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sourceSansProLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SourceSansPro-Light' could not be loaded, is 'SourceSansPro-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.sourceSansProRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'SourceSansPro-Regular' could not be loaded, is 'SourceSansPro-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.info` struct is generated, and contains static references to 1 properties.
  struct info {
    struct uiApplicationSceneManifest {
      static let _key = "UIApplicationSceneManifest"
      static let uiApplicationSupportsMultipleScenes = false

      struct uiSceneConfigurations {
        static let _key = "UISceneConfigurations"

        struct uiWindowSceneSessionRoleApplication {
          struct defaultConfiguration {
            static let _key = "Default Configuration"
            static let uiSceneConfigurationName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneConfigurationName") ?? "Default Configuration"
            static let uiSceneDelegateClassName = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneDelegateClassName") ?? "$(PRODUCT_MODULE_NAME).SceneDelegate"
            static let uiSceneStoryboardFile = infoPlistString(path: ["UIApplicationSceneManifest", "UISceneConfigurations", "UIWindowSceneSessionRoleApplication", "Default Configuration"], key: "UISceneStoryboardFile") ?? "Root"

            fileprivate init() {}
          }

          fileprivate init() {}
        }

        fileprivate init() {}
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  /// This `R.nib` struct is generated, and contains static references to 1 nibs.
  struct nib {
    /// Nib `NoDataAvailableTableViewCell`.
    static let noDataAvailableTableViewCell = _R.nib._NoDataAvailableTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "NoDataAvailableTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.noDataAvailableTableViewCell) instead")
    static func noDataAvailableTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.noDataAvailableTableViewCell)
    }
    #endif

    static func noDataAvailableTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> NoDataAvailableTableViewCell? {
      return R.nib.noDataAvailableTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? NoDataAvailableTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 2 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `NoDataAvailableTableViewCell`.
    static let noDataAvailableTableViewCell: Rswift.ReuseIdentifier<NoDataAvailableTableViewCell> = Rswift.ReuseIdentifier(identifier: "NoDataAvailableTableViewCell")
    /// Reuse identifier `ProductTableViewCell`.
    static let productTableViewCell: Rswift.ReuseIdentifier<ProductTableViewCell> = Rswift.ReuseIdentifier(identifier: "ProductTableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 2 localization keys.
    struct localizable {
      /// en translation: Search products
      ///
      /// Locales: en, es-419
      static let searchProducts = Rswift.StringResource(key: "Search products", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: We couldn't find products in that search
      ///
      /// Locales: en, es-419
      static let weCouldnTFindProductsInThatSearch = Rswift.StringResource(key: "We couldn't find products in that search", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)

      /// en translation: Search products
      ///
      /// Locales: en, es-419
      static func searchProducts(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Search products", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Search products"
        }

        return NSLocalizedString("Search products", bundle: bundle, comment: "")
      }

      /// en translation: We couldn't find products in that search
      ///
      /// Locales: en, es-419
      static func weCouldnTFindProductsInThatSearch(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("We couldn't find products in that search", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "We couldn't find products in that search"
        }

        return NSLocalizedString("We couldn't find products in that search", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct nib {
    struct _NoDataAvailableTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = NoDataAvailableTableViewCell

      let bundle = R.hostingBundle
      let identifier = "NoDataAvailableTableViewCell"
      let name = "NoDataAvailableTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> NoDataAvailableTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? NoDataAvailableTableViewCell
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }
  #endif

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try home.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
      #if os(iOS) || os(tvOS)
      try root.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct home: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Home"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct root: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UINavigationController

      let bundle = R.hostingBundle
      let name = "Root"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
