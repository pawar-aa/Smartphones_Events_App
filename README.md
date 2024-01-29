# Evently - Event Booking and Hosting iOS Application

## Overview

Evently is an iOS application designed for event booking and hosting, providing a seamless experience for users interested in managing and attending events. The application is built using Swift and SwiftUI, utilizing GraphQL for efficient data queries. The backend services are powered by AWS, including AWS Amplify, IAM, AppSync, and DynamoDB.

## Pre-requisites

- **Platform:** MacOS, iOS
- **Languages:** Swift, SwiftUI, GraphQL
- **Software:** XCode, Terminal
- **Services:** AWS Cloud Console - Amplify, IAM, AppSync, DynamoDB

## Getting Started

1. Open XCode and create a new project with the iOS Application template.
2. Open Terminal and navigate to the project's root folder using the command `cd /path/to/TodoApp`.
3. Pull AWS Amplify dependencies by running the following commands:
   ```bash
   curl -sL https://aws-amplify.github.io/amplify-cli/install | bash && $SHELL
   amplify configure
4. Access keys for AWS are provided below:
    ```bash
   - **Access Key:** AKIA3FLD5Q7T5IO6A4P7
   - **Secret Access Key:** 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
6. Pull the database configuration using:
   ```bash
   amplify pull --appId dogrdjo3jw5y --envName staging
7. Generate data models with the command:
   ```bash
   amplify codegen models
8. Add the Amplify Library to your project. Refer to [Amplify Swift Documentation](https://docs.amplify.aws/swift/start/getting-started/setup/) for detailed setup instructions.


