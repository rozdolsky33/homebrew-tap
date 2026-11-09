class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.1/cui-proxy_0.5.1_darwin_arm64.tar.gz"
      sha256 "28c8798c1b2d9e037c467586aec893a0701aae7d87c4e027f5387ed77a77e938"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.1/cui-proxy_0.5.1_darwin_amd64.tar.gz"
      sha256 "458c6f81c296da350e792483edd656ab1da42c29921e15cd8f2acbed89c797aa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.1/cui-proxy_0.5.1_linux_arm64.tar.gz"
      sha256 "d030e82701b0673c1c46cf680add9a0d747f8bd39e6e7e2949e0915706c8bf29"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.5.1/cui-proxy_0.5.1_linux_amd64.tar.gz"
      sha256 "6b79c50865e04e40edb4993e806266667063291c02f04ba98e7a0de080c09f96"
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
