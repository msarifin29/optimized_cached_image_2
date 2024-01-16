import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:optimized_cached_image/optimized_cached_image.dart';

class BasicContent extends StatelessWidget {
  const BasicContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _blurHashImage(),
            _sizedContainer(
              const Image(
                image: OptimizedCacheImageProvider(
                  'https://loremflickr.com/100/100/music?lock=8',
                ),
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                imageUrl: 'https://loremflickr.com/100/100/music?lock=7',
                progressIndicatorBuilder: (context, url, progress) => Center(
                  child: CircularProgressIndicator(
                    value: progress.progress,
                  ),
                ),
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                imageUrl: 'https://loremflickr.com/100/100/music?lock=6',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                imageUrl: 'https://loremflickr.com/100/100/music?lock=5',
                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.colorBurn,
                      ),
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            OptimizedCacheImage(
              imageUrl: 'https://loremflickr.com/100/100/music?lock=4',
              placeholder: (context, url) => const CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 150,
              ),
              imageBuilder: (context, image) => CircleAvatar(
                backgroundImage: image,
                radius: 150,
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                imageUrl: 'https://loremflickr.com/100/100/music?lock=2',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                imageUrl: 'not a uri at all',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            _sizedContainer(
              OptimizedCacheImage(
                maxHeightDiskCache: 10,
                imageUrl: 'https://loremflickr.com/100/100/music?lock=3',
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
                fadeOutDuration: const Duration(seconds: 1),
                fadeInDuration: const Duration(seconds: 3),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _blurHashImage() {
    return SizedBox(
      width: double.infinity,
      child: OptimizedCacheImage(
        placeholder: (context, url) => const AspectRatio(
          aspectRatio: 1.6,
          child: BlurHash(hash: 'LEHV6nWB2yk8pyo0adR*.7kCMdnj'),
        ),
        imageUrl: 'https://loremflickr.com/100/100/music?lock=1',
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _sizedContainer(Widget child) {
    return SizedBox(
      width: 300.0,
      height: 150.0,
      child: Center(child: child),
    );
  }
}
