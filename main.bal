import ballerina/http;
import ballerina/log;

configurable int port = 80;
configurable boolean isDebugEnabled = ?;


// Define an enum for provider types
public enum ResourceType {
    Services,
    Databases,
    ExternalResources
}

// Define an enum for provider types
public enum Provider {
    AWS,
    AZURE,
    GCP
}

// Define an enum for visibility types
public enum Visibility {
    Project,
    Organization,
    Public
}

// Define a record for connection parameters
public type ConnectionParameter record {
    string key;
    string value;
    boolean isSecret;
};

// Define a record for connections
public type Endpoint record {
    string name;
    string description;
    string projectId?;
    string componentId?;
    ConnectionParameter[] parameters;
};

// Define the main platform service record
public type PlatformServiceReq record {
    string name;
    string version;
    string orgId;
    ResourceType resourceType;
    string platformServiceType;
    string projectId;
    string description;
    string? summary;
    Provider provider;
    Visibility[] visibility;
    map<string> properties;
    string[] tags;
    Endpoint[] endpoints;
};

service http:Service /external\-service on new http:Listener(port) {
    resource function post card(PlatformServiceReq request) returns json|error {
        log:printInfo("Received request for /card" );
        if isDebugEnabled {
            json requestJson = request.toJson();
            log:printDebug("DEBUG: Request received for /card: " + requestJson.toJsonString());
        }
        json message = {status:"success"};
        return message;
    }
}
