class NmHsp < Formula
  desc "Friendly terminal interface for NetworkManager"
  homepage "https://github.com/home-server-project/nm-hsp"
  url "https://github.com/home-server-project/nm-hsp.git",
      tag:      "v0.2.0",
      revision: "6431fc7376021edd3278016b1374f1a98dd225ca"
  license "Apache-2.0"

  depends_on "go" => :build
  depends_on :linux

  def install
    system "go", "build", *std_go_args, "./cmd/nm-hsp"
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
