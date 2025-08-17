swagger: "2.0"
info:
  title: My API
  description: API Gateway to Cloud Run
  version: 1.0.0
paths:
  /:
    get:
      operationId: rootGet
      x-google-backend:
        address: ${cloud_run_url}
      responses:
        '200':
          description: Success