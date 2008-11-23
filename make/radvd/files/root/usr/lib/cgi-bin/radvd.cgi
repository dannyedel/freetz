#!/bin/sh

PATH=/bin:/usr/bin:/sbin:/usr/sbin
. /usr/lib/libmodcgi.sh

auto_chk=''; man_chk=''

case "$RADVD_ENABLED" in yes) auto_chk=' checked';; *) man_chk=' checked';; esac

sec_begin '$(lang de:"Starttyp" en:"Start type")'

cat << EOF
<p>
<input id="e1" type="radio" name="enabled" value="yes"$auto_chk><label for="e1"> $(lang de:"Automatisch" en:"Automatic")</label>
<input id="e2" type="radio" name="enabled" value="no"$man_chk><label for="e2"> $(lang de:"Manuell" en:"Manual")</label>
EOF
cat << EOF
</p>
EOF

sec_end
sec_begin '$(lang de:"radvd" en:"radvd")'

cat << EOF
<table border="0">
<tr>
	<td>$(lang de:"IPv6 Schnittstelle" en:"ipv6 interface"):</td>
	<td><input type="text" name="interface" size="15" maxlength="16" value="$(httpd -e "$RADVD_INTERFACE")"></td>
</tr>
<tr>
	<td>$(lang de:"IPv6 Adresse" en:"ipv6 address"):</td>
	<td><input type="text" name="address" size="30" maxlength="100" value="$(httpd -e "$RADVD_ADDRESS")"></td>
</tr>
<tr>
	<td>$(lang de:"IPv6 Prefix" en:"ipv6 prefix"):</td>
	<td><input type="text" name="prefix" size="30" maxlength="100" value="$(httpd -e "$RADVD_PREFIX")"></td>
</tr>
</table>
EOF

sec_end
