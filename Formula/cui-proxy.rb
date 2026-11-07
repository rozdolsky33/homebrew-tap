class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.1/cui-proxy_0.3.1_darwin_arm64.tar.gz"
      sha256 "301920b5add0f067fa12abfdd16a0181795862936a827e127232c8cb6cd11de1"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.1/cui-proxy_0.3.1_darwin_amd64.tar.gz"
      sha256 "d802a7d6150c43159a6de08a3106fc2f8169ce25f6c5703f7ae47f747ec9ce43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.1/cui-proxy_0.3.1_linux_arm64.tar.gz"
      sha256 "0c0062d92e8543a806075ca056990f2b573b2c465f4a7c66a15006ab1ddee6fc"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.1/cui-proxy_0.3.1_linux_amd64.tar.gz"
      sha256 "44f684cdfff3d0d169723c34e41c6bbef8b8f79cdea8a0ada6228eb535383f5b"
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
