OAUTH_CONSUMER_KEY = "Q0H6uV4Y5t5lVVsvPLdEZjTq0Ow1Fdum4o061pGTChibql06yB"
OAUTH_CONSUMER_SECRET = "XZ1ZH0GcluQKmNtLml29KNZ9YUlIXhjq7XN6RVES"

::QB_OAUTH_CONSUMER = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
    :access_token_path    => "/oauth/v1/get_access_token"
})