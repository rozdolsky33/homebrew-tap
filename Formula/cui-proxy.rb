class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.0/cui-proxy_0.1.0_darwin_arm64.tar.gz"
      sha256 "f495fe4d7d03ee74b78cfe436c1decd8f3e4b5c82796a6091f91799aaafc38c8"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.0/cui-proxy_0.1.0_darwin_amd64.tar.gz"
      sha256 "df2ffebff212997c61932f9d6fcd1ea8fa3b07605e7ce4d2751d82b1e053d808"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.0/cui-proxy_0.1.0_linux_arm64.tar.gz"
      sha256 "8f903ad743595f5aa418dea363d17acab16563a66f705ce649360a9364521378"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.1.0/cui-proxy_0.1.0_linux_amd64.tar.gz"
      sha256 "b6d141c1142a772e0f6833ac298194c61a0af8ea029fb69ef643b06c6732d9ea"
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

      cui-proxy reduces risk; it is not a compliance control. Read
      https://github.com/rozdolsky33/cui-proxy#readme before use.
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cui-proxy version")
    system bin/"cui-proxy", "check-config", "-config", pkgshare/"examples/config.yaml"
  end
end
