if test -e ${CONFDIR}/debmirror.conf; then
  ARGS="--config-file=${CONFDIR}/debmirror.conf"
else
  ARGS="/usr/bin/debmirror -v --method ${METHOD} -h ${SOURCE_SRV} -r ${SOURCE_DIR} --dist=${DIST} --section=${SECTION} --arch=${ARCH} --ignore-release-gpg --no-check-gpg"
fi
/usr/bin/debmirror -v ${ARGS} ${MIRRORDIR} # >> ${CONFDIR}/${DEBUGFILE} 2>&1
