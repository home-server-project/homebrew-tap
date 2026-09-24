class NmHsp < Formula
  desc "Friendly terminal interface for NetworkManager"
  homepage "https://github.com/home-server-project/nm-hsp"
  url "https://github.com/home-server-project/nm-hsp/releases/download/v0.3.0/nm-hsp_0.3.0_linux.tar.gz"
  version "0.3.0"
  sha256 "b6a0c1abb97f7902f32cbe1c7023772a465aa93a4b09b4f3ae13be5dc884bd92"
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
