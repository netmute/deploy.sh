# Deploy.sh

## What?

Deploy.sh is a simple shell script that uploads stuff to your server.

## Why?

You have a cool website or Javascript application. You don't want to manually upload the files to your server after each change. That's tedious and slow.

Of course you can use Capistrano or Grunt. Install a bazillion dependencies just to upload things to your server.

Or you could just use a few lines of shell script.

## How?

Copy deploy.sh to your project directory. Then edit a few variables.

`APP_NAME` - The name of your site/app.

`SSH_HOST` - User and hostname of the server you want to upload your files to.

`APP_DIR` - Where should your files be on the server?

`BUNDLE_CMD` - A command that creates a bundle.tgz archive containing all the files you want to upload. (The default command uses Git)

That's it. From now on you can just type `./deploy.sh` and be done.

## Easy customization

So you're a **Ruby** or **Node** guy and need a little bit extra? Deploy.sh is very easy to understand and modify. It's just ~20 lines of shell script after all.

Need to install dependencies on the server? Add a `bundle install` or `npm install` after the bundle.tgz extraction. Need to restart your app server? Just add the line to the script.