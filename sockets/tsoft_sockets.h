//---------------------------------------------------------------------------
#ifndef tsoft_sockets_h
#define tsoft_sockets_h
//---------------------------------------------------------------------------
#include "./../tsoft_main.h"
#include "./../text/tsoft_cstr_utils.h"
//---------------------------------------------------------------------------
#ifndef MAX_REQUEST
#define MAX_REQUEST 8*1024*1024
#endif
//---------------------------------------------------------------------------
namespace ts { namespace socket {
//---------------------------------------------------------------------------
extern SOCKET  __stdcall create_server_socket(const char *a_ipv4_port_s, const int32_t a_timeout_s);
extern SOCKET  __stdcall create_server_socket(const char *a_ipv4_addr_s, const char *a_ipv4_port_s, const int32_t a_timeout_s);
extern SOCKET  __stdcall create_client_socket(const char *a_ipv4_addr_s, const char *a_ipv4_port_s, const int32_t a_timeout_s);
extern int32_t __stdcall close_socket(SOCKET a_main_socket);

extern int32_t __stdcall recv_for_sure(SOCKET a_main_socket,char *a_recv_lp, const int32_t alen,const  int32_t ax);
extern int32_t __stdcall send_for_sure(SOCKET a_main_socket,const char *a_send_lp, const int32_t alen,const  int32_t ax);
extern int32_t __stdcall start_tftp_server(const char* a_path, const char *a_ipv4_addr_s, const char *a_ipv4_port_s);
extern int32_t __stdcall start_http_server(const char* a_path, const char *a_ipv4_addr_s, const char *a_ipv4_port_s);

extern int32_t __stdcall get_file_size(const char* a_filename);
extern const char   *__stdcall get_file_size_ansi(const char* a_filename);
extern int32_t __stdcall get_file_content(const char* a_filename, char *a_file_content, const int32_t a_max_size);
extern void	__stdcall print_socket_error();

class SOCKET_BUFFER_CLASS {
public:

		int send_done_count;
		int send_count;
		const int send_size;
		char *send_lp;

		int recv_done_count;
		int recv_count;
		const int recv_size;
		char *recv_lp;

		__stdcall  SOCKET_BUFFER_CLASS(void)
         :  send_done_count(0), send_count(0), send_size(16*65536),
            recv_done_count(SOCKET_ERROR), recv_count(0), recv_size(10*65536)
         {
				recv_lp = new char[recv_size];
				send_lp = new char[send_size];
		}
		virtual __stdcall ~SOCKET_BUFFER_CLASS(void) {
				delete recv_lp;
				delete send_lp;
		}
};

class http_request_content {
public:
		char *command;
		char *file_name;
		char *host;

		__stdcall  http_request_content()
		{
		        command = new char[8];
		        file_name = new char[MAX_PATH];
		        host = new char[MAX_PATH];
		}
		virtual __stdcall ~http_request_content()
		{
		        delete command;
		        delete file_name;
		        delete host;
		}
};

class http_answer {
public:
		uint32_t access_control_allow_orgin_is;
//Specifying which web sites can participate in cross-origin resource sharing
		const char *__stdcall access_control_allow_orgin() {
				static const char h[] = "Access-Control-Allow-Origin: ";
				return (char*)"";
		}

		uint32_t accept_ranges_is;
//	What partial content range types this server supports
		const char *__stdcall accept_ranges() {
				static const char h[] = "Accept-Ranges: ";
				return ts::cstr::itoa(0);
		}

//	The age the object has been in a proxy cache in seconds
		const char *__stdcall age() {
				static const char h[] = "Age: ";
				return ts::cstr::itoa(0);
		}

		uint32_t allow_is;
//Valid actions for a specified resource. To be used for a 405 Method not allowed
		const char *__stdcall allow() {
				static const char h[] = "Allow: ";
				return "GET, HEAD";
		}
		uint32_t cache_control_is;
//Tells all caching mechanisms from server to client whether they may cache this object. It is measured in seconds
		const char *__stdcall cache_control() {
				static const char h[] = "Cache-Control: ";
				return "max-age=3600";
		}

		uint32_t connection_is;
//options that are desired for the connection[21]
		const char *__stdcall connection() {
				static const char h[] = "Connection: ";
				return "close";
		}

		uint32_t content_encoding_is;
//The type of encoding used on the data. See HTTP compression.
		const char *__stdcall content_encoding() {
				static const char h[] = "Content-Encoding: ";
				return "gzip";
		}

		uint32_t content_language_is;
//The language the content is in
		const char *__stdcall content_language() {
				static const char h[] = "Content-Language: ";
				return "da";
		}

		uint32_t content_LEN_is;
//The length of the response body in octets (8-bit bytes)
		const char *__stdcall content_len() {
				static const char h[] = "Content-Length: ";
				return "348";
		}

		uint32_t content_location_is;
//An alternate location for the returned data
		const char *__stdcall content_location() {
				static const char h[] = "Content-Location: ";
				return "/index.htm";
		}

		uint32_t content_md5_is;
//A Base64-encoded binary MD5 sum of the content of the response
		const char *__stdcall content_md5() {
				static const char h[] = "Content-MD5: ";
				return "Q2hlY2sgSW50ZWdyaXR5IQ==";
		}

		uint32_t content_disposition_is;
//An opportunity to raise a "File Download" dialogue box for a known MIME type with binary format or suggest a filename for dynamic content. Quotes are necessary with special characters.
		const char *__stdcall content_disposition() {
				static const char h[] = "Content-Disposition: ";
				return "attachment; filename=\"fname.ext\"";
		}

		uint32_t content_range_is;
//Where in a full body message this partial message belongs
		const char *__stdcall content_range() {
				static const char h[] = "Content-Range: ";
				return "bytes 21010-47021/47022";
		}

		uint32_t content_type_is;
//The MIME type of this content
		const char *__stdcall content_type() {
				static const char h[] = "Content-Type: ";
				return "text/html; charset=utf-8";
		}

		uint32_t date_is;
//The date and time that the message was sent
		const char *__stdcall date() {
				static const char h[] = "Date: ";
				return "Tue, 15 Nov 1994 08:12:31 GMT";
		}

		uint32_t etag_is;
//An identifier for a specific version of a resource, often a message digest
		const char *__stdcall etag() {
				static const char h[] = "ETag: ";
				return "\"737060cd8c284d8af7ad3082f209582d\"";
		}

		uint32_t expires_is;
//Gives the date/time after which the response is considered stale
		const char *__stdcall expires() {
				static const char h[] = "Expires: ";
				return "Thu, 01 Dec 1994 16:00:00 GMT";
		}

		uint32_t last_modified_is;
//The last modified date for the requested object, in RFC 2822 format
		const char *__stdcall lats_modified() {
				static const char h[] = "Last-Modified: ";
				return "Tue, 15 Nov 1994 12:45:26 GMT";
		}

		uint32_t Link_is;
//Used to express a typed relationship with another resource, where the relation type is defined by RFC 5988
		const char *__stdcall link() {
				static const char h[] = "Link: ";
				return "</feed>; rel=\"alternate\"";
		}

		uint32_t location_is;
//Used in redirection, or when a new resource has been created.
		const char *__stdcall location() {
				static const char h[] = "Location: ";
				return "http://www.w3.org/pub/WWW/People.html";
		}

		uint32_t p3p_is;
//This header is supposed to set P3P policy, in the form of P3P:CP="your_compact_policy". However, P3P did not take off,[26] most browsers have never fully implemented it, a lot of websites set this header with fake policy text, that was enough to fool browsers the existence of P3P policy and grant permissions for third party cookies.
		const char *__stdcall p3p() {
				static const char h[] = "P3P: ";
				return "CP=\"This is not a P3P policy! See http://www.google.com/support/accounts/bin/answer.py?hl=en&answer=151657 for more info.\"";
		}

		uint32_t pragma_is;
//Implementation-specific headers that may have various effects anywhere along the request-response chain.
		const char *__stdcall pragma() {
				static const char h[] = "Pragma: ";
				return "no-cache";
		}

		uint32_t proxy_authenticate_is;
//Request authentication to access the proxy.
		const char *__stdcall proxy_autenticate() {
				static const char h[] = "Proxy-Authenticate: ";
				return "Basic";
		}

		uint32_t refresh_is;
//Used in redirection, or when a new resource has been created. This refresh redirects after 5 seconds. This is a proprietary, non-standard header extension introduced by Netscape and supported by most web browsers.
		const char *__stdcall refresh() {
				static const char h[] = "Refresh: ";
				return "5; url=http://www.w3.org/pub/WWW/People.html";
		}

		uint32_t retry_after_is;
//If an entity is temporarily unavailable, this instructs the client to try again after a specified period of time (seconds).
		const char *__stdcall retry_after() {
				static const char h[] = "Retry-After: ";
				return "120";
		}

		uint32_t server_is;
//A name for the server
		const char *__stdcall server() {
				static const char h[] = "Server: ";
				return "Apache/2.4.1 (Unix)";
		}

		uint32_t set_cookie_is;
//An HTTP cookie
		const char *__stdcall set_cookie() {
				static const char h[] = "set-Cookie: ";
				return "UserID=JohnDoe; Max-Age=3600; Version=1";
		}

		uint32_t status_is;
//The HTTP status of the response
		const char *__stdcall status() {
				static const char h[] = "Status: ";
				return "200 OK";
		}

		uint32_t strict_transport_security_is;
//A HSTS Policy informing the HTTP client how long to cache the HTTPS only policy and whether this applies to subdomains.
		const char *__stdcall strict_transport_security() {
				static const char h[] = "Strict-Transport-Security: ";
				return "max-age=16070400; includeSubDomains";
		}

		uint32_t trailer_is;
//The Trailer general field value indicates that the given set of header fields is present in the trailer of a message encoded with chunked transfer-coding.
		const char *__stdcall trailer() {
				static const char h[] = "Trailer: ";
				return "Max-Forwards";
		}

		uint32_t transfer_encoding_is;
//The form of encoding used to safely transfer the entity to the user. Currently defined methods are: chunked, compress, deflate, gzip, identity.
		const char *__stdcall transfer_encoding() {
				static const char h[] = "Transfer-Encoding: ";
				return "chunked";
		}

		uint32_t vary_is;
//Tells downstream proxies how to match future request headers to decide whether the cached response can be used rather than requesting a fresh one from the origin server.
		const char *__stdcall vary() {
				static const char h[] = "Vary: ";
				return "*";
		}

		uint32_t via_is;
//Informs the client of proxies through which the response was sent.
		const char *__stdcall via() {
				static const char h[] = "Via: ";
				return "1.0 fred, 1.1 example.com (Apache/1.1)";
		}

		uint32_t warning_is;
//A general warning about possible problems with the entity body.
		const char *__stdcall warning() {
				static const char h[] = "Warning: ";
				return "199 Miscellaneous warning";
		}

		uint32_t wwww_authenticate_is;
//Indicates the authentication scheme that should be used to access the requested entity.
		const char *__stdcall www_autenticate() {
				static const char h[] = "WWW-Authenticate: ";
				return "Basic";
		}

};
}
}
#endif
