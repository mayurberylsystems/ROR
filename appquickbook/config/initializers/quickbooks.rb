OAUTH_CONSUMER_KEY = "Q0MEMwtgcJS8YpDwfRUoDAgoTOkAMaQ3K7L66xgrycrx92UtVE"
OAUTH_CONSUMER_SECRET = "KH99bV4hFnzsJyBETpM2W6InigCQs9sxUwFX0L1Z"

::QB_OAUTH_CONSUMER = OAuth::Consumer.new(OAUTH_CONSUMER_KEY, OAUTH_CONSUMER_SECRET, {
    :site                 => "https://oauth.intuit.com",
    :request_token_path   => "/oauth/v1/get_request_token",
    :authorize_url        => "https://appcenter.intuit.com/Connect/Begin",
    :access_token_path    => "/oauth/v1/get_access_token"
})