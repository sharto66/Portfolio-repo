package ip_location

import com.maxmind.geoip.Location
import org.grails.plugin.geoip.GeoIpService


class CountryController extends GeoIpService{
	
	GeoIpService geoIpService

    def index()
	{ 
		String myIP = request.remoteAddr
		String IE = "95.45.15.190"
		String RU = "2.95.255.255"
		String US = "3.255.255.255"
		String CN = "1.2.63.255"
		Location location = geoIpService.getLocation(RU)
		String country = location.countryName
		def list = [country, myIP]
		[list:list]
	}
}
