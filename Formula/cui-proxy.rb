class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.0/cui-proxy_0.3.0_darwin_arm64.tar.gz"
      sha256 "ea98bb5c85577934cd30abecc9050635716169df103174a3cf93edf17240fe7d"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.0/cui-proxy_0.3.0_darwin_amd64.tar.gz"
      sha256 "7812d87f9f75c15d2c848f6a2f653759b4cc028876a1ffceaf0df2b0d5431b2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.0/cui-proxy_0.3.0_linux_arm64.tar.gz"
      sha256 "40e52ef8a592e8f08fb237e15161750c5e8e2da437b8e9c5621a97c34b4a60d4"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.0/cui-proxy_0.3.0_linux_amd64.tar.gz"
      sha256 "a16fdfdd606b3fc6da451f2aed338e4bc323c629ba30885f02fe647c45f61850"
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
