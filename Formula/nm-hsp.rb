class NmHsp < Formula
  desc "Friendly terminal interface for NetworkManager"
  homepage "https://github.com/home-server-project/nm-hsp"
  url "https://github.com/home-server-project/nm-hsp.git",
      tag:      "v0.1.0",
      revision: "e41f9d5c4b7abe72429ddde91af1f07c13342144"
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
