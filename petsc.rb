require 'formula'

class Petsc < Formula
  homepage 'http://www.mcs.anl.gov/petsc/index.html'
  url 'http://ftp.mcs.anl.gov/pub/petsc/release-snapshots/petsc-3.4.2.tar.gz'
  sha1 '9ba201c73ca85e01da37176b7bbf80a75756c515'

  depends_on :mpi => :cc
  depends_on :fortran

  def install
    ENV.deparallelize
    system "./configure", "--with-debugging=0", "--with-shared-libraries=1", "--with-fortran=0", "--prefix=#{prefix} "--LDFLAGS='/usr/X11'"
    system "make all"
    system "make test"
    system "make install"
  end
end
