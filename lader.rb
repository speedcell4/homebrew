class Lader < Formula
  desc "A reordering tool for machine translation"
  homepage "http://www.phontron.com/lader/"
  url "http://www.phontron.com/lader/download/lader-0.1.6.tar.gz"
  sha256 "9605ed69530b234345caafe2d94d94627c55d8315c4684e3a5e9713b289abac1"

  head do
    url "https://github.com/neubig/lader.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end

  def install
    system "autoreconf", "-i" if build.head?
    system "./configure", "--disable-dependency-tracking",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  # test do
  #   system "#{bin}/kytea", "--version"
  # end
end
