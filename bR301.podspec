Pod::Spec.new do |s|

  s.name         = "bR301"
  s.version      = "1.3.5"
  s.summary      = "Feitian mobile smartcard reader iOS SDK"

  s.description  = <<-DESC
                   This is a fork of Feitians [sdk](https://github.com/FeitianSmartcardReader/bR301_iOS) which can be included in cocoapods projects.
                   DESC

  s.homepage     = "https://github.com/chgandm/bR301_iOS"
  s.license      = "GPL 2.1"
  s.author    = "Marco Tresch"

  s.platform     = :ios


  s.source       = { :git => "https://github.com/chgandm/bR301_iOS", :branch => "master" }

  s.source_files  = "libs/SDK/include/*h", "libs/source/src/**/*"
  s.exclude_files = "Classes/Exclude"

  s.public_header_files = "libs/SDK/include/*h"


  # ――― Resources ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  A list of resources included with the Pod. These are copied into the
  #  target bundle with a build phase script. Anything else will be cleaned.
  #  You can preserve files from being cleaned, please don't preserve
  #  non-essential files like tests, examples and documentation.
  #

  s.preserve_paths = "libs/source/src/libFTSessionController.a"


  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  Link your library with frameworks, or libraries. Libraries do not include
  #  the lib prefix of their name.
  #

  # s.framework  = "SomeFramework"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  s.library   = "FTSessionController"
  # s.libraries = "iconv", "xml2"
  # s.ios.vendored_library = "libs/source/bin/*.a"


  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  If your library depends on compiler flags you can set them in the xcconfig hash
  #  where they will only apply to your library. If you depend on other Podspecs
  #  you can include multiple dependencies to ensure it works.

  # s.requires_arc = true
  s.xcconfig = { "LIBRARY_SEARCH_PATHS" => "$(PODS_ROOT)/bR301/libs/source/src" }
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # s.dependency "JSONKit", "~> 1.4"

end
