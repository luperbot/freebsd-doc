# $FreeBSD$
#
# Perl routines to encapsulate various elements of HTML page style.

# For future reference, when is now?
($se,$mn,$hr,$md,$mo,$yr,$wd,$yd,$dst) = localtime(time);
$yr += 1900;
$mo += 1;
$timestamp = "$mo-$md-$yr";

if (!defined($hsty_base)) { 
    # $hsty_base should be relative if possible, so that mirrors
    # serve their local copy instead of going to the main site.
    # However, if we aren't running as a cgi, or if we're
    # running on cgi, hub, docs or people, use the absolute home path.
    if (!defined($ENV{'HTTP_HOST'}) ||
	$ENV{'HTTP_HOST'} =~ /(cgi|hub|docs|people|mailarchive.ysv).freebsd.org/i) {

	$hsty_base = '//www.FreeBSD.org'
    } else {
	$hsty_base = '..';
    }
}
if (!defined($hsty_email)) {
    $hsty_email = 'Contact';
}
if (!defined($hsty_author)) {
    $hsty_author = "<a href='$hsty_base/mailto.html'>$hsty_email</a>";
}

if (!defined($hsty_date)) {
    $hsty_date = '';
}

if (!defined($hsty_charset)) {
    $hsty_charset = 'iso-8859-1';
}

# This can be set to either a string containing an inline CSS stylesheet
# or to a <link> element that references an external CSS stylesheet, to
# make local modifications to the style of a CGI script's output.
$t_style = "";	# Don't allow script to override completely, just
		# let the script's setting cascade with the master.

$i_topbar = "";

#XXX does anyone use this? I don't know what it should be in the new style.
if (!defined($hsty_home)) {
    $hsty_home = "<a href='$hsty_base/'><img src='$hsty_base/gifs/home.gif'
  alt='FreeBSD Home Page' border='0' align='right'></a>";
}

sub html_header {
    local ($title, $xhtml) = @_;

    return short_html_header($title, $xhtml) . "<h1>$title</h1>\n";
}

sub short_html_header {
    local ($title, $xhtml) = @_;

    $xhtml = 1 unless defined($xhtml);
    $doctype = $xhtml ?  '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' : '<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">';
    $html = $xhtml ? '<html xmlns="http://www.w3.org/1999/xhtml">' : '<html>';
    $endslash = $xhtml ? '/' : '';
    $csshack = (1 || $xhtml) ? '' : q`<style type="text/css">
tr, td {
  margin: 0;
  padding: 0;
  font-family: verdana, sans-serif;
  font-size: 69%;
  color: #000;
}
</style>
`;

    return qq`Content-type: text/html

$doctype
$html

<head><title>$title</title>
<meta http-equiv='content-type' content='text/html; charset=$hsty_charset' $endslash>
<meta name='robots' content='nofollow' $endslash>
    <link rel="stylesheet" media="screen"
    href="$hsty_base/layout/css/fixed.css" type="text/css"
    title="Normal Text" $endslash>
    <link rel="alternate stylesheet" media="screen"
    href="$hsty_base/layout/css/fixed_large.css" type="text/css"
    title="Large Text" $endslash>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="apple-touch-icon" href="/favicon.ico" type="image/x-icon" />
$csshack
<script type="text/javascript" src="$hsty_base/layout/js/google.js">
</script>
$t_style
</head>
<body>
$i_topbar
`;
}

sub html_footer {
    return "";


}

sub get_the_source {
    return if $ENV{'PATH_INFO'} ne '/get_the_source';

    open(R, $0) || do { 
	print "Oops! open $0: $!\n";  # should not reached
	exit;
    };

    print "Content-type: text/plain\n\n";
    while(<R>) { print }
    close R;
    exit;
}

1;
