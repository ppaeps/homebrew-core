require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.1.138.tgz"
  sha256 "0e2bffa6d35dbb7e036eba9f58093ef8eaee218918d02a509b92fd7525d77a9a"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "83257da64ec11d61882198bb61102c695b22879645f684f893ee7db4b83576f0"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
