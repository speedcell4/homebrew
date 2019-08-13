class Irstlm < Formula
  desc "A tool for the estimation, representation, and computation of statistical language models"
  homepage "http://hlt-mt.fbk.eu/technologies/irstlm"
  head "https://github.com/irstlm-team/irstlm.git"
  url "https://github.com/irstlm-team/irstlm/archive/adaptiveLM.v0.10.tar.gz"
  sha256 "ab83603feb9d697f60a93e96d65d5910a9ad80edcc6d92728020de068cdffe23"

  depends_on 'autoconf' => :build
  depends_on 'automake' => :build
  depends_on 'libtool' => :build
  depends_on 'mawk' => :build
  depends_on 'gawk' => :build

  def install
    ENV["CXX"] = Formula["gcc"].opt_bin/"g++-9"
    ENV["CXXFLAGS"] = "-static-libstdc++"

    system "sh", "regenerate-makefiles.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end
end
