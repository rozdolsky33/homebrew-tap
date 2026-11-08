class CuiProxy < Formula
  desc "Fail-closed local proxy that masks sensitive data in Codex CLI traffic"
  homepage "https://github.com/rozdolsky33/cui-proxy"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.2/cui-proxy_0.3.2_darwin_arm64.tar.gz"
      sha256 "17893a6e16c1c4a4dd52581e9a23af4296d58f44a77dd1df17ea3ba1940ddc0a"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.2/cui-proxy_0.3.2_darwin_amd64.tar.gz"
      sha256 "e188b23e51b64b306df65c8252180d052296e2ddf57b81a5e975f90dcada6352"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.2/cui-proxy_0.3.2_linux_arm64.tar.gz"
      sha256 "e075bb188c2e26e43f967cba144ac973062590451fc27ea43e68e244cfb8e4de"
    end
    on_intel do
      url "https://github.com/rozdolsky33/cui-proxy/releases/download/v0.3.2/cui-proxy_0.3.2_linux_amd64.tar.gz"
      sha256 "e461901ae3c5fb43aa432729049b4b4a8dd79669627627d98c55245f50a4a29f"
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
