helpers do
  # Construct a link to +url_fragment+, which should be given relative to
  # the base of this Sinatra app.  The mode should be either
  # <code>:path_only</code>, which will generate an absolute path within
  # the current domain (the default), or <code>:full_url</code>, which will
  # include the site name and port number.  The latter is typically necessary
  # for links in RSS feeds.  Example usage:
  #
  #   link_to "/foo" # Returns "http://example.com/myapp/foo"
  #
  #--
  # Thanks to cypher23 on #mephisto and the folks on #rack for pointing me
  # in the right direction.

  def default_port?
    port = request.port
    scheme = request.scheme
    return true if scheme == 'http' && port == 80
    return true if scheme == 'https' && port == 443
    false
  end

  def link_to(url_fragment, link_text, mode = :path_only)
    case mode
    when :path_only
      base = request.script_name
    when :full_url
      port = default_port? ? '' : ":#{request.port}"
      base = "#{request.scheme}://#{request.host}#{port}#{request.script_name}"
    else
      fail "Unknown script_url mode #{mode}"
    end
    "<a href='#{base}#{url_fragment}'>#{link_text}</a>"
  end
end
