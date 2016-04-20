### Viewing security groups

The CLI offers a wide variety of ways to display information about our security groups:

- To view all the security groups in the current *org*, use the `cf security-groups` command.
- To view the security groups binded to the **Default staging** set, use the `cf staging-security-groups` command.
- To view the security groups binded to the **Default running** set, use the `cf running-security-groups` command.
- To view detailed information of a security group, use the `cf security-group SECURITY-GROUP-NAME` command. In our example, the command will be: `cf security-group mysql-sg`:

```sh
$ cf security-group mysql-sg
Getting info for security group mysql-sg as admin
OK

Name    mysql-sg
Rules
	[
		{
			"destination": "0.0.0.0/24",
			"ports": "3306",
			"protocol": "tcp"
		}
	]

     Organization   Space
#0   my-org         my-first-space   
```
