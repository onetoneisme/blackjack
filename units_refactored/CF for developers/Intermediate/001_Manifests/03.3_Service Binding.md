#### Binding sevices

One of the best and most frequently used application manifest features is the ability to bind services.
This is done through the `services` key, which will accept an array of strings that represents the names of the services to bind.

1. Checkout the `with-service` branch of the application: `git checkout wiht-service --force`
2. Modify the `manifest.yml` to include the `services` key:
    ```yaml
    ---
    applications:
    - name: "my-app"
      memory: 128M
      disk_quota: 256M
      timeout: 120
      host: "my-precious-app"
      command: "bundle exec thin start -p $PORT -R config.ru"
      services:
        - my-app-db
    ```
3. Since you have changed branches, you need to re-edit the `Gemfile`, adding `gem "thin"` at the end of it.
4. Run `bundle install`.
3. Push the application.

As you can see, binding services in the `manifest.yml` is very convenient. Write it once and you are good to go.
