# Event Authenticator

## Install

```bash
    go get golang.org/x/oauth2
    go get github.com/asaskevich/govalidator
```

## Usage

```go
    func main() {
	flag.Parse()
	fmt.Println(mode)
	defer utilities.TimeTrack(time.Now(), fmt.Sprintf("Wedding API Service"))
	defer func() {
		fmt.Print("ef")
		if e := recover(); e != nil {
			log.Panicln(e)
			main()
		}
	}()

	//load env
	var config Config
	err := utilities.LoadEnvFromFile(&config, configPrefix, configSource)
	if err != nil {
		log.Fatalln(err)
	}

	//load container
	container, err = NewContainer(config)
	if err != nil {
		log.Fatalln(err)
	}

	fmt.Println("Server is running at : " + config.Binding)
	http.ListenAndServe(config.Binding, NewAPIv1(container))
}

func init() {
	runtime.GOMAXPROCS(runtime.NumCPU())
	flag.StringVar(&configPrefix, "configPrefix", "wedding", "config prefix")
	flag.StringVar(&configSource, "configSource", ".env", "config source")

}
```

## Middleware

## Details

## API

###LOGIN

- `/auth/sign-in` sign-in
- `/auth/sign-up` sign-up
- `/auth/verify:headers`

###USER
\*GET

- `/auth/user/` get all user
- `/auth/user/:id` get a user with id

\*POST

- `/auth/user/` add a user

\*PUT

- `/auth/user/update/:id` update a user

\*DELETE

-`/auth/user/deletebyid/:id` delete a user by id

- `/auth/user/deletebyphone/:phonenumber` delete a user by phone number

###LOGIN WITH FACEBOOK
\*POST

- `/auth/facebook/sign-in`

###LOGIN WITH GOOGLE
\*POST

- `auth/google/sign-in`

## Verified authentication

## Register oauth2

\*Google Auth

1. Create a new project: https://console.developers.google.com/project
2. Choose the new project from the top right project dropdown (only if another project is selected)
3. In the project Dashboard center pane, choose "API Manager"
4. In the left Nav pane, choose "Credentials"
5. In the center pane, choose "OAuth consent screen" tab. Fill in "Product name shown to users" and hit save.
6. In the center pane, choose "Credentials" tab.
   - Open the "New credentials" drop down
   - Choose "OAuth client ID"
   - Choose "Web application"
   - Application name is freeform, choose something appropriate
   - Authorized origins is your domain ex: https://example.mysite.com
   - Authorized redirect URIs is the location of oauth2/callback constructed as domain + /auth/google/callback, ex: https://example.mysite.com/auth/google/callback
   - Choose "Create"
7. Take note of the Client ID and Client Secret

\*Facebook Auth

1. Access to URL : https://developers.facebook.com/
2. Create Account
3. Create App with Website domain, your app have ClientID(App ID) and CLient Secret(Secret)
4. In Setting/Basic : Fill Privacy Policy URL <i style="color: red"> Not Set as Localhost... </i> and then Turn ON the Development Mode

5. Documentation: https://www.npmjs.com/package/react-facebook
6. Using Login-Button to create button on interface : <i>Input your app ID</i>
7. The http in interface must be secure : HTTPS - Because Enforce HTTPS in your Facebook App is ON
8. Run app and click the button
9. in tab console will return accessToken in object

10. On Service

- GET : https://graph.facebook.com/me?fields=" + your permission + "&access_token=" + accessToken. Web will return object include all fields which you request
