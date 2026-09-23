class NmHsp < Formula
  desc "Friendly terminal interface for NetworkManager"
  homepage "https://github.com/home-server-project/nm-hsp"
  version "0.2.0"
  license "Apache-2.0"

  on_intel do
    url "https://github.com/home-server-project/nm-hsp/releases/download/v0.2.0/nm-hsp_0.2.0_linux_amd64.tar.gz"
    sha256 "4342daba973e40a2dc113e2aa703a5e4f4bd7fd5ee1c178226066cbe915cf612"
  end

  on_arm do
    url "https://github.com/home-server-project/nm-hsp/releases/download/v0.2.0/nm-hsp_0.2.0_linux_arm64.tar.gz"
    sha256 "e2fccba380d5d3854d95fe4955fda32fb6c0ef88486798ac9026cf2cc9b3335d"
  end

  depends_on :linux

  def install
    bin.install "nm-hsp"
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
