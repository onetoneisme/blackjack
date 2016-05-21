### Restaging applications

There is another way to "restart" an application, which is called *restaging*. Restaging an application means that, except for uploading the application code, all the processes that are executed when pushing the application will run again. Let's have a look at what happens when you run `cf restage`:

```sh
cf restage my-app
```

As you can see, there is a fundamental difference between restaging and restarting applications: a simple `restart` will keep the droplet, whilst `restage` will erase the current droplet and create a new one with the previously pushed code.
