cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.4.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.4.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "9801a878ac212ba25fdf2d435dc890091c3230e226921c516ea30b8c932ab2a7"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.4.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "40e5e6405ac88b5345f1752be0877afce9bd71e936595aaa3c5972a9df1c0beb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.4.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "b0307c581936324392757eb08a85f9eb59cbdd94908fe242392060fdc61466d1"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.4.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "2d361796e2d31ab8ff820cbd8f909990a8f94d3295025543687e603103edc3eb"
    end
  end

  postflight do
    if OS.mac?
      system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{staged_path}/claudine"]
    end
  end

  uninstall trash: [
      "~/.config/claudine-proxy/auth",
      "~/Library/ApplicationSupport/claudine-proxy/auth",
    ]

  zap trash: [
      "~/.config/claudine-proxy",
      "~/Library/ApplicationSupport/claudine-proxy",
    ]
end
