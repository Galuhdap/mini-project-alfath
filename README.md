<div align="center">
    <!-- <div >
        <img height="300px" src="https://firebasestorage.googleapis.com/v0/b/barber-hub-e5e9c.firebasestorage.app/o/Preview%202.png?alt=media&token=899d3ce7-9785-4270-8165-e734722b1567" alt=""/>
    </div> -->
    <div>
            <h3><b>MINI PROJECT ALFATH</b></h3>
            <p><i>Just do it</i></p>
    </div>      
</div>

## Getting started

**Prerequisites :**

- Flutter SDK : 3.35.6
- IDE of your choice (e.g., VS Code, or Android Studio)

**Installation :**

1. Clone the repository

```bash
$ git clone https://github.com/Galuhdap/mini-project-alfath
```

2. Navigate to project directory

```bash
$ cd mini-project-alfath
```

3. Install Dependencies

```bash
$ flutter pub get
```

**Asset Generator :**

- add in dev_dependencies

  - build_runner
  - flutter_gen_runner

- when you add image static or icon just run
  - dart run build_runner build

**Launch Settings**

1.  **VS Code**

        {
            "version": "0.2.0",
            "configurations": [
                {
                "name": "Dev Mini Project Alfath",
                "type": "dart",
                "request": "launch",
                "program": "lib/main_dev.dart",
                "args": ["--flavor", "dev"]
                },
                {
                "name": "Staging Mini Project Alfath",
                "type": "dart",
                "request": "launch",
                "program": "lib/main_staging.dart",
                "args": ["--flavor", "staging"]
                },
                {
                "name": "Prod Mini Project Alfath",
                "type": "dart",
                "request": "launch",
                "program": "lib/main_prod.dart",
                "args": ["--flavor", "prod"]
                }
            ]
        }


2.  **Android Studio**

`--flavor prod --no-enable-impeller`
