# Demonstrates problem with custom 404-generating middleware

The app uses a middlware to render either a default or special ('other') 404
page in response to 404 errors from the app.

```ruby
GET /                    #=> 200
GET /anything-else       #=> 404, should render 'Default 404'
GET /anything-else/other #=> 404, should render 'Other 404'
```

The bug is caused by Hanami depending on the presence of the `'hanami.action'`
key in the Rack env in preference to the response returned by the app stack.

To see the intended behaviour run the server or specs with `WORKAROUND=true`:

```sh
$ WORKAROUND=true bundle exec hanami server
$ WORKAROUND=true bundle exec rspec spec
```
