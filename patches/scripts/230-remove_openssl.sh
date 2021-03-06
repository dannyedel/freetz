if [ "$FREETZ_REPLACE_OPENSSL" == "y" ]; then
	if [ "$FREETZ_LIB_libcrypto" == "y" ]; then
		echo1 "removing avm's libcrypto and create symlinks"
		rm_files "${FILESYSTEM_MOD_DIR}/lib/libcrypto.so.0.9.8"
		ln -sf "/usr/lib/freetz/libcrypto.so.0.9.8" "${FILESYSTEM_MOD_DIR}/lib/libcrypto.so.0.9.8"
	fi
	if [ "$FREETZ_LIB_libssl" == "y" ]; then
		echo1 "removing avm's libssl and create symlinks"
		rm_files "${FILESYSTEM_MOD_DIR}/lib/libssl.so.0.9.8"
		ln -sf "/usr/lib/freetz/libssl.so.0.9.8" "${FILESYSTEM_MOD_DIR}/lib/libssl.so.0.9.8"
	fi
fi
