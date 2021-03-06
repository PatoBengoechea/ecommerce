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
  /// This `R.segue` struct is generated, and contains static references to 2 view controllers.
  struct segue {
    /// This struct is generated for `HomeViewController`, and contains static references to 1 segues.
    struct homeViewController {
      /// Segue identifier `goToProduct`.
      static let goToProduct: Rswift.StoryboardSegueIdentifier<UIKit.UIStoryboardSegue, HomeViewController, ProductViewController> = Rswift.StoryboardSegueIdentifier(identifier: "goToProduct")

      #if os(iOS) || os(tvOS)
      /// Optionally returns a typed version of segue `goToProduct`.
      /// Returns nil if either the segue identifier, the source, destination, or segue types don't match.
      /// For use inside `prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)`.
      static func goToProduct(segue: UIKit.UIStoryboardSegue) -> Rswift.TypedStoryboardSegueInfo<UIKit.UIStoryboardSegue, HomeViewController, ProductViewController>? {
        return Rswift.TypedStoryboardSegueInfo(segueIdentifier: R.segue.homeViewController.goToProduct, segue: segue)
      }
      #endif

      fileprivate init() {}
    }

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
  /// This `R.storyboard` struct is generated, and contains static references to 4 storyboards.
  struct storyboard {
    /// Storyboard `Home`.
    static let home = _R.storyboard.home()
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()
    /// Storyboard `Product`.
    static let product = _R.storyboard.product()
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
    /// `UIStoryboard(name: "Product", bundle: ...)`
    static func product(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.product)
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
    /// Resource file `Lato-Bold.ttf`.
    static let latoBoldTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Bold", pathExtension: "ttf")
    /// Resource file `Lato-Light.ttf`.
    static let latoLightTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Light", pathExtension: "ttf")
    /// Resource file `Lato-Regular.ttf`.
    static let latoRegularTtf = Rswift.FileResource(bundle: R.hostingBundle, name: "Lato-Regular", pathExtension: "ttf")

    /// `bundle.url(forResource: "Lato-Bold", withExtension: "ttf")`
    static func latoBoldTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoBoldTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-Light", withExtension: "ttf")`
    static func latoLightTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoLightTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    /// `bundle.url(forResource: "Lato-Regular", withExtension: "ttf")`
    static func latoRegularTtf(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.latoRegularTtf
      return fileResource.bundle.url(forResource: fileResource)
    }

    fileprivate init() {}
  }

  /// This `R.font` struct is generated, and contains static references to 3 fonts.
  struct font: Rswift.Validatable {
    /// Font `Lato-Bold`.
    static let latoBold = Rswift.FontResource(fontName: "Lato-Bold")
    /// Font `Lato-Light`.
    static let latoLight = Rswift.FontResource(fontName: "Lato-Light")
    /// Font `Lato-Regular`.
    static let latoRegular = Rswift.FontResource(fontName: "Lato-Regular")

    /// `UIFont(name: "Lato-Bold", size: ...)`
    static func latoBold(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoBold, size: size)
    }

    /// `UIFont(name: "Lato-Light", size: ...)`
    static func latoLight(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoLight, size: size)
    }

    /// `UIFont(name: "Lato-Regular", size: ...)`
    static func latoRegular(size: CGFloat) -> UIKit.UIFont? {
      return UIKit.UIFont(resource: latoRegular, size: size)
    }

    static func validate() throws {
      if R.font.latoBold(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Bold' could not be loaded, is 'Lato-Bold.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoLight(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Light' could not be loaded, is 'Lato-Light.ttf' added to the UIAppFonts array in this targets Info.plist?") }
      if R.font.latoRegular(size: 42) == nil { throw Rswift.ValidationError(description:"[R.swift] Font 'Lato-Regular' could not be loaded, is 'Lato-Regular.ttf' added to the UIAppFonts array in this targets Info.plist?") }
    }

    fileprivate init() {}
  }

  /// This `R.image` struct is generated, and contains static references to 2 images.
  struct image {
    /// Image `debit-card`.
    static let debitCard = Rswift.ImageResource(bundle: R.hostingBundle, name: "debit-card")
    /// Image `shop`.
    static let shop = Rswift.ImageResource(bundle: R.hostingBundle, name: "shop")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "debit-card", bundle: ..., traitCollection: ...)`
    static func debitCard(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.debitCard, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "shop", bundle: ..., traitCollection: ...)`
    static func shop(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.shop, compatibleWith: traitCollection)
    }
    #endif

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

  /// This `R.nib` struct is generated, and contains static references to 3 nibs.
  struct nib {
    /// Nib `AlertViewController`.
    static let alertViewController = _R.nib._AlertViewController()
    /// Nib `LoaderTableViewCell`.
    static let loaderTableViewCell = _R.nib._LoaderTableViewCell()
    /// Nib `NoDataAvailableTableViewCell`.
    static let noDataAvailableTableViewCell = _R.nib._NoDataAvailableTableViewCell()

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "AlertViewController", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.alertViewController) instead")
    static func alertViewController(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.alertViewController)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "LoaderTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.loaderTableViewCell) instead")
    static func loaderTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.loaderTableViewCell)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UINib(name: "NoDataAvailableTableViewCell", in: bundle)`
    @available(*, deprecated, message: "Use UINib(resource: R.nib.noDataAvailableTableViewCell) instead")
    static func noDataAvailableTableViewCell(_: Void = ()) -> UIKit.UINib {
      return UIKit.UINib(resource: R.nib.noDataAvailableTableViewCell)
    }
    #endif

    static func alertViewController(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIControl? {
      return R.nib.alertViewController.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIControl
    }

    static func loaderTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LoaderTableViewCell? {
      return R.nib.loaderTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoaderTableViewCell
    }

    static func noDataAvailableTableViewCell(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> NoDataAvailableTableViewCell? {
      return R.nib.noDataAvailableTableViewCell.instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? NoDataAvailableTableViewCell
    }

    fileprivate init() {}
  }

  /// This `R.reuseIdentifier` struct is generated, and contains static references to 9 reuse identifiers.
  struct reuseIdentifier {
    /// Reuse identifier `AttributeTableViewCell`.
    static let attributeTableViewCell: Rswift.ReuseIdentifier<AttributeTableViewCell> = Rswift.ReuseIdentifier(identifier: "AttributeTableViewCell")
    /// Reuse identifier `BuyTableViewCell`.
    static let buyTableViewCell: Rswift.ReuseIdentifier<BuyTableViewCell> = Rswift.ReuseIdentifier(identifier: "BuyTableViewCell")
    /// Reuse identifier `ImageTableViewCell`.
    static let imageTableViewCell: Rswift.ReuseIdentifier<ImageTableViewCell> = Rswift.ReuseIdentifier(identifier: "ImageTableViewCell")
    /// Reuse identifier `LoaderTableViewCell`.
    static let loaderTableViewCell: Rswift.ReuseIdentifier<LoaderTableViewCell> = Rswift.ReuseIdentifier(identifier: "LoaderTableViewCell")
    /// Reuse identifier `NoDataAvailableTableViewCell`.
    static let noDataAvailableTableViewCell: Rswift.ReuseIdentifier<NoDataAvailableTableViewCell> = Rswift.ReuseIdentifier(identifier: "NoDataAvailableTableViewCell")
    /// Reuse identifier `PriceTableViewCell`.
    static let priceTableViewCell: Rswift.ReuseIdentifier<PriceTableViewCell> = Rswift.ReuseIdentifier(identifier: "PriceTableViewCell")
    /// Reuse identifier `ProductTableViewCell`.
    static let productTableViewCell: Rswift.ReuseIdentifier<ProductTableViewCell> = Rswift.ReuseIdentifier(identifier: "ProductTableViewCell")
    /// Reuse identifier `TextTableViewCell`.
    static let textTableViewCell: Rswift.ReuseIdentifier<TextTableViewCell> = Rswift.ReuseIdentifier(identifier: "TextTableViewCell")
    /// Reuse identifier `TitleTableViewCell`.
    static let titleTableViewCell: Rswift.ReuseIdentifier<TitleTableViewCell> = Rswift.ReuseIdentifier(identifier: "TitleTableViewCell")

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 1 localization tables.
  struct string {
    /// This `R.string.localizable` struct is generated, and contains static references to 15 localization keys.
    struct localizable {
      /// en translation: Attributes
      ///
      /// Locales: en, es-419
      static let attributes = Rswift.StringResource(key: "Attributes", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Buy
      ///
      /// Locales: en, es-419
      static let buy = Rswift.StringResource(key: "Buy", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Ok
      ///
      /// Locales: en, es-419
      static let ok = Rswift.StringResource(key: "Ok", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Please, search the products you want to buy
      ///
      /// Locales: en, es-419
      static let pleaseSearchTheProductsYouWantToBuy = Rswift.StringResource(key: "Please, search the products you want to buy", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Price:
      ///
      /// Locales: en, es-419
      static let price = Rswift.StringResource(key: "Price:", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Retry
      ///
      /// Locales: en, es-419
      static let retry = Rswift.StringResource(key: "Retry", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Search products
      ///
      /// Locales: en, es-419
      static let searchProducts = Rswift.StringResource(key: "Search products", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Seller
      ///
      /// Locales: en, es-419
      static let seller = Rswift.StringResource(key: "Seller", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Thank you
      ///
      /// Locales: en, es-419
      static let thankYou = Rswift.StringResource(key: "Thank you", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: The price is not available
      ///
      /// Locales: en, es-419
      static let thePriceIsNotAvailable = Rswift.StringResource(key: "The price is not available", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: The seller information is not available
      ///
      /// Locales: en, es-419
      static let theSellerInformationIsNotAvailable = Rswift.StringResource(key: "The seller information is not available", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: There was an unexpected error, please try again
      ///
      /// Locales: en, es-419
      static let thereWasAnErrorPleaseTryAgain = Rswift.StringResource(key: "There was an error, please try again", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: Ups
      ///
      /// Locales: en, es-419
      static let ups = Rswift.StringResource(key: "Ups!", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: We couldn't find products in that search
      ///
      /// Locales: en, es-419
      static let weCouldnTFindProductsInThatSearch = Rswift.StringResource(key: "We couldn't find products in that search", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)
      /// en translation: You bought
      ///
      /// Locales: en, es-419
      static let youBought = Rswift.StringResource(key: "You bought", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en", "es-419"], comment: nil)

      /// en translation: Attributes
      ///
      /// Locales: en, es-419
      static func attributes(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Attributes", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Attributes"
        }

        return NSLocalizedString("Attributes", bundle: bundle, comment: "")
      }

      /// en translation: Buy
      ///
      /// Locales: en, es-419
      static func buy(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Buy", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Buy"
        }

        return NSLocalizedString("Buy", bundle: bundle, comment: "")
      }

      /// en translation: Ok
      ///
      /// Locales: en, es-419
      static func ok(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Ok", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Ok"
        }

        return NSLocalizedString("Ok", bundle: bundle, comment: "")
      }

      /// en translation: Please, search the products you want to buy
      ///
      /// Locales: en, es-419
      static func pleaseSearchTheProductsYouWantToBuy(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Please, search the products you want to buy", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Please, search the products you want to buy"
        }

        return NSLocalizedString("Please, search the products you want to buy", bundle: bundle, comment: "")
      }

      /// en translation: Price:
      ///
      /// Locales: en, es-419
      static func price(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Price:", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Price:"
        }

        return NSLocalizedString("Price:", bundle: bundle, comment: "")
      }

      /// en translation: Retry
      ///
      /// Locales: en, es-419
      static func retry(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Retry", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Retry"
        }

        return NSLocalizedString("Retry", bundle: bundle, comment: "")
      }

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

      /// en translation: Seller
      ///
      /// Locales: en, es-419
      static func seller(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Seller", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Seller"
        }

        return NSLocalizedString("Seller", bundle: bundle, comment: "")
      }

      /// en translation: Thank you
      ///
      /// Locales: en, es-419
      static func thankYou(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Thank you", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Thank you"
        }

        return NSLocalizedString("Thank you", bundle: bundle, comment: "")
      }

      /// en translation: The price is not available
      ///
      /// Locales: en, es-419
      static func thePriceIsNotAvailable(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("The price is not available", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "The price is not available"
        }

        return NSLocalizedString("The price is not available", bundle: bundle, comment: "")
      }

      /// en translation: The seller information is not available
      ///
      /// Locales: en, es-419
      static func theSellerInformationIsNotAvailable(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("The seller information is not available", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "The seller information is not available"
        }

        return NSLocalizedString("The seller information is not available", bundle: bundle, comment: "")
      }

      /// en translation: There was an unexpected error, please try again
      ///
      /// Locales: en, es-419
      static func thereWasAnErrorPleaseTryAgain(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("There was an error, please try again", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "There was an error, please try again"
        }

        return NSLocalizedString("There was an error, please try again", bundle: bundle, comment: "")
      }

      /// en translation: Ups
      ///
      /// Locales: en, es-419
      static func ups(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("Ups!", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "Ups!"
        }

        return NSLocalizedString("Ups!", bundle: bundle, comment: "")
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

      /// en translation: You bought
      ///
      /// Locales: en, es-419
      static func youBought(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("You bought", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
          return "You bought"
        }

        return NSLocalizedString("You bought", bundle: bundle, comment: "")
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
    struct _AlertViewController: Rswift.NibResourceType {
      let bundle = R.hostingBundle
      let name = "AlertViewController"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> UIControl? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? UIControl
      }

      fileprivate init() {}
    }

    struct _LoaderTableViewCell: Rswift.NibResourceType, Rswift.ReuseIdentifierType {
      typealias ReusableType = LoaderTableViewCell

      let bundle = R.hostingBundle
      let identifier = "LoaderTableViewCell"
      let name = "LoaderTableViewCell"

      func firstView(owner ownerOrNil: AnyObject?, options optionsOrNil: [UINib.OptionsKey : Any]? = nil) -> LoaderTableViewCell? {
        return instantiate(withOwner: ownerOrNil, options: optionsOrNil)[0] as? LoaderTableViewCell
      }

      fileprivate init() {}
    }

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
      try product.validate()
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
        if UIKit.UIImage(named: "debit-card", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'debit-card' is used in storyboard 'Home', but couldn't be loaded.") }
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
        if UIKit.UIImage(named: "shop", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'shop' is used in storyboard 'LaunchScreen', but couldn't be loaded.") }
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    #if os(iOS) || os(tvOS)
    struct product: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = ProductViewController

      let bundle = R.hostingBundle
      let name = "Product"

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
        if UIKit.UIImage(named: "shop", in: R.hostingBundle, compatibleWith: nil) == nil { throw Rswift.ValidationError(description: "[R.swift] Image named 'shop' is used in storyboard 'Root', but couldn't be loaded.") }
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
