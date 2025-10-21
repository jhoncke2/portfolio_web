'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "24bc71911b75b5f8135c949e27a2984e",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "afbad595473125d9919e55440bb9d114",
"index.html": "e71d2d68fbf2b46643c632e1aafeeba2",
"/": "e71d2d68fbf2b46643c632e1aafeeba2",
"assets/shaders/stretch_effect.frag": "40d68efbbf360632f614c731219e95f0",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "c01ac4dca9cfda80e1e2d082d602c843",
"assets/assets/drawables/playstore.png": "22ebaaf14742728202402db286a58d26",
"assets/assets/drawables/vs_code.png": "8dfd6c1e8498b8971ef60f8f8de9f003",
"assets/assets/drawables/questionary_main_light.png": "268b632b440a39b0af51277c81c134c3",
"assets/assets/drawables/profile.jpg": "fc573417e8f635289bc01e4641d3ca61",
"assets/assets/drawables/android_studio.png": "0c69b8ed4b1048b2765a717a88e1e8ee",
"assets/assets/drawables/header_2.png": "269a8de8938beda4e689489a5c21ddaf",
"assets/assets/drawables/firebase_raw.png": "68767c27baddafeea5e6a02fa2d79e11",
"assets/assets/drawables/chat_gpt.png": "0c0ed475f2f7ba37b3beb6670ea6f9d7",
"assets/assets/drawables/kai_living_main.png": "0c69b66d085ffe3d3144be5f91205437",
"assets/assets/drawables/postman.png": "76bb1bb90726d881d41196e547f82679",
"assets/assets/drawables/firebase.png": "6cbbf173f3be573edca4f2b8b7399543",
"assets/assets/drawables/abilities_landscape.png": "1865e4775c03e9bec10d0c8acb784133",
"assets/assets/drawables/echo_card_main.png": "458b101115943493f2e659f611af943e",
"assets/assets/drawables/jetpack_compose.png": "47d68a84872903e5728616f731619676",
"assets/assets/drawables/abilities_portrait.png": "24f631f25112cd8454d602d1c2ec4f6b",
"assets/assets/drawables/header.png": "4b198ff7625acecb419b1167d596192d",
"assets/assets/drawables/flutter.png": "068a2f1c3ee08173935031f935a29681",
"assets/assets/drawables/appstore.png": "135e0d859fa7edd488749e1daa12bb9e",
"assets/assets/drawables/questionary_main_dark.jpg": "a12ef0154f3cd704a16ea903f59abeae",
"assets/assets/drawables/node_js.png": "a41475ff79a461158d72d9fe63e537d5",
"assets/assets/drawables/kaidoc_main.jpg": "87eb3c5d4bfa424481baeee3f41f7a64",
"assets/assets/drawables/github.png": "e5c550c3d15d5aa002af051e26d18cfc",
"assets/assets/drawables/portfolio_main.png": "696fc7d5ea759c0552554831165db494",
"assets/assets/drawables/python.png": "9bae4c5676b0e881ea6d68894ddeebce",
"assets/assets/drawables/job_experience.png": "76ccd8958fde3c119dbf5fd46c446d66",
"assets/fonts/MaterialIcons-Regular.otf": "d7b4a86379686d51c2c49e8ec3243759",
"assets/NOTICES": "eec37010ffd84726ff2f9268c8467c38",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "312deb7b398bde8609a7e00786501c25",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "463a85a60d7703e96a5aebda8a78b0e2",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "a2eb084b706ab40c90610942d98886ec",
"assets/FontManifest.json": "67a28da3784fc091c2f816d615fbf08a",
"assets/AssetManifest.bin": "a9498de22439ad2bdf5f162267af9997",
"canvaskit/chromium/canvaskit.wasm": "a726e3f75a84fcdf495a15817c63a35d",
"canvaskit/chromium/canvaskit.js": "a80c765aaa8af8645c9fb1aae53f9abf",
"canvaskit/chromium/canvaskit.js.symbols": "e2d09f0e434bc118bf67dae526737d07",
"canvaskit/skwasm_heavy.wasm": "b0be7910760d205ea4e011458df6ee01",
"canvaskit/skwasm_heavy.js.symbols": "0755b4fb399918388d71b59ad390b055",
"canvaskit/skwasm.js": "8060d46e9a4901ca9991edd3a26be4f0",
"canvaskit/canvaskit.wasm": "9b6a7830bf26959b200594729d73538e",
"canvaskit/skwasm_heavy.js": "740d43a6b8240ef9e23eed8c48840da4",
"canvaskit/canvaskit.js": "8331fe38e66b3a898c4f37648aaf7ee2",
"canvaskit/skwasm.wasm": "7e5f3afdd3b0747a1fd4517cea239898",
"canvaskit/canvaskit.js.symbols": "a3c9f77715b642d0437d9c275caba91e",
"canvaskit/skwasm.js.symbols": "3a4aadf4e8141f284bd524976b1d6bdc",
"favicon.png": "2f3d48b095d5bf4faccabffe7bb4d8b5",
"flutter_bootstrap.js": "c96f0ded6a09422c12f136414a334595",
"version.json": "cc132570d6d238130e38adc59e1f998d",
"main.dart.js": "3022332073db489e7bc1c68f2cacac83"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
