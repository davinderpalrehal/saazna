MAKEFLAGS += -j2

install-be:
	(cd "${CURDIR}/be" && pnpm i)

install-fe:
	(cd "${CURDIR}/fe" && pnpm i)

install: install-be install-fe

up-be:
	(cd "${CURDIR}/be" && pnpm i && pnpm start:dev)

up-fe:
	(cd "${CURDIR}/fe" && pnpm i && pnpm dev)

up: up-be up-fe

up-emulators:
    (firebase emulators:start)