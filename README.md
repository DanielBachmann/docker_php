# docker_php

work in progress ;-)

## Worpress - wp-config.php

define('WP_DEBUG', true);
define( 'WP_DEBUG_LOG', true );
define( 'WP_DEBUG_DISPLAY', true);

define('DB_HOST','mysql');
define('WP_SITEURL', 'http://localhost');
define('WP_HOME', 'http://localhost');

### Database encoding

define('DB_CHARSET', 'latin1');
