# Image directory validator

<h2> Instructions for requesting data: </h2>
Send an HTTP request with the POST method, and must have Content-type application/json (a bad request response will be sent otherwise). The JSON sent in the body of the request should be in the following format:
{"directory_path": "full_path_to_directory"} 

This is an example request (replace with your directory path):

```
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/images"}' \
       	http://localhost:8000/validate-directory
```

<h2> Instructions for receiving data: </h2>
The data will be sent back as a response to the request. 

The example for how to receive data is the same:
```
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/images"}' \
       	http://localhost:8000/validate-directory
```

The JSON data sent back will be in the following format:
```
{"image_filenames": [file1.jpg, file2.png, file3.png, file4.png, file5.png], "is_valid_directory": true}
```

The response should return a max of 5 (unsorted) image filenames, and a boolean value depending on whether the directory sent in the request is valid or not.

<h2> Dependencies/installation </h2>

```
python3 -m pip install -r requirements.txt
```

<h2> Running the microservice </h2>
Run with the following command:

```
gunicorn --bind 127.0.0.1:8000 wsgi:app
```
