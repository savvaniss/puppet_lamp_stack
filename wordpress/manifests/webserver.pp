class wordpress::webserver {

    # Install Apache
    class {'apache': 
        mpm_module => 'prefork'

    }

	apache::vhost { "${wordpress::config::servername}" :
	  port          => '80',
	  docroot       => "/var/www/html/${wordpress::config::servername}",
	  docroot_owner => 'www-data',
	  docroot_group => 'www-data',
} 
    # Add support for PHP 
    class {'::apache::mod::php': 
}

}