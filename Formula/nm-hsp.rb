class NmHsp < Formula
  desc "Friendly terminal interface for NetworkManager"
  homepage "https://github.com/home-server-project/nm-hsp"
  url "https://raw.githubusercontent.com/home-server-project/homebrew-tap/testing-binaries/nm-hsp_testing-680cb1a_linux.tar.gz"
  version "0.0.0.20260923212743"
  sha256 "f981385086e2fb092014ec1448518a67e967dd148f225a440544358f278608f2"
  license "Apache-2.0"

  depends_on :linux

  def install
    if Hardware::CPU.arm?
      bin.install "arm64/nm-hsp" => "nm-hsp"
    else
      bin.install "amd64/nm-hsp" => "nm-hsp"
    end
  end

  def caveats
    <<~EOS
      nm-hsp configures NetworkManager directly through the system D-Bus API.
      NetworkManager must be installed and running on the Linux host.
    EOS
  end

  test do
    assert_match "usage: nm-hsp [--snapshot]",
                 shell_output("#{bin}/nm-hsp --invalid-option 2>&1", 1)
  end
end
