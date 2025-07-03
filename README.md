# test-okteto

This repository contains an Okteto configuration for developing and deploying applications in a Kubernetes environment using Okteto.

## Okteto Configuration (`okteto.yaml`)

The `okteto.yaml` file defines the development environment configuration for Okteto, which enables cloud-native development by creating development environments in Kubernetes.

### Build Section

```yaml
build:
  service-a:
    context: .
```

- **service-a**: Defines a service named "service-a" that will be built
- **context**: Set to `.` (current directory), indicating that the Docker build context is the root of the repository
- This will use the `Dockerfile` in the current directory to build the container image

### Deploy Section

```yaml
deploy:
  remote: true
  commands:
    - name: Cue
      command: cue version
```

- **remote: true**: Indicates that the deployment should happen remotely in the Okteto cluster rather than locally
- **commands**: A list of commands to execute during the deployment process
  - **Cue command**: Executes `cue version` to check the version of the Cue configuration language tool

#### Commented Deploy Commands

The configuration also includes several commented-out commands that can be enabled if needed:
- Print working directory (`pwd`)
- List SSH identities (`ssh-add -L`)
- Clone a private repository (`git clone git@github.com:ifbyol/test-up-statefulset.git`)
- Sleep for 2 minutes (`sleep 120`)

### Destroy Section (Commented Out)

```yaml
#destroy:
#  - name: print something
#    command: echo "hi! this is a test"
#  - name: ls
#    command: ls -la
#  - name: sleep
#  - command: sleep 30
```

The destroy section is currently commented out but would define cleanup commands to run when the development environment is destroyed:
- Print a test message
- List files in the current directory
- Sleep for 30 seconds

## Usage

This configuration enables developers to:
1. Build a containerized application using the local Dockerfile
2. Deploy it remotely to an Okteto-managed Kubernetes cluster
3. Run initialization commands (like checking Cue version) during deployment
4. Optionally define cleanup commands for environment destruction

To use this with Okteto, you would typically run commands like:
- `okteto build` - to build the service-a container
- `okteto deploy` - to deploy the application remotely
- `okteto destroy` - to clean up the environment (when destroy commands are uncommented)