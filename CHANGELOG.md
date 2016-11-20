Change Log
==========

All notable changes to this project will be documented in this file.

[latest] - 2016-11-06
---------------------

Same as v5.0

[v5.0][2016-11-06]
------------------

### Fixed

-	Using alpine nodeJS instead of kibana's bundled version  

### Added

-	Nginx entry-point to pass USER/PASS in as env vars
-	SSL (auto-create certs if not found)
-	tini/gosu to all the things  
-	geoip/user-agent plugin
-	way to add nginx demo data with [blacktop/es-data](https://github.com/blacktop/docker-es-demo-data)

### Removed

### Changed

-	renamed docker-elk to docker-elastic-stack

[v4.6][2016-11-06]
------------------

### Fixed

### Added

-	Nginx entry-point to pass USER/PASS in as env vars
-	SSL (auto-create certs if not found)

### Removed

### Changed

[v3.1][2016-11-06]
------------------

This hasn't been tested and might not work with ES 2.4 as I have it now.

### Fixed

### Added

### Removed

### Changed
