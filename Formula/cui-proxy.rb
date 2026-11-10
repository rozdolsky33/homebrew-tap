class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.6.0/cui-proxy_0.6.0_darwin_arm64.tar.gz"
      sha256 "16c5bf694d31bb5b17ebe55567d83747c89e597bb0130309659f11a2279ffae8"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.6.0/cui-proxy_0.6.0_darwin_amd64.tar.gz"
      sha256 "71749911c11176ef67b04a9e69878b62e9d2705cb51f0b84e4fea726d65c3073"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.6.0/cui-proxy_0.6.0_linux_arm64.tar.gz"
      sha256 "39ef6a0be414b787375bb6372c8a5df39f0889b29a0b2fe626bc414deebf773a"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.6.0/cui-proxy_0.6.0_linux_amd64.tar.gz"
      sha256 "175c879d3b440c16cfb5c996bcf62539a82beff82758be72244030511475ca0b"
    end
  end

  def install
    bin.install "cui-proxy"
    pkgshare.install "examples"
  end

  def caveats
    <<~EOS
      Create a starter config and dictionary, then start the proxy:
        cui-proxy init
        cui-proxy serve -config ~/.config/cui-proxy/config.yaml

      On macOS, to run it in the background with a menu-bar icon:
        cui-proxy menubar install

      cui-proxy reduces risk; it is not a compliance control. Read
      https://github.com/rozdolsky33/cui-proxy#readme before use.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cui-proxy version")
    system bin/"cui-proxy", "check-config", "-config", pkgshare/"examples/config.yaml"
  end
end
