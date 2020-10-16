Node Version
===

The Node version for this project is automatically managed by:
 - a ``.node-version`` file
 - the ``NVM`` and ``AVM`` packages

##### Setup

1. install [NVN](https://github.com/nvm-sh/nvm) (Node Version Manager)
    ```bash
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
    ```

2. install [AVN](https://github.com/wbyoung/avn) (Automatic Version Switching for Node.js)
    ```bash
    npm install -g avn avn-nvm avn-n
    avn setup
    ```

##### Usage

Once you've gone through the ``Setup`` above,
AVN will automatically switch to version of node specified in your project's ``.node-version`` file,
whenever you cd into the project's root or open a new terminal window in the project's root.


NPM Version
---

Additionally NPM version is specified in each package.json throughout the project eg.
```json
  "engines": {
    "npm": "^6.14.8"
  },
```
Make sure the NPM version specified in engines (as above) 
matches the Node version in ``.node-version``.

Use the following as a reference when checking this: 
 - [nodejs releases](https://nodejs.org/en/download/releases/)
