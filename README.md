# Steganography

Steganography is the act of hiding information within another message or object, in a way that is not easily detectable by humans.

This script compresses a file to a zip file and then append the zip file to the end of the jpg or png file.

## Installation

1. Clone the repo
2. Run the script

## Usage

``` 
> ./Encrypt.ps1 FilePath.txt ImagePath.jpg
```

**Obs! The scipt will change the image file and NOT create a copy of the image**

## Contributing
Thanks to Computerphile and Dr.Pound for the insperation for this small project! Check out there video <a href="https://www.youtube.com/watch?v=TWEXCYQKyDc&t=255s">here</a>
<a href="https://www.youtube.com/watch?v=TWEXCYQKyDc&t=255s"><img src="https://img.youtube.com/vi/TWEXCYQKyDc/maxresdefault.jpg" alt="Computerphile"></a>

In there video they explain a diffrent approach to solve steganography with code. (A better version then mine) How you can nest a zip file into the image file instead of appending the zip file to the end og the image file.

## Examples
<img width="305" alt="image" src="https://user-images.githubusercontent.com/50596493/224512183-5d5e0323-d8fc-4d3a-87ee-e8667dbc9224.png">

The size to the left is the original file while the size to the right is the NEW file.
The zip file is just appended onto the jpg image and is not neted into the jpg image.

## Known Issues
The -h or -help does not work at the moment. The script will skip the arg and crach later on because it cannot find a path namned -h or -help.

## License
This project has no license, use it however you want to use it.

## Future Development
I plan to fix the -h and -help issue later, but apart from that I do not plan to expand this project. Would like to write a new steganography program that nest the zip file into the jpg image, but would probably pick a deffrent language for that.
