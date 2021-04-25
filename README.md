# Docker image for running nheqminer with CPU

## Start mining in 5 steps!

1. Build an image locally

    ```sh
    make
    ```

2. Create a Makefile

    ```sh
    cp Makefile.dist Makefile
    ```

3. Prepare the options you want to pass to nheqminer. (For instance, check [piratepool.io](https://piratepool.io/getting_started))

4. Open `Makefile` in a text editor and in the last line replace `-b` with the options that you have prepared.

5. Start the docker container

    ```sh
    make run
    ```
