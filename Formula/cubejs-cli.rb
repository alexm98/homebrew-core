require "language/node"

class CubejsCli < Formula
  desc "Cube.js command-line interface"
  homepage "https://cube.dev/"
  url "https://registry.npmjs.org/cubejs-cli/-/cubejs-cli-0.30.72.tgz"
  sha256 "08aab91d46b3b902fbfab20be15f0b16cabe777d1a0385d0d1bc2efb76389190"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_monterey: "c25ee2aa23a8efe1eebe39968bc386a37346b22cae1c7ccc1d0ad2ced6e1e75f"
    sha256 cellar: :any_skip_relocation, arm64_big_sur:  "c25ee2aa23a8efe1eebe39968bc386a37346b22cae1c7ccc1d0ad2ced6e1e75f"
    sha256 cellar: :any_skip_relocation, monterey:       "c4d4532a0982f7910ff6eb9c439ef768c25c31a0625d4ebb00cea23c5b5f3835"
    sha256 cellar: :any_skip_relocation, big_sur:        "c4d4532a0982f7910ff6eb9c439ef768c25c31a0625d4ebb00cea23c5b5f3835"
    sha256 cellar: :any_skip_relocation, catalina:       "c4d4532a0982f7910ff6eb9c439ef768c25c31a0625d4ebb00cea23c5b5f3835"
    sha256 cellar: :any_skip_relocation, x86_64_linux:   "c25ee2aa23a8efe1eebe39968bc386a37346b22cae1c7ccc1d0ad2ced6e1e75f"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/cubejs --version")
    system "cubejs", "create", "hello-world", "-d", "postgres"
    assert_predicate testpath/"hello-world/schema/Orders.js", :exist?
  end
end
