# POST, valid directory with image files
# replace directory path to test
# should return a max of 5 (unsorted) image filenames:
# {"image_filenames": [file1.jpg, file2.png, file3.png, file4.png, file5.png], "is_valid_directory": true}
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/images"}' \
       	http://localhost:8000/validate-directory

# POST, valid directory without image files
# replace directory path to test
# should return {"image_filenames": [], "is_valid_directory": true}
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/"}' \
       	http://localhost:8000/validate-directory

# POST, invalid directory
# should return {"image_filenames": [], "is_valid_directory": false}
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "2!0sf&"}' \
       	http://localhost:8000/validate-directory

# POST, Invalid Content-type 
# should return 400 Bad Request response status code
curl -v -X POST -H "Content-type: text" \
       	-d '"directory_path"' \
       	http://localhost:8000/validate-directory

# POST, valid directory, invalid json attribute
# should return 400 Bad Request response status code
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/images"}' \
       	http://localhost:8000/validate-directory

# POST, valid directory, invalid json
# should return 400 Bad Request response status code
curl -v -X POST -H "Content-type: application/json" \
       	-d '{"directory_path": "/home/j/Documents/coursework/cs_361/assignment_8/image-directory-validator/images", "extra_attribute": "val"}' \
       	http://localhost:8000/validate-directory

# GET 
# should return 405 Method Not Allowed
curl -v http://localhost:8000/validate-directory

# DELETE 
# should return 405 Method Not Allowed
curl -v --request DELETE http://localhost:8000/validate-directory
