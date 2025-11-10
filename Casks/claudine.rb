cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.3.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.3.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "00d3e1374a4148070e4e32168b3b024362fe1a66bbc543ccba1aef48eba03bf8"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.3.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "3f89de62077149732c483c3fa49e7ad79cb53ec6c79dfb89393a0b45fa99b344"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.3.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "89da3f8e3b675f07b7c382d20c91dbf888e7223d7f165c60719b96d7fec9aaa3"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.3.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "76e18978ffdf05b9904e22aa6dbeb164af14ddfb02ca8e853961d79e51d79457"
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
