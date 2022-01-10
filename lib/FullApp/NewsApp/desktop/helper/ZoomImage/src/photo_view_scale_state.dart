enum PhotoViewScaleState {
  initial,
  covering,
  originalSize,
  zoomedIn,
  zoomedOut,
}

// Todo: change for extension when they arrive
bool isScaleStateZooming(PhotoViewScaleState scaleState) {
  return scaleState == PhotoViewScaleState.zoomedIn ||
      scaleState == PhotoViewScaleState.zoomedOut;
}