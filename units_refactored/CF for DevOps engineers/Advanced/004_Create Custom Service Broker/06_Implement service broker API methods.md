## Implement service broker API methods

1. Implement the **provision** method that creates a DB using instance ID.

```
func (h Handler) Provision(instanceID string, _ brokerapi.ProvisionDetails, _ bool) (brokerapi.ProvisionedServiceSpec, error) {
	dbname, err := h.CreateDB(instanceID)

	if err != nil {
		return brokerapi.ProvisionedServiceSpec{}, err
	}

	return brokerapi.ProvisionedServiceSpec{
		IsAsync:      false,
		DashboardURL: dbname,
	}, nil
}
```

2. Implement the **deprovision** method. It simply drops a DB.

```
func (h Handler) Deprovision(instanceID string, _ brokerapi.DeprovisionDetails, _ bool) (brokerapi.IsAsync, error) {
	if err := h.DropDB(instanceID); err != nil {
		return false, err
	}

	return false, nil
}
```

3. Implement the **bind** method. It is needed to create DB users for bound application.

```
func (h Handler) Bind(instanceID, bindingID string, _ brokerapi.BindDetails) (brokerapi.Binding, error) {
	creds, err := h.CreateUser(instanceID, bindingID)

	if err != nil {
		return brokerapi.Binding{}, err
	}

	return brokerapi.Binding{
		Credentials: creds,
	}, nil
}
```

4. Implement the **unbind** method. It drops users and all their privileges for a service.

```
func (c Handler) Unbind(instanceID, bindingID string, _ brokerapi.UnbindDetails) error {
	if err := c.DropUser(instanceID, bindingID); err != nil {
		return err
	}

	return nil
}
```

5. Implement the rest methods that we won't support but still they are required.

```
func (Handler) LastOperation(instanceID string) (brokerapi.LastOperation, error) {
	return brokerapi.LastOperation{}, ErrAsyncNotSupported
}

func (Handler) Update(instanceID string, _ brokerapi.UpdateDetails, _ bool) (brokerapi.IsAsync, error) {
	return false, ErrUpdatingNotSupported
}
```

For more information about service broker API go to [the official documentation page](http://docs.cloudfoundry.org/services/api.html)
