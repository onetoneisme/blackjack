### Restaging applications

There is another way to "restart" an application, which is called *restaging*. Restaging an application means that, except uploading the application code, all the processes that are executed when pushing an application will run again. See what happens when you run `cf restage`:

```sh
cf restage my-app
```

As you can see, there is fundamental difference with restarting applications: a simple `restart` will keep the droplet, whilst `restage` will erase the current droplet and create a new one with the code previously pushed.
