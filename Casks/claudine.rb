cask "claudine" do
  name "claudine"
  desc "Unlock your Claude Pro/Max subscription in any tool or library."
  homepage "https://github.com/florianilch/claudine-proxy"
  version "0.1.0"

  livecheck do
    skip "Auto-generated on release."
  end

  binary "claudine"

  on_macos do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.1.0/claudine_#{version}_darwin_amd64.tar.gz"
      sha256 "e7e1f83431f0b037a7f5b7a1ea8e5e025525375ebcce085ee70afb3ce71a58be"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.1.0/claudine_#{version}_darwin_arm64.tar.gz"
      sha256 "e87a77664f1c1ed0d6995f571e6c095e94cd26a84287d67b2e1fdec5f621f72e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.1.0/claudine_#{version}_linux_amd64.tar.gz"
      sha256 "b1d6df281dfda9537bf23b6e025b05e7d29211e5041f3a6e70a091bee8c04320"
    end
    on_arm do
      url "https://github.com/florianilch/claudine-proxy/releases/download/v0.1.0/claudine_#{version}_linux_arm64.tar.gz"
      sha256 "6233bb779bbf6e214c74e937c1e53d82dcc09478ad25c9bf616d9bee2ef46d34"
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
