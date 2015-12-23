# cf-training

## Verifying lessons

The script `verify.sh` in the directory `units` process a file that contains a script of verifications.
Run it:

```
./verify.sh script_file
```

If you want to verify that the lesson `002_QuickStart.md` in the `operators_basic` course has been completed, use:

```
./verify.sh operators_basic/002_QuickStart.verify
```

The format of the script is as follows:

```
#cf orgs|.*training.*|Org "training" not found
>cf target -o training
cf spaces|.*test-space.*|Space "test-space" not found
>cf target -o training -s test-space
cf space-users training test-space|SPACE DEVELOPER.*[a-zA-Z].*test-user|User "test-user" not found.
cf apps|!!.*Sinatra-Example-app.*started.*1/1.*|App "Sinatra-Example-app" not found, not started or instances are not set to 1
```

* Lines starting with `#` are comments. They will be ignored.
* Lines starting with `>` are directives. They will be executed, but not evaluated for results.
* Evaluation commands are executed and the result is evaluated accordint the to Regular Expression specified. Also, a message can be specified for showing. The format is `command|regex|message`
* If the Regular Expression starts with `!!` it will be evaluated negatively.
* If some verification fails, the script will show which command failed, the Regex that validates the command and the message. Also, the script will exit with status 1
* If the all the validations go well, the script will exit with status 0.

Example output:
```
cf orgs | .*trainig.* | Org "training" not found
```
