
## Bash Caesar Cipher

Caesar cipher - Implement a Caesar cipher, both encoding and decoding. The key is an integer from 1 to 25. This cipher rotates the letters of the alphabet (A to Z). The encoding replaces each letter with the 1st to 25th next letter in the alphabet (wrapping Z to A). So key 2 encrypts "HI" to "JK", but key 20 encrypts "HI" to "BC". This simple "monoalphabetic substitution cipher" provides almost no security, because an attacker who has the encoded message can either use frequency analysis to guess the key, or just try all 25 keys.

### How to use
To use, place this file in an empty folder. Place any files you want to encrypt or decrypt in the same folder.
#### Encrypt
Select a Key #, then select the file you want to encrypt. check `./encrypted/` for  converted file.
#### Decrypt 
Select a Key #, then select the file you want to decrypt. check `./encrypted/` for  converted file.
#### Run
Select the key # you used to encrypt the file, then select the file you want to run. This will decrypt the file, create a copy in `./decrypted/`, and then run the script in the terminal (if applicable).

Challenge from [Karan Projects](https://github.com/karan/Projects)

More about [Caesar Cipher](http://easyciphers.com/monolithic)
