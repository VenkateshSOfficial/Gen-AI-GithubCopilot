# HTTP Methods - Comprehensive Guide for API Testing

## Overview
HTTP methods (also called HTTP verbs) are actions that specify what you want to do with a resource on a web server. They are fundamental to REST API design and are essential for API testing with Postman and Rest Assured.

---

## 1. GET - Retrieve Data

### Definition
The **GET** method is used to retrieve data from a server. It requests data without modifying it on the server.

### Characteristics
- **Safe**: Does NOT modify server data
- **Idempotent**: Multiple identical GET requests return the same result
- **Cacheable**: Responses can be cached
- **No Body**: Typically has no request body
- **Visible**: Parameters are visible in the URL (query string)

### Use Cases
- Fetch user information
- Retrieve a list of products
- Get API documentation
- Download files
- Fetch resource details

### HTTP Status Codes
- `200 OK` - Request succeeded, data returned
- `304 Not Modified` - Resource not changed since last request
- `400 Bad Request` - Invalid request parameters
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Access denied
- `404 Not Found` - Resource does not exist
- `500 Internal Server Error` - Server error

### Example in Postman
```
GET /api/users/1 HTTP/1.1
Host: api.example.com
Authorization: Bearer token123
```

**Response (200 OK):**
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "role": "admin"
}
```

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;
import io.restassured.response.Response;

// Simple GET request
Response response = RestAssured.get("https://api.example.com/api/users/1");

// GET with assertions
RestAssured
  .given()
    .header("Authorization", "Bearer token123")
  .when()
    .get("https://api.example.com/api/users/1")
  .then()
    .statusCode(200)
    .body("name", equalTo("John Doe"))
    .body("email", equalTo("john@example.com"));
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- Retrieve existing resource (200 OK)
- Retrieve resource with valid ID (200 OK)
- Retrieve resource with valid query parameters

⚠️ **Negative Scenarios:**
- Retrieve non-existent resource (404 Not Found)
- Invalid resource ID format (400 Bad Request)
- Missing required headers (401/403)

🔧 **Edge Cases:**
- Retrieve resource with very large ID
- Retrieve with special characters in query string
- Retrieve with multiple query parameters
- Empty result set (200 OK with empty array)

---

## 2. POST - Create New Data

### Definition
The **POST** method is used to submit data to a server to create a new resource. The server processes the request body and creates a new resource.

### Characteristics
- **NOT Safe**: Modifies server data (creates new resource)
- **NOT Idempotent**: Multiple identical POST requests create multiple resources
- **NOT Cacheable**: Responses are typically not cached
- **With Body**: Contains request body with data to be submitted
- **Hidden**: Data in body is not visible in URL

### Use Cases
- Create a new user account
- Submit a form
- Upload a file
- Create a new order
- Send email notifications
- Log in (some APIs use POST)

### HTTP Status Codes
- `200 OK` - Request succeeded, response body contains result
- `201 Created` - Resource successfully created
- `202 Accepted` - Request accepted for processing
- `204 No Content` - Request succeeded, no content in response
- `400 Bad Request` - Invalid request data
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Permission denied
- `409 Conflict` - Resource already exists
- `422 Unprocessable Entity` - Validation failed
- `500 Internal Server Error` - Server error

### Example in Postman
```
POST /api/users HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer token123

{
  "name": "Jane Smith",
  "email": "jane@example.com",
  "role": "user"
}
```

**Response (201 Created):**
```json
{
  "id": 5,
  "name": "Jane Smith",
  "email": "jane@example.com",
  "role": "user",
  "createdAt": "2026-01-17T10:30:00Z"
}
```

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;
import io.restassured.response.Response;

// POST with JSON body
String requestBody = "{\n" +
  "\"name\": \"Jane Smith\",\n" +
  "\"email\": \"jane@example.com\",\n" +
  "\"role\": \"user\"\n" +
"}";

Response response = RestAssured
  .given()
    .header("Content-Type", "application/json")
    .header("Authorization", "Bearer token123")
    .body(requestBody)
  .when()
    .post("https://api.example.com/api/users")
  .then()
    .statusCode(201)
    .body("name", equalTo("Jane Smith"))
    .body("id", notNullValue())
    .extract()
    .response();

int newUserId = response.jsonPath().getInt("id");
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- Create resource with valid data (201 Created)
- Create resource with minimal required fields
- Create resource with additional optional fields
- Verify created resource ID is returned

⚠️ **Negative Scenarios:**
- Create resource with missing required fields (400/422)
- Create resource with invalid data type (400)
- Create duplicate resource (409 Conflict)
- Create without authentication (401)
- Create without permission (403)

🔧 **Edge Cases:**
- Create with very long string values
- Create with special characters in name/email
- Create with empty strings
- Create with null values
- Create with negative numbers (if applicable)
- Create with future dates
- Create with extremely large numbers

---

## 3. PUT - Update/Replace Resource

### Definition
The **PUT** method is used to update or replace an existing resource on the server. It replaces the entire resource with the provided data.

### Characteristics
- **NOT Safe**: Modifies server data (updates resource)
- **Idempotent**: Multiple identical PUT requests result in same state
- **NOT Cacheable**: Responses are typically not cached
- **With Body**: Contains request body with complete resource data
- **Requires ID**: Must specify which resource to update (usually in URL)

### Key Difference from POST
- **PUT**: Updates existing resource (or creates if doesn't exist) - **Full replacement**
- **POST**: Always creates new resource - **Partial/new creation**

### Use Cases
- Update user profile information
- Replace entire product details
- Update order status
- Modify configuration settings
- Replace file content

### HTTP Status Codes
- `200 OK` - Resource updated, response body contains updated resource
- `201 Created` - Resource created (if using PUT to create)
- `204 No Content` - Resource updated, no response body
- `400 Bad Request` - Invalid request data
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Permission denied
- `404 Not Found` - Resource to update does not exist
- `409 Conflict` - Update conflict (version mismatch)
- `422 Unprocessable Entity` - Validation failed
- `500 Internal Server Error` - Server error

### Example in Postman
```
PUT /api/users/1 HTTP/1.1
Host: api.example.com
Content-Type: application/json
Authorization: Bearer token123

{
  "id": 1,
  "name": "John Updated",
  "email": "john.updated@example.com",
  "role": "admin"
}
```

**Response (200 OK):**
```json
{
  "id": 1,
  "name": "John Updated",
  "email": "john.updated@example.com",
  "role": "admin",
  "updatedAt": "2026-01-17T11:45:00Z"
}
```

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;
import io.restassured.response.Response;

String updateBody = "{\n" +
  "\"id\": 1,\n" +
  "\"name\": \"John Updated\",\n" +
  "\"email\": \"john.updated@example.com\",\n" +
  "\"role\": \"admin\"\n" +
"}";

Response response = RestAssured
  .given()
    .header("Content-Type", "application/json")
    .header("Authorization", "Bearer token123")
    .body(updateBody)
  .when()
    .put("https://api.example.com/api/users/1")
  .then()
    .statusCode(200)
    .body("name", equalTo("John Updated"))
    .body("email", equalTo("john.updated@example.com"))
    .extract()
    .response();
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- Update all fields of existing resource (200 OK)
- Update single field (200 OK)
- Update with valid data types (200 OK)
- Verify update is persisted

⚠️ **Negative Scenarios:**
- Update non-existent resource (404 Not Found)
- Update with missing required fields (400/422)
- Update with invalid data type (400)
- Update without authentication (401)
- Update without permission (403)
- Update with conflicting data (409)

🔧 **Edge Cases:**
- Update with empty body
- Update with null values
- Update with very long strings
- Update with special characters
- Update the same resource twice (idempotency check)
- Update with partial data (some fields)

---

## 4. DELETE - Remove Resource

### Definition
The **DELETE** method is used to delete (remove) a resource from the server.

### Characteristics
- **NOT Safe**: Modifies server data (deletes resource)
- **Idempotent**: Multiple identical DELETE requests result in same state (resource deleted)
- **NOT Cacheable**: Responses are typically not cached
- **No Body**: Typically has no request body
- **Requires ID**: Must specify which resource to delete (usually in URL)

### Use Cases
- Delete user account
- Remove product from catalog
- Cancel an order
- Delete uploaded file
- Remove configuration
- Unsubscribe from service

### HTTP Status Codes
- `200 OK` - Resource deleted, response body contains deleted resource info
- `202 Accepted` - Delete request accepted (async deletion)
- `204 No Content` - Resource deleted, no response body (most common)
- `400 Bad Request` - Invalid request
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Permission denied (cannot delete others' data)
- `404 Not Found` - Resource already deleted or never existed
- `409 Conflict` - Cannot delete due to dependencies
- `500 Internal Server Error` - Server error

### Example in Postman
```
DELETE /api/users/1 HTTP/1.1
Host: api.example.com
Authorization: Bearer token123
```

**Response (204 No Content):**
```
(Empty body, just status code)
```

Or **Response (200 OK):**
```json
{
  "message": "User deleted successfully",
  "id": 1,
  "name": "John Doe"
}
```

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;

// Simple DELETE
RestAssured
  .given()
    .header("Authorization", "Bearer token123")
  .when()
    .delete("https://api.example.com/api/users/1")
  .then()
    .statusCode(204);

// DELETE with response body verification
RestAssured
  .given()
    .header("Authorization", "Bearer token123")
  .when()
    .delete("https://api.example.com/api/users/1")
  .then()
    .statusCode(200)
    .body("message", equalTo("User deleted successfully"))
    .body("id", equalTo(1));
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- Delete existing resource (204 No Content)
- Verify resource is actually deleted (subsequent GET returns 404)
- Delete with valid authentication (204)
- Delete without sensitive data in response

⚠️ **Negative Scenarios:**
- Delete non-existent resource (404 Not Found)
- Delete without authentication (401)
- Delete without permission (403)
- Delete resource with dependencies (409 Conflict)
- Delete already deleted resource (idempotency - 204)

🔧 **Edge Cases:**
- Delete with invalid ID format (400)
- Delete the same resource twice (second should return 404 or 204)
- Delete while another user is accessing it
- Delete resource with linked data
- Soft delete vs hard delete verification

---

## 5. HEAD - Retrieve Headers Only

### Definition
The **HEAD** method is identical to GET, except the server does NOT return the message body. It returns only the headers that would be returned by a GET request.

### Characteristics
- **Safe**: Does NOT modify server data
- **Idempotent**: Multiple identical HEAD requests return same headers
- **Cacheable**: Headers can be cached
- **No Body**: Has no request body AND no response body
- **Used for**: Metadata checking without downloading body

### Use Cases
- Check if resource exists before downloading
- Check file size or type before downloading
- Check last modified date
- Validate resource availability
- Check content-type and encoding
- Determine if resource has been updated
- Verify URL validity without downloading

### HTTP Status Codes
Same as GET:
- `200 OK` - Resource exists
- `304 Not Modified` - Resource not changed
- `400 Bad Request` - Invalid request
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Access denied
- `404 Not Found` - Resource does not exist
- `500 Internal Server Error` - Server error

### Example in Postman
```
HEAD /api/users/1 HTTP/1.1
Host: api.example.com
Authorization: Bearer token123
```

**Response Headers (200 OK):**
```
HTTP/1.1 200 OK
Content-Type: application/json
Content-Length: 245
Last-Modified: 2026-01-15T10:00:00Z
ETag: "abc123def456"
Cache-Control: max-age=3600
```

*No response body*

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;

// HEAD request - check if resource exists
RestAssured
  .given()
    .header("Authorization", "Bearer token123")
  .when()
    .head("https://api.example.com/api/users/1")
  .then()
    .statusCode(200)
    .header("Content-Type", containsString("application/json"))
    .header("Content-Length", notNullValue());

// HEAD request - check last modified date
Response response = RestAssured
  .given()
    .header("Authorization", "Bearer token123")
  .when()
    .head("https://api.example.com/api/users/1")
  .then()
    .statusCode(200)
    .extract()
    .response();

String lastModified = response.getHeader("Last-Modified");
String contentLength = response.getHeader("Content-Length");
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- HEAD request returns same headers as GET (200 OK)
- HEAD request returns no body (verify empty)
- HEAD includes Content-Length header
- HEAD includes Last-Modified header
- HEAD includes ETag (if applicable)

⚠️ **Negative Scenarios:**
- HEAD for non-existent resource (404)
- HEAD without authentication (401)
- HEAD without permission (403)
- HEAD with invalid ID (400)

🔧 **Edge Cases:**
- HEAD request faster than GET (performance comparison)
- HEAD headers match GET headers exactly
- HEAD before downloading large files
- HEAD with cache validation (If-Modified-Since)

---

## 6. OPTIONS - Describe Communication Options

### Definition
The **OPTIONS** method is used to describe the communication options available for a resource. It returns information about what HTTP methods are allowed on a specific endpoint (CORS preflight, allowed methods, etc.).

### Characteristics
- **Safe**: Does NOT modify server data
- **Idempotent**: Multiple OPTIONS requests return same allowed methods
- **NOT Cacheable**: Responses are typically not cached
- **No Body**: Has no request body AND typically no response body
- **Used for**: Discovering allowed methods and CORS validation

### Use Cases
- Check what HTTP methods are allowed on an endpoint
- CORS preflight requests (automatic by browser)
- Discover API capabilities
- Check if DELETE is allowed on a resource
- Determine authentication requirements
- Validate API compliance with REST standards

### HTTP Status Codes
- `200 OK` - Request succeeded, headers contain allowed methods
- `204 No Content` - Request succeeded, no content to return
- `400 Bad Request` - Invalid request
- `401 Unauthorized` - Authentication required
- `403 Forbidden` - Access denied
- `404 Not Found` - Resource does not exist
- `405 Method Not Allowed` - OPTIONS not allowed
- `500 Internal Server Error` - Server error

### Response Headers (Key)
- `Allow`: Lists allowed HTTP methods (e.g., "GET, POST, PUT, DELETE, OPTIONS")
- `Access-Control-Allow-Methods`: For CORS (e.g., "GET, POST, PUT, DELETE")
- `Access-Control-Allow-Headers`: For CORS (e.g., "Content-Type, Authorization")
- `Access-Control-Allow-Origin`: For CORS (e.g., "*" or specific origin)
- `Access-Control-Max-Age`: How long to cache CORS preflight response

### Example in Postman
```
OPTIONS /api/users HTTP/1.1
Host: api.example.com
Origin: https://app.example.com
Access-Control-Request-Method: POST
```

**Response (200 OK):**
```
HTTP/1.1 200 OK
Allow: GET, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Origin: https://app.example.com
Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS
Access-Control-Allow-Headers: Content-Type, Authorization
Access-Control-Max-Age: 86400
```

### Example in Rest Assured (Java)
```java
import io.restassured.RestAssured;

// OPTIONS request - discover allowed methods
Response response = RestAssured
  .given()
    .header("Origin", "https://app.example.com")
    .header("Access-Control-Request-Method", "POST")
  .when()
    .options("https://api.example.com/api/users")
  .then()
    .statusCode(200)
    .header("Allow", containsString("GET"))
    .header("Allow", containsString("POST"))
    .header("Allow", containsString("PUT"))
    .header("Allow", containsString("DELETE"))
    .extract()
    .response();

String allowedMethods = response.getHeader("Allow");
System.out.println("Allowed methods: " + allowedMethods);

// Check CORS headers
String allowOrigin = response.getHeader("Access-Control-Allow-Origin");
String allowMethods = response.getHeader("Access-Control-Allow-Methods");
```

### Testing Scenarios (for API Testing)
✅ **Positive Scenarios:**
- OPTIONS returns Allow header (200 OK)
- Allow header contains expected methods
- CORS headers present for cross-origin requests
- OPTIONS for public endpoint allowed
- Access-Control-Max-Age prevents repeated preflight

⚠️ **Negative Scenarios:**
- OPTIONS on restricted resource (401/403)
- Missing CORS headers on cross-origin request
- Wrong origin in Access-Control-Allow-Origin
- Requested method not in Allow header

🔧 **Edge Cases:**
- OPTIONS on non-existent resource (404)
- OPTIONS with different origin values
- OPTIONS with different Access-Control-Request-Method values
- CORS preflight caching verification

---

## HTTP Methods Comparison Table

| Method | Safe | Idempotent | Cacheable | Body | Use Case | Status Code |
|--------|------|-----------|-----------|------|----------|-------------|
| **GET** | ✅ Yes | ✅ Yes | ✅ Yes | ❌ No | Retrieve data | 200, 304, 404 |
| **POST** | ❌ No | ❌ No | ❌ No | ✅ Yes | Create data | 201, 200, 400, 409 |
| **PUT** | ❌ No | ✅ Yes | ❌ No | ✅ Yes | Update/Replace | 200, 201, 204, 400 |
| **DELETE** | ❌ No | ✅ Yes | ❌ No | ❌ No | Delete data | 204, 200, 404, 409 |
| **HEAD** | ✅ Yes | ✅ Yes | ✅ Yes | ❌ No | Check headers | 200, 304, 404 |
| **OPTIONS** | ✅ Yes | ✅ Yes | ❌ No | ❌ No | Discover methods | 200, 204, 405 |

---

## Best Practices for API Testing

### 1. GET Method Testing
```java
// Test successful retrieval
RestAssured.given()
  .when().get("/api/users/1")
  .then().statusCode(200);

// Test not found scenario
RestAssured.given()
  .when().get("/api/users/99999")
  .then().statusCode(404);

// Test with query parameters
RestAssured.given()
  .queryParam("role", "admin")
  .queryParam("status", "active")
  .when().get("/api/users")
  .then().statusCode(200);
```

### 2. POST Method Testing
```java
// Test successful creation
RestAssured.given()
  .contentType("application/json")
  .body("{\"name\":\"John\",\"email\":\"john@example.com\"}")
  .when().post("/api/users")
  .then().statusCode(201)
  .body("id", notNullValue());

// Test validation error
RestAssured.given()
  .contentType("application/json")
  .body("{\"name\":\"\"}")  // Missing required field
  .when().post("/api/users")
  .then().statusCode(422);
```

### 3. PUT Method Testing
```java
// Test successful update
RestAssured.given()
  .contentType("application/json")
  .body("{\"id\":1,\"name\":\"Updated\",\"email\":\"updated@example.com\"}")
  .when().put("/api/users/1")
  .then().statusCode(200);

// Test idempotency (same request twice)
Response first = RestAssured.given()
  .contentType("application/json")
  .body("{\"id\":1,\"name\":\"Updated\",\"email\":\"updated@example.com\"}")
  .when().put("/api/users/1");

Response second = RestAssured.given()
  .contentType("application/json")
  .body("{\"id\":1,\"name\":\"Updated\",\"email\":\"updated@example.com\"}")
  .when().put("/api/users/1");

// Both should return same status
assert first.statusCode() == second.statusCode();
```

### 4. DELETE Method Testing
```java
// Test successful deletion
RestAssured.given()
  .when().delete("/api/users/1")
  .then().statusCode(204);

// Verify deletion (GET should return 404)
RestAssured.given()
  .when().get("/api/users/1")
  .then().statusCode(404);

// Test idempotency (delete twice)
RestAssured.given().when().delete("/api/users/1").then().statusCode(204);
RestAssured.given().when().delete("/api/users/1").then().statusCode(204); // Should still pass
```

### 5. HEAD Method Testing
```java
// Compare HEAD vs GET headers
Response head = RestAssured.given()
  .when().head("/api/users/1")
  .extract().response();

Response get = RestAssured.given()
  .when().get("/api/users/1")
  .extract().response();

// Verify HEAD has no body but same headers
assert head.statusCode() == get.statusCode();
assert head.body().asString().isEmpty();
assert get.body().asString().length() > 0;
```

### 6. OPTIONS Method Testing
```java
// Check allowed methods
RestAssured.given()
  .when().options("/api/users")
  .then().statusCode(200)
  .header("Allow", containsString("GET"))
  .header("Allow", containsString("POST"))
  .header("Allow", containsString("PUT"))
  .header("Allow", containsString("DELETE"));
```

---

## Summary

| Method | Primary Function | Modifies Data | Multiple Calls Result | Best for |
|--------|------------------|---------------|-----------------------|----------|
| **GET** | Retrieve | ❌ No | Same result | Fetching data |
| **POST** | Create | ✅ Yes | Multiple creations | Adding new resources |
| **PUT** | Update/Replace | ✅ Yes | Same final state | Updating resources |
| **DELETE** | Delete | ✅ Yes | Same final state | Removing resources |
| **HEAD** | Check existence | ❌ No | Same result | Checking availability |
| **OPTIONS** | Discover options | ❌ No | Same result | API exploration |

Understanding these HTTP methods is crucial for effective API testing and Rest Assured framework usage!
