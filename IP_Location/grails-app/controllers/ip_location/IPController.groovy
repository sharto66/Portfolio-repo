package ip_location

class IPController {

    def index()
	{
		String result = request.remoteAddr
		[result:result]
	}
}
