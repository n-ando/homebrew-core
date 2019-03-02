require "language/node"

class Joplin < Formula
  desc "Note taking and to-do application with synchronisation capabilities"
  homepage "https://joplin.cozic.net/"
  url "https://registry.npmjs.org/joplin/-/joplin-1.0.123.tgz"
  sha256 "5b7830a9be0b7bc5a1db33a17f7c4c21ef2fcbb7568013b8fd1663bba6d02e5a"

  bottle do
    sha256 "89d6e6d3c5cafb4684641ec30fae57038b4324d0b2bdd31ec9486b5f77cbbb3e" => :mojave
    sha256 "cfa458d0fc2ed1d8b304914cd1e1453ceb9d02e100a201bc627c3f18b5720b38" => :high_sierra
    sha256 "14d061ecac989c64beada4ce6b9d7414c7f9303f860998855a0d24d04b1617a4" => :sierra
  end

  depends_on "python@2" => :build
  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"joplin", "config", "editor", "subl"
    assert_match "editor = subl", shell_output("#{bin}/joplin config")
  end
end
