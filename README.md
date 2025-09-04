# geodocker

A Docker container with GDAL and AWS CLI pre-installed for geospatial workflows.

## Description

This project provides a convenient Docker image based on OSGEO's GDAL Ubuntu image, enhanced with AWS CLI v2. It's designed for geospatial data processing tasks that require both GDAL tools and AWS integration.

## Setup

To simplify usage, you can copy or symlink the `geo` script to a directory in your system's PATH, such as `/usr/local/bin`:

```bash
# Copy the script
sudo cp geo /usr/local/bin/

# Or create a symlink
sudo ln -s $(pwd)/geo /usr/local/bin/geo
```

This allows you to run the `geo` command from anywhere without specifying its path.

## Usage

The `geo` script provides an easy way to run commands inside the Docker container with your current directory mounted as the working directory.

```bash
# Run GDAL commands
./geo gdalinfo myfile.tif

# Run AWS CLI commands
./geo aws s3 ls

# Run any other command available in the container
./geo ogr2ogr output.shp input.geojson
```

The script automatically:
- Mounts your current directory to `/working` inside the container
- Sets the working directory to `/working`

## Building

To build the Docker image:

```bash
make build
```

## License

MIT License - See LICENSE file for details