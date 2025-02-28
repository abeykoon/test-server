Invoke the service with

```
curl -X POST "http://localhost/external-service/card" \
     -H "Content-Type: application/json" \
     -d '{
          "name": "Assert Storage",
          "version": "1.0.0",
          "orgId": "org-12345",
          "resourceType": "Services",
          "platformServiceType": "AWS S3",
          "projectId": "ce0d5cab-7997-4120-a407-64b0008a9951",
          "description": "Store for any kind of organisational asserts",
          "summary": "",
          "provider": "AWS",
          "visibility": ["Project"],
          "properties": {
              "url": "https://assert-storage.s3.us-east-1.amazonaws.com",
              "region": "us-east-1"
          },
          "tags": ["label1", "label2"],
          "endpoints": [
              {
                  "name": "Assert Storage [dev] [read only] endpoint",
                  "description": "Read only connection to Assert Storage S3 bucket in Dev account",
                  "parameters": [
                      { "key": "URL", "value": "https://assert-storage.s3.us-east-1.amazonaws.com", "isSecret": false },
                      { "key": "AWSAccessKeyId", "value": "AKIAIOSFODNN7EXAMPLE", "isSecret": false },
                      { "key": "AWSSecretAccessKey", "value": "abcd@2", "isSecret": true },
                      { "key": "Region", "value": "US-East-1", "isSecret": false }
                  ]
              }
          ]
     }'
```
