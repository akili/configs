test:
	ansible-playbook for-tests.yaml -i hosts --vault-password-file=vault.txt

check:
	echo "Success"

manjaro:
	ansible-playbook setup-manjaro.yaml --ask-become-pass
