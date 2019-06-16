#/usr/bin/pythonie
import paramiko
zdalny_serwer=paramiko.SSHClient()


zdalny_serwer.set_missing_host_key_policy(paramiko.AutoAddPolicy())
zdalny_serwer.connect("localhost",username='tester',password='tester')
a,b,c = zdalny_serwer.exec_command("uname -a")
message = b.read()
print(message)
if not "Linux" in message:
    print("Error")
