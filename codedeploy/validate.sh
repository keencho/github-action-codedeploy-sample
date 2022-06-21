#!/bin/bash
validate () {
	count=1
	while [ ${count} -le 11 ]; do
		response=$(curl --write-out '%{http_code}' --silent --output /dev/null $1)

		if [ ${response} -eq 200 ]; then
			break
		else
			if [ ${count} -eq 11 ]; then
				echo "$2 어플리케이션 검증 실패"
				exit 1
			fi

			echo "$2 어플리케이션 검증 재시도... ${count}"
			sleep 10s
			count=$((count + 1))
		fi
	done

}

validate "localhost:8090/script-health-check" "샘플"