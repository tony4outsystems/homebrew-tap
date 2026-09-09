class OdcCli < Formula
  desc "CLI for driving OutSystems Developer Cloud (ODC) APIs"
  homepage "https://github.com/tony4outsystems/odc-cli"
  url "https://github.com/tony4outsystems/odc-cli/archive/8cdf5d2f968595366368e68a4755e6741279f030.tar.gz"
  version "0.2.0"
  sha256 "7f996380777cfaa8c02200b3f2f2ee0ac317ebb75d39a1321670e4cb360e17b9"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(output: bin/"odc"), "./cmd/odc"
  end

  test do
    assert_match "OutSystems ODC CLI", shell_output("#{bin}/odc --help")
    assert_match "--build-key is required",
                 shell_output("#{bin}/odc internal-deploy --asset test --env test 2>&1", 1)
  end
end
