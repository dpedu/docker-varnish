vcl 4.0;
import std;
import directors;

backend default {
    .host = "dpedu.io";
    .port = "80";
}

# Setup function
sub vcl_init {
    new default_balancer = directors.round_robin();
    default_balancer.add_backend(default);
}

sub vcl_recv {
    # If X-Real-IP is unset, assume we are talking directly to the client
    if (!req.http.X-Real-IP) {
        set req.http.X-Real-IP = client.ip;
    }
    
    # Set backend to handle request
    set req.backend_hint = default_balancer.backend();
    set req.http.host = "dpedu.io";
    
    # Disabled cookies for static assets
    if (req.url ~ "(?i)\.(pdf|asc|dat|txt|doc|xls|ppt|tgz|csv|png|gif|jpeg|jpg|ico|swf|css|js)(\?.*)?$") {
        unset req.http.Cookie;
        # return cache for object
        return (pass);
    }
        
    return (pass);
}
