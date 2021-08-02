## Overview
Ballerina connector for Trello is connecting the Trello REST API via Ballerina language easily. It provides capability to perform CRUD (Create, Read, Update, and Delete) operations on resouces in a Trello account.

This module supports REST API v1 for Trello.
 
## Configuring connector
### Prerequisites
- A Trello Account

### Obtaining tokens
1. Obtain your API key by logging into Trello and visiting https://trello.com/app-key
2. Generate a token for yourself. On the same page where you found your API key (https://trello.com/app-key), click the hyperlinked `Token` word under the API key.
3. Click `Allow` to grant your own app (identified via your API key) access to your account.
**Note:** Tokens should be kept secret
 
## Quickstart
### Create a new Borad
#### Step 1: Import Trello module
First, import the ballerinax/trello module into the Ballerina project.
```ballerina
import ballerinax/trello;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the API key and token.
```ballerina
trello:ApiKeysConfig configuration = {
    apiKeys: {
        'key: <TRELLO_API_KEY>,
        token: <TRELLO_API_TOKEN>
    }
};

trello:Client trelloClient = check new Client(configuration);

```
#### Step 3: Add a new Board

```ballerina
public function main() {
    trello:Boards board = {
        idBoardSource: "<THE_ID_OF_PARENT_BOARD>"
    };
    http:Response|error boardInfo = trelloClient->addBoards(board);
}
``` 

### Get a Borad
First, import the ballerinax/trello module into the Ballerina project.
```ballerina
import ballerinax/trello;
```
#### Step 2: Configure the connection credentials.
You can now make the connection configuration using the API key and token.
```ballerina
trello:ApiKeysConfig configuration = {
    apiKeys: {
        'key: <TRELLO_API_KEY>,
        token: <TRELLO_API_TOKEN>
    }
};

trello:Client trelloClient = check new Client(configuration);

```
#### Step 3: Add a new Board

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