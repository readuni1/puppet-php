# Configure a yum repo for RedHat-based systems
#
# === Parameters
#
# [*yum_repo*]
#   Class name of the repo under ::yum::repo
#

class php::repo::redhat (
  String[1] $yum_repo = 'remi_php56',
) {
  $releasever = $facts['os']['name'] ? {
    /(?i:Amazon)/ => '6',
    default       => '$releasever',  # Yum var
  }

  if (versioncmp($releasever,'8') < 0) {
    yumrepo { 'remi':
      descr      => 'Remi\'s RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/remi/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }

    yumrepo { 'remi-php56':
      descr      => 'Remi\'s PHP 5.6 RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "https://rpms.remirepo.net/enterprise/${releasever}/php56/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }
  } else {
    yumrepo { 'remi':
      descr      => 'Remi\'s RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "http://cdn.remirepo.net/enterprise/${releasever}/remi/$basearch/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }

    yumrepo { 'remi-php74':
      descr      => 'Remi\'s PHP 7.4 RPM repository for Enterprise Linux $releasever - $basearch',
      mirrorlist => "http://cdn.remirepo.net/enterprise/${releasever}/remi/php74/$basearch/mirror",
      enabled    => 1,
      gpgcheck   => 1,
      gpgkey     => 'https://rpms.remirepo.net/RPM-GPG-KEY-remi',
      priority   => 1,
    }

  }
}
