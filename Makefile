test:
	ansible-playbook for-tests.yaml -i hosts --vault-password-file=vault.txt

check:
	echo "Success"
