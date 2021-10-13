## Overview
This is a generated connector for [Trello API v1](https://trello.com) OpenAPI specification.
 
Client endpoint of Trello API provides capability to perform CRUD (Create, Read, Update, and Delete) operations on resources in a Trello account.

## Prerequisites
- Create a [Trello](https://trello.com) account
- Obtain tokens
    - Use [this](https://developer.atlassian.com/cloud/trello/guides/rest-api/api-introduction/#authentication-and-authorization) guide to obtain the API key and generate a token related to your account.

## Quickstart

To use the Trello connector in your Ballerina application, update the .bal file as follows:
### Step 1 - Import connector
First, import the ballerinax/trello module into the Ballerina project.
```ballerina
import ballerinax/trello;
```
### Step 2 - Create a new connector instance
You can now make the connection configuration using the API key and token.
```ballerina
trello:ApiKeysConfig configuration = {
    key: <TRELLO_API_KEY>,
    token: <TRELLO_API_TOKEN>
};

trello:Client trelloClient = check new Client(configuration);
```
### Step 3 - Invoke connector operation
1. Add a new Board

```ballerina
public function main() {
    trello:Boards board = {
        idBoardSource: "<THE_ID_OF_PARENT_BOARD>"
    };
    http:Response|error boardInfo = trelloClient->addBoards(board);
}
``` 

2. Get a Borad

```ballerina
public function main() {
    trello:Boards board = {
        idBoardSource: "<THE_ID_OF_PARENT_BOARD>"
    };
    http:Response|error boardInfo = trelloClient->getBoardsByIdBoard(boardId);
    if (boardInfo is http:Response) {
        json|error info = boardInfo.getJsonPayload();
        if (info is json) {
            log:printInfo("Board Info " + info.toString());
        }
    }
}
```

3. Use `bal run` command to compile and run the Ballerina program