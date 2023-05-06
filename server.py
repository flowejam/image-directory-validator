import os
from flask import Flask, json, request
import werkzeug


app = Flask(__name__)


@app.route('/validate-directory', methods=['POST'])
def validate_and_preview():
    if request.content_type != 'application/json':
        raise werkzeug.exceptions.BadRequest

    if 'directory_path' not in request.json:
        raise werkzeug.exceptions.BadRequest

    request_data = request.json
    if len(request_data.keys()) > 1:
        raise werkzeug.exceptions.BadRequest

    directory_path = request_data['directory_path']
    response_data = {}

    is_valid_dir = os.path.isdir(directory_path)
    response_data['is_valid_directory'] = is_valid_dir

    # should handle most formats listed here:
    # https://developer.mozilla.org/en-US/docs/Web/Media/Formats/Image_types#common_image_file_types
    image_ext_set = {
        '.jpg',
        '.png',
        '.jpeg',
        '.avif',
        '.jfif',
        '.pjpeg',
        '.pjp',
        '.svg',
        '.webp'
    }
    list_of_images = []

    if is_valid_dir:
        with os.scandir(directory_path) as dir_iter:
            for entry in dir_iter:
                if os.path.splitext(entry.path)[1] in image_ext_set:
                    list_of_images.append(entry.name)
                if len(list_of_images) >= 5:
                    break

    response_data['image_filenames'] = list_of_images

    result = json.dumps(response_data)

    return (result, 200)


if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8000))
    app.run(port=port, debug=True)

